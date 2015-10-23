package com.lnc.ums.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("main")
	public String main(Model model) {

		// 设置当前菜单ID
		model.addAttribute("menuId", "main");

		return "main";
	}

}
