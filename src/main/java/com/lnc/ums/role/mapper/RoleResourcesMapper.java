package com.lnc.ums.role.mapper;

import com.lnc.ums.role.po.RoleResourcesPo;

public interface RoleResourcesMapper {

    void insert(RoleResourcesPo roleResources);

    void delete(int roleId);

}
