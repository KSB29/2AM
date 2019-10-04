package com.project.splace.space.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.service.SpaceService;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.Type;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	
	@RequestMapping("spaceInsertForm.sp")
	public ModelAndView spaceInsertForm(ModelAndView mv) {
		// 공간 타입
		ArrayList<Type> tList = sService.selectType();
		mv.addObject("tList", tList);
		// 공간 옵션
		ArrayList<Option> oList = sService.selectOption();
		mv.addObject("oList", oList);
		
		mv.setViewName("space/spaceInsertForm");
		return mv;
	}
	
	@RequestMapping("spaceInsert.sp")
	public String spaceInsert(Space space, String address, String post, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model) {
		// 호스트 여부 체크
		if (((Member)request.getSession().getAttribute("loginUser")).getGrade() != "2") {
			return "redirect:hostApplyForm.sp";
		} else {
			// grade 2 : 호스트 회원
			space.setMemberId(((Member)request.getSession().getAttribute("loginUser")).getMemberId());
			// 주소 : 우편번호,도로명주소,상세주소
			space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
			int result = sService.insertSpace(space, request, uploadFile, files);
			return "redirect:spaceList.sp";
		}
	}
	
	@RequestMapping("spaceList.sp")
	public ModelAndView spaceInfoList(HttpSession session, ModelAndView mv) {
		ArrayList<Space> sList = sService.selectList(((Member)session.getAttribute("loginUser")).getMemberId());
		mv.addObject("sList", sList);
		mv.setViewName("space/spaceList");
		return mv;
	}
	
	@RequestMapping("spaceBook.sp")
	public String spaceBookList() {
		return "space/spaceBook";
	}
	
	@RequestMapping("spaceQna.sp")
	public String spaceQnaList() {
		return "space/spaceQna";
	}
	
	@RequestMapping("spaceDayoff.sp")
	public String spaceDayoff() {
		return "space/spaceDayoff";
	}
	
	@RequestMapping("spacePrice.sp")
	public ModelAndView spacePrice(String spaceId, HttpSession session, ModelAndView mv) {
		if (((Member)session.getAttribute("loginUser")).getMemberId() == null) {
			mv.setViewName("redirect:loginForm.sp");
		} else {
			//ArrayList<Price> pList = sService.selectPrice(spaceId);
			//mv.addObject("pList", pList);
			mv.addObject("spaceId", spaceId);
			mv.setViewName("space/spacePrice");
		}
		return mv;
	}
	
	@RequestMapping("spaceReview.sp")
	public String spaceReview() {
		return "space/spaceReview";
	}
	
	@RequestMapping("spaceUpdateForm.sp")
	public String spaceUpdateForm() {
		return "space/spaceUpdateForm";
	}
	
	@RequestMapping("spacePriceInsert.sp")
	public String spacePriceInsert(int spaceId, String[] spacePrice) {
		int result = sService.insertPrice(spaceId, spacePrice);
		return null;
	}

}
