package com.lnc.ums.menu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.lnc.ums.menu.bean.MenuBean;
import com.lnc.ums.menu.mapper.MenuMapper;
import com.lnc.ums.menu.service.MenuService;

public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<MenuBean> query() {

        List<MenuBean> menus = menuMapper.query();

        return menus;
    }

}
