package com.lnc.ums.menu.service;

import java.util.List;

import com.lnc.ums.menu.po.MenuPo;

public interface MenuService {

    List<MenuPo> query(boolean admin);

}
