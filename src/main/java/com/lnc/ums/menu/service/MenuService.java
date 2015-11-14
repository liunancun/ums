package com.lnc.ums.menu.service;

import java.util.List;

import com.lnc.ums.menu.bean.MenuBean;

public interface MenuService {

    List<MenuBean> query(boolean admin);

}
