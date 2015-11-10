package com.lnc.ums.role.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.menu.mapper.MenuMapper;
import com.lnc.ums.menu.po.MenuPo;
import com.lnc.ums.role.mapper.ResourcesMapper;
import com.lnc.ums.role.mapper.RoleMapper;
import com.lnc.ums.role.mapper.RoleResourcesMapper;
import com.lnc.ums.role.po.ResourcesPo;
import com.lnc.ums.role.po.RolePo;
import com.lnc.ums.role.po.TreeNode;
import com.lnc.ums.role.service.RoleService;

public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private ResourcesMapper resourcesMapper;

    @Resource
    private RoleResourcesMapper roleResourcesMapper;

    @Override
    public List<RolePo> query(RolePo role) {

        List<RolePo> roles = roleMapper.query(role);

        return roles;
    }

    @Override
    public List<RolePo> query(RolePo role, PageBounds pageBounds) {

        List<RolePo> roles = roleMapper.query(role, pageBounds);

        return roles;
    }

    @Override
    public RolePo queryById(int id) {

        RolePo role = roleMapper.queryById(id);

        List<String> resources = roleMapper.queryResources(id);
        role.setResources(resources);

        return role;
    }

    @Override
    public void save(RolePo role) {
        roleMapper.insert(role);

        int roleId = role.getId();

        roleResourcesMapper.delete(roleId);

        List<String> resources = role.getResources();
        for (String resourcesId : resources) {
            roleResourcesMapper.insert(roleId, resourcesId);
        }
    }

    @Override
    public void delete(int id) {
        roleMapper.delete(id);
    }

    @Override
    public void update(RolePo role) {

        roleMapper.update(role);

        int roleId = role.getId();

        roleResourcesMapper.delete(roleId);

        List<String> resources = role.getResources();
        for (String resourcesId : resources) {
            roleResourcesMapper.insert(roleId, resourcesId);
        }
    }

    @Override
    public List<TreeNode> queryTreeNodes() {

        List<TreeNode> treeNodes = new ArrayList<TreeNode>();

        List<MenuPo> menus = menuMapper.query();
        if (menus != null) {
            for (MenuPo menu : menus) {
                TreeNode treeNode = new TreeNode();
                treeNode.setId(menu.getId());
                treeNode.setName(menu.getName());
                treeNodes.add(treeNode);
            }
        }

        List<ResourcesPo> resourcess = resourcesMapper.query();
        if (resourcess != null) {
            for (ResourcesPo resources : resourcess) {
                TreeNode treeNode = new TreeNode();
                treeNode.setId(resources.getId());
                treeNode.setName(resources.getName());
                treeNode.setPid(resources.getMenuId());
                treeNodes.add(treeNode);
            }
        }

        return treeNodes;
    }

    @Override
    public List<TreeNode> queryTreeNodes(int id) {

        List<TreeNode> treeNodes = new ArrayList<TreeNode>();

        List<String> ids = roleMapper.queryResources(id);

        List<ResourcesPo> resourcess = resourcesMapper.query();
        if (resourcess != null) {
            for (ResourcesPo resources : resourcess) {
                TreeNode treeNode = new TreeNode();
                treeNode.setId(resources.getId());
                treeNode.setName(resources.getName());
                treeNode.setPid(resources.getMenuId());
                if (ids.contains(resources.getId())) {
                    treeNode.setChecked(true);
                    ids.add(resources.getMenuId());
                }
                treeNodes.add(treeNode);
            }
        }

        List<MenuPo> menus = menuMapper.query();
        if (menus != null) {
            for (MenuPo menu : menus) {
                TreeNode treeNode = new TreeNode();
                treeNode.setId(menu.getId());
                treeNode.setName(menu.getName());
                treeNode.setChecked(ids.contains(menu.getId()));
                treeNodes.add(treeNode);
            }
        }

        return treeNodes;
    }

}
