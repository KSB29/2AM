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
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	
	@RequestMapping("spaceInsertForm.sp")
	public ModelAndView spaceInsertForm(ModelAndView mv) {
		// 공간 타입
		ArrayList<Type> tList = sService.selectType();
		// 공간 옵션
		ArrayList<Option> oList = sService.selectOption();
		mv.addObject("tList", tList).addObject("oList", oList).setViewName("space/spaceInsertForm");
		return mv;
	}
	
	@RequestMapping("spaceInsert.sp")
	public String spaceInsert(Space space, String address, String post, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model) {
		space.setMemberId(((Member)request.getSession().getAttribute("loginUser")).getMemberId());
		// 주소 : 우편번호,도로명주소,상세주소
		space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
		int result = sService.insertSpace(space, request, uploadFile, files);
		if (result > 0) return "redirect:spaceList.sp";
		else return null;
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
	public ModelAndView spacePrice(int spaceId, String priceFlag, HttpSession session, ModelAndView mv) {
		// 공간이용시간
		int spaceOpenTime = 0;
		int spaceCloseTime = 0;
		int spaceAdd = 0;
		
		if (((Member)session.getAttribute("loginUser")).getMemberId() == null) {
			mv.setViewName("redirect:loginForm.sp");
		} else {
			
			ArrayList<Price> pList = sService.selectPrice(spaceId);
			if (pList != null) {
				for (int i = 0; i < pList.size(); i++) {
					if (i == 0) {
						spaceOpenTime = pList.get(i).getSpaceOpenTime();
						spaceCloseTime = pList.get(i).getSpaceCloseTime();
						spaceAdd = pList.get(i).getSpaceAdd();
					}
				}
				//System.out.println(spaceOpenTime + " ~ " + spaceCloseTime + " : spaceAdd");
				mv.addObject("pList", pList);
			}
			mv.addObject("spaceOpenTime", spaceOpenTime).addObject("spaceCloseTime", spaceCloseTime).addObject("spaceAdd", spaceAdd);
			mv.addObject("spaceId", spaceId).addObject("priceFlag", priceFlag).setViewName("space/spacePrice");
		}
		return mv;
	}
	
	@RequestMapping("spaceReview.sp")
	public String spaceReview() {
		return "space/spaceReview";
	}
	
	@RequestMapping("spaceUpdateForm.sp")
	public ModelAndView spaceUpdateForm(int spaceId, ModelAndView mv) {
		Space space = sService.selectSpace(spaceId);
		if (space != null) {
			// 공간 사진 파일(슬라이드)
			ArrayList<SpaceAtt> attList = sService.selectSpaceAtt(spaceId);
			mv.addObject("attList", attList);
			// 공간 타입
			ArrayList<Type> tList = sService.selectType();
			// 공간 옵션
			ArrayList<Option> oList = sService.selectOption();
			String[] addressArr = space.getSpaceAddress().split(",");
			//String post = space.getSpaceAddress().substring(0,space.getSpaceAddress().indexOf(',')-1);
			space.setSpaceAddress(addressArr[1]);
			mv.addObject("post", addressArr[0]).addObject("address", addressArr[2]);
			mv.addObject("space", space).addObject("tList", tList).addObject("oList", oList).setViewName("space/spaceUpdateForm");
		} else {
			mv.addObject("msg", "공간 정보 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("spaceUpdate.sp")
	public String spaceUpdate(Space space, String address, String post, int filesIndex, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model) {
		// 주소 : 우편번호,도로명주소,상세주소
		space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
		int result = sService.updateSpace(space, filesIndex, request, uploadFile, files);
		if (result > 0) return "redirect:spaceList.sp";
		else return null;
	}
	
	// 공간 승인 요청
	@RequestMapping("spaceApply.sp")
	public String spaceApply(int spaceId) {
		int result = sService.updateApply(spaceId);
		if (result > 0) return "redirect:spaceList.sp";
		else return null;
	}
	
	// 공간 삭제
	@RequestMapping("spaceDelete.sp")
	public String spaceDelete(int spaceId) {
		int result = sService.deleteSpace(spaceId);
		if (result > 0) return "redirect:spaceList.sp";
		else return null;
	}
	
	// -------------------------191002 추가-------------------------------------------------------
	// 공간 상세보기 조회
	@RequestMapping("spaceDetail.sp")
	public ModelAndView spaceDatail(int spaceId, ModelAndView mv) {
		
		Space space =sService.selectspaceDetail(spaceId);
		System.out.println(space);
		if(space !=null) {
			// 공간 타입 조회
			Type type = sService.selectTypeName(space.getTypeId());
			
			// 공간 세부 옵션 조회
			String spaceOption1[] = space.getSpaceOption().substring(1).split("#");
			ArrayList<Option> oList = sService.selectOptionList();
			// 세부옵션
			ArrayList<Option> spaceO = new ArrayList<Option>(); 
			
			
			for(String o : spaceOption1) { // 공간 옵션
				for(Option op : oList) { 
					if(op.getOptionId().equals(o)) {
						spaceO.add(new Option(op.getOptionId(), op.getOptionName(), op.getOptionIcon()));
						
					}
				}
			}
			
			// 주의사항
			String spaceNotice[] = space.getSpaceNotice().substring(1).split("#");
			mv.addObject("spaceNotice", spaceNotice);				
			mv.addObject("spaceO", spaceO);	
			mv.addObject("type", type);
			mv.addObject("space", space);
			mv.setViewName("space/spaceDetail");
		}else {
			mv.setViewName("space/spaceDetail");
		}
		return mv;
	}
	
	// 공간 가격 등록
	@RequestMapping("spacePriceInsert.sp")
	public String spacePriceInsert(int spaceId, int spaceAdd, String[] spacePrice) {
		int result = sService.insertPrice(spaceId, spaceAdd, spacePrice);
		return "redirect:spaceList.sp";
	}
	
	// 공간 가격 수정
	@RequestMapping("spacePriceUpdate.sp")
	public String spacePriceUpdate(int spaceId, int spaceAdd, String[] spacePrice) {
		int result = sService.updatePrice(spaceId, spaceAdd, spacePrice);
		return "redirect:spaceList.sp";
	}

}
