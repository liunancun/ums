package com.lnc.ums.common.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lnc.ums.common.utils.MD5;
import com.lnc.ums.menu.po.MenuPo;
import com.lnc.ums.user.po.UserPo;
import com.lnc.ums.user.service.UserService;

@Controller
public class LoginController {

	@Resource
	private UserService userService;

	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpSession session, String username, String password) {

		if (!StringUtils.isEmpty(username) || !StringUtils.isEmpty(password)) {
			UserPo user = userService.queryByUsername(username);
			// 加密输入的密码
			password = MD5.encode(password);
			if (user != null && password.equals(user.getPassword())) {
				// 保存用户信息
				session.setAttribute("user", user);

				// 初始化菜单
				String path = request.getContextPath();
				List<MenuPo> menus = new ArrayList<MenuPo>();
				MenuPo mainMenu = new MenuPo();
				mainMenu.setId("main");
				mainMenu.setName("主页");
				mainMenu.setUrl(path + "/main.action");
				menus.add(mainMenu);
				MenuPo dataMenu = new MenuPo();
				dataMenu.setId("data");
				dataMenu.setName("数据管理");
				dataMenu.setUrl(path + "/data/list.action");
				menus.add(dataMenu);
				MenuPo userMenu = new MenuPo();
				userMenu.setId("user");
				userMenu.setName("用户管理");
				userMenu.setUrl(path + "/user/list.action");
				menus.add(userMenu);
				session.setAttribute("menus", menus);
			}
		}

		return "redirect:main.action";
	}

}
