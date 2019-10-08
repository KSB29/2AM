package com.project.splace.search.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.search.model.service.SearchService;
import com.project.splace.search.model.vo.Search;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;

import oracle.net.aso.s;
@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	// 검색 결과 목록 출력
	@RequestMapping("search.sp")
	public ModelAndView searchList(Search search,ModelAndView mv) {
		
		ArrayList<Space> searchList = searchService.searchList(search);
		
		for(Space s: searchList) {
			/*
			 * int spaceId = (s.getSpaceId()); System.out.println(spaceId);
			 */
			System.out.println("왜그래.."+s);
		}
		if(searchList !=null) {
					/*
					 * ArrayList<Price> priceList = searchService.priceList(spaceId);
					 * System.out.println("아이디"+spaceId);
					 */
			mv.addObject("searchList", searchList);
			mv.addObject("search",search);
			mv.setViewName("search/searchList");
		}else {
			mv.setViewName("search/searchList");
		}
		return mv;
	}
	
	// 상세 검색 결과 목록 출력
	
	 @RequestMapping("searchDetail.sp") 
	 public ModelAndView searchDetailList(Search search, ModelAndView mv) { 
		 System.out.println(search);

		 ArrayList<Space> searchList = searchService.searchDetailList(search);
	  
	  for(Space s: searchList) {
		 
		  System.out.println(s); 
		  
	  }
	  if(searchList !=null) {
			mv.addObject("searchList", searchList);
			mv.addObject("search",search);
			mv.setViewName("search/searchList");
		}else {
			mv.setViewName("search/searchList");
		}
			return mv;
	  
	  }
	 
	
}
