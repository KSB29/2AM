package com.project.splace.main.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.main.model.service.MainService;
import com.project.splace.space.model.vo.Space;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	
	// 새로 등록된 공간 	
	@RequestMapping("nSpaceList.kh")
	public ModelAndView newSpaceList(ModelAndView mv) {
		//공간 리스트 		
		ArrayList<Space> newSpaceList = mainService.newSpaceList();
		
		if(newSpaceList != null) {
			mv.addObject("newSpaceList",newSpaceList);
			mv.setViewName("/");
		}else {
			mv.setViewName("/");
		}
	   return mv;
		
		
	}

}
