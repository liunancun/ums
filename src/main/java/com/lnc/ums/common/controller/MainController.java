package com.lnc.ums.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {

	@RequestMapping("main")
	public String main(Model model) {

		// 设置当前菜单ID
		model.addAttribute("menuId", "main");

		return "main";
	}

	@RequestMapping("progress")
	public @ResponseBody String progress(HttpSession session) {

		Object progress = session.getAttribute("progress");
		if (progress != null) {
			return String.valueOf(progress);
		}

		return "0";
	}

}
