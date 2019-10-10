package com.project.splace.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("adminHome.sp")
	public String goAdminHome() {
		return "admin/adminHome";
	}
}
