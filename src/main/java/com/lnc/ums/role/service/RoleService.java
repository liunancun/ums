package com.lnc.ums.role.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.role.po.RolePo;
import com.lnc.ums.role.po.TreeNode;

public interface RoleService {

    List<RolePo> query(RolePo role);

    List<RolePo> query(RolePo role, PageBounds pageBounds);

    RolePo queryById(int id);

    void save(RolePo role);

    void delete(int id);

    void update(RolePo role);

    List<TreeNode> queryTreeNodes();

    List<TreeNode> queryTreeNodes(int id);

}
