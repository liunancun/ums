package com.lnc.ums.role.mapper;

import org.apache.ibatis.annotations.Param;

public interface RoleResourcesMapper {

    void insert(@Param("roleId") int roleId, @Param("resourcesId") String resourcesId);

    void delete(int roleId);

}
