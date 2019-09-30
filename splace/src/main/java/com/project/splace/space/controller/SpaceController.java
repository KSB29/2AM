package com.project.splace.space.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.splace.space.model.service.SpaceService;
import com.project.splace.space.model.vo.Space;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	
	@RequestMapping("spaceInsertForm.sp")
	public String spaceInsertForm() {
		return "space/spaceInsertForm";
	}
	
	@RequestMapping("spaceInsert.sp")
	public String spaceInsert(Space space, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model) {
		int result = sService.insertSpace(space, request, uploadFile, files);
		return null;
	}
	
	@RequestMapping("spaceList.sp")
	public String spaceInfoList() {
		return "space/spaceList";
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
	public String spacePrice() {
		return "space/spacePrice";
	}
	
	@RequestMapping("spaceReview.sp")
	public String spaceReview() {
		return "space/spaceReview";
	}
	
	@RequestMapping("spaceUpdateForm.sp")
	public String spaceUpdateForm() {
		return "space/spaceUpdateForm";
	}

}
