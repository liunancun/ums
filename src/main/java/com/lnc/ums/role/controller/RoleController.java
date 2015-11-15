package com.lnc.ums.role.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.common.TreeNode;
import com.lnc.ums.role.bean.RoleBean;
import com.lnc.ums.role.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @RequestMapping("main")
    public String main() {

        return "role/main";
    }

    @RequestMapping("list")
    public String list(Model model, RoleBean role, @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "10") int limit) {

        // 设置当前菜单ID
        model.addAttribute("menuId", "role");

        List<RoleBean> roles = roleService.query(role, new PageBounds(page, limit));

        model.addAttribute("roles", roles);

        return "role/list";
    }

    @RequestMapping("initAdd")
    public String initAdd(Model model) {

        List<TreeNode> treeNodes = roleService.queryTreeNodes();

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String treeNode = objectMapper.writeValueAsString(treeNodes);
            model.addAttribute("treeNode", treeNode);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "role/add";
    }

    @RequestMapping("add")
    public String add(RoleBean role) {

        roleService.save(role);

        return "redirect:list.action";
    }

    @RequestMapping("view")
    public String view(Model model, int id) {

        RoleBean role = roleService.queryById(id);

        model.addAttribute("role", role);

        List<TreeNode> treeNodes = roleService.queryTreeNodes(id);

        List<TreeNode> removeNodes = new ArrayList<TreeNode>();
        for (TreeNode treeNode : treeNodes) {
            if (!treeNode.isChecked()) {
                removeNodes.add(treeNode);
            }
        }
        treeNodes.removeAll(removeNodes);

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String treeNode = objectMapper.writeValueAsString(treeNodes);
            model.addAttribute("treeNode", treeNode);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "role/view";
    }

    @RequestMapping("initEdit")
    public String initEdit(Model model, int id) {

        RoleBean role = roleService.queryById(id);

        model.addAttribute("role", role);

        List<TreeNode> treeNodes = roleService.queryTreeNodes(id);

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String treeNode = objectMapper.writeValueAsString(treeNodes);
            model.addAttribute("treeNode", treeNode);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return "role/edit";
    }

    @RequestMapping("edit")
    public String edit(RoleBean role) {

        roleService.update(role);

        return "redirect:list.action";
    }

    @RequestMapping("delete")
    public String delete(int id) {

        roleService.delete(id);

        return "redirect:list.action";
    }

}
