package com.lnc.ums.role.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.lnc.ums.common.TreeNode;
import com.lnc.ums.role.bean.RoleBean;

public interface RoleService {

    List<RoleBean> query(RoleBean role);

    List<RoleBean> query(RoleBean role, PageBounds pageBounds);

    RoleBean queryById(int id);

    void save(RoleBean role);

    void delete(int id);

    void update(RoleBean role);

    List<TreeNode> queryTreeNodes();

    List<TreeNode> queryTreeNodes(int id);

}
