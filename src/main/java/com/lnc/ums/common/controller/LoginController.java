package com.lnc.ums.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lnc.ums.common.utils.MD5;
import com.lnc.ums.menu.bean.MenuBean;
import com.lnc.ums.menu.service.MenuService;
import com.lnc.ums.user.bean.UserBean;
import com.lnc.ums.user.service.UserService;

@Controller
public class LoginController {

    @Resource
    private UserService userService;

    @Resource
    private MenuService menuService;

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpSession session, String username, String password) {

        // 用户名密码必须输入
        if (!StringUtils.isEmpty(username) || !StringUtils.isEmpty(password)) {
            // 根据用户名查询用户信息
            UserBean user = userService.queryByUsername(username);
            // 对密码进行MD5加密后比较
            password = MD5.encode(password);
            if (user != null && password.equals(user.getPassword())) {
                // 保存用户信息到session
                session.setAttribute("user", user);

                // 查询菜单
                List<MenuBean> menus = menuService.query();
                session.setAttribute("menus", menus);
            }
        }

        return "redirect:main.action";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

}
