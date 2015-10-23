package com.lnc.ums.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("data")
public class DataController {

	@RequestMapping("list")
	public String list(Model model) {

		// 设置当前菜单ID
		model.addAttribute("menuId", "data");

		return "data/list";
	}

	@RequestMapping("initAdd")
	public String initAdd() {
		return "data/add";
	}

	@RequestMapping("add")
	public String add() {
		return "redirect:list.action";
	}

	@RequestMapping("initEdit")
	public String initEdit() {
		return "data/edit";
	}

	@RequestMapping("edit")
	public String edit() {
		return "redirect:list.action";
	}

	@RequestMapping("delete")
	public String delete() {
		return "redirect:list.action";
	}

}
