package com.lnc.ums.common.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lnc.ums.common.utils.MD5;
import com.lnc.ums.menu.po.MenuPo;
import com.lnc.ums.menu.service.MenuService;
import com.lnc.ums.user.po.UserPo;
import com.lnc.ums.user.service.UserService;

@Controller
public class LoginController {

    @Resource
    private UserService userService;

    @Resource
    private MenuService menuService;

    @RequestMapping("login")
    public String login(HttpServletRequest request, HttpSession session, String username, String password) {

        // 用户名密码必须输入
        if (!StringUtils.isEmpty(username) || !StringUtils.isEmpty(password)) {
            // 根据用户名查询用户信息
            UserPo user = userService.queryByUsername(username);
            // 对密码进行MD5加密后比较
            password = MD5.encode(password);
            if (user != null && password.equals(user.getPassword())) {
                // 保存用户信息到session
                session.setAttribute("user", user);

                // 根据用户信息查询其所属菜单
                List<MenuPo> menus = menuService.query(user.isAdmin());
                session.setAttribute("menus", menus);
            }
        }

        return "redirect:main.action";
    }

}
