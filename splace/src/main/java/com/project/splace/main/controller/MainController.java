package com.project.splace.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.splace.main.model.service.MainService;
import com.project.splace.main.model.vo.Notice;
import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.vo.Space;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	
	// 새로 등록된 공간 리스트 조회
	@ResponseBody
	@RequestMapping(value="newSpace.sp", produces="application/json; charset=utf8")
	public String newSpaceList() {
		//공간 리스트 		
		ArrayList<Space> newSpace = mainService.newSpace();
		
		System.out.println("새로운 공간"+newSpace);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(newSpace);
		
	}

	
	// 추천 공간 리스트 조회
	@ResponseBody
	@RequestMapping(value="bestSpace.sp", produces="application/json; charset=utf8")
	public String bestSpaceList() {
		//공간 리스트 		
		ArrayList<Space> bestSpace = mainService.bestSpace();
		
		System.out.println("추천 공간"+bestSpace);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(bestSpace);
		
	}
	
	//알림 조회
	@ResponseBody
	@RequestMapping(value="alarmList.sp", produces="application/json; charset=utf8")
	public String noticeSelectList(String memberId,HttpSession session) {
		String userId = ((Member)session.getAttribute("loginUser")).getMemberId();
		System.out.println("유저 아이디"+userId);
		
		ArrayList<Notice> NoticeArr = mainService.noticeSelect(userId);
		
		System.out.println(NoticeArr);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();

	    return gson.toJson(NoticeArr);
		
	}
	
	//알림 삭제
		@ResponseBody
		@RequestMapping("alarmDelete.sp")
		public String noticeDelete(int noticeId) {
			System.out.println("공간 아이디 "+noticeId);
			 int result = mainService.noticeDelete(noticeId);
			 System.out.println("결과"+result);
		      if(result>0) {
		         return "success";
		      }else {
		         return "fail";
		      }
			
		}
}
