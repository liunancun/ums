package com.lnc.ums.menu.mapper;

import java.util.List;

import com.lnc.ums.menu.po.MenuPo;

public interface MenuMapper {

    List<MenuPo> query(MenuPo menu);

}
