package com.lnc.ums.role.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.role.po.RolePo;
import com.lnc.ums.role.service.RoleService;

@Controller
@RequestMapping("role")
public class RoleController {

    @Resource
    private RoleService roleService;

    @RequestMapping("list")
    public String list(Model model, RolePo role, @RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "10") int limit) {

        // 设置当前菜单ID
        model.addAttribute("menuId", "role");

        List<RolePo> roles = roleService.query(role, new PageBounds(page, limit));

        model.addAttribute("roles", roles);

        return "role/list";
    }

    @RequestMapping("initAdd")
    public String initAdd() {
        return "role/add";
    }

    @RequestMapping("add")
    public String add(RolePo role) {

        roleService.save(role);

        return "redirect:list.action";
    }

    @RequestMapping("view")
    public String view(Model model, int id) {

        RolePo role = roleService.queryById(id);

        model.addAttribute("role", role);

        return "role/view";
    }

    @RequestMapping("initEdit")
    public String initEdit(Model model, int id) {

        RolePo role = roleService.queryById(id);

        model.addAttribute("role", role);

        return "role/edit";
    }

    @RequestMapping("edit")
    public String edit(RolePo role) {

        roleService.update(role);

        return "redirect:list.action";
    }

    @RequestMapping("delete")
    public String delete(int id) {

        roleService.delete(id);

        return "redirect:list.action";
    }

}
