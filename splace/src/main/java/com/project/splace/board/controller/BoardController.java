package com.project.splace.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.splace.board.model.service.BoardService;
import com.project.splace.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	// 1. FAQ로 이동
	@RequestMapping("insertFaqForm.sp")
	public String goFaqForm() {
		return "board/faq";
	}
	
	// 2. FAQ작성
	@RequestMapping("insertFaq.sp")
	public String insertFaq(Board faq, RedirectAttributes rd){
		int result = boardService.insertFaq(faq);
		
		if(result>0) {
			rd.addFlashAttribute("msg", "글이 등록되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "글이 등록되지 않았습니다ㅜㅜ");
		}
		
		return "redirect:faqManagement.sp";
	}
	
	// 3. FAQ삭제
	@RequestMapping("faqDelete.sp")
	public String deleteFaq(int faqId, RedirectAttributes rd) {
		int result = boardService.deleteFaq(faqId);

		if(result>0) {
			rd.addFlashAttribute("msg", "글이 삭제되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "글이 삭제되지 않았습니다ㅜㅜ");
		}
		
		return "redirect:faqManagement.sp";
	}
	
	// 4. FAQ수정폼 이동
	@RequestMapping("faqUpdateForm.sp")
	public ModelAndView updateFormFaq(int faqId, ModelAndView mv, RedirectAttributes rd) {
		Board faq = boardService.selectFaq(faqId);
		
		if(faq != null) {
			mv.addObject("faq", faq).setViewName("board/faqUpdate");
		} else {
			rd.addFlashAttribute("msg", "글이 조회되지 않았습니다ㅜㅜ");
			mv.setViewName("redirect:faqManagement.sp");
		}
		
		return mv;
	}
	
	// 5. FAQ수정
	@RequestMapping("updateFaq.sp")
	public String updateFaq(Board faq, RedirectAttributes rd) {
		int result = boardService.updateFaq(faq);

		if(result>0) {
			rd.addFlashAttribute("msg", "글이 수정되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "글이 수정되지 않았습니다ㅜㅜ");
		}
		
		return "redirect:faqManagement.sp";
	}

	// 6. 공지사항으로 이동
	@RequestMapping("insertNoticeForm.sp")
	public String goNoticeForm() {
		return "board/notice";
	}

	// 7. 공지사항작성
	@RequestMapping("insertNotice.sp")
	public String insertNotice(Board notice, RedirectAttributes rd){
		int result = boardService.insertNotice(notice);
		
		if(result>0) {
			rd.addFlashAttribute("msg", "글이 등록되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "글이 등록되지 않았습니다ㅜㅜ");
		}
		
		return "redirect:noticeManagement.sp";
	}
	
	// 8. 공지사항삭제
	@RequestMapping("noticeDelete.sp")
	public String deleteNotice(int noticeId, RedirectAttributes rd) {
		int result = boardService.deleteNotice(noticeId);

		if(result>0) {
			rd.addFlashAttribute("msg", "글이 삭제되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "글이 삭제되지 않았습니다ㅜㅜ");
		}
		
		return "redirect:noticeManagement.sp";
	}
	
	// 9. 공지사항수정폼 이동
	@RequestMapping("noticeUpdateForm.sp")
	public ModelAndView updateFormNotice(int noticeId, ModelAndView mv, RedirectAttributes rd) {
		Board faq = boardService.selectNotice(noticeId);
		
		if(faq != null) {
			mv.addObject("faq", faq).setViewName("board/noticeUpdate");
		} else {
			rd.addFlashAttribute("msg", "글이 조회되지 않았습니다ㅜㅜ");
			mv.setViewName("redirect:noticeManagement.sp");
		}
		
		return mv;
	}
	
	// 10. 공지사항수정
	@RequestMapping("updateNotice.sp")
	public String updateNotice(Board notice, RedirectAttributes rd) {
		int result = boardService.updateNotice(notice);

		if(result>0) {
			rd.addFlashAttribute("msg", "글이 수정되었습니다!");
		} else {
			rd.addFlashAttribute("msg", "글이 수정되지 않았습니다ㅜㅜ");
		}
		
		return "redirect:noticeManagement.sp";
	}

	// 회원화면------------------------------------------------------------------------
	@RequestMapping("noticeList.sp")
	public ModelAndView noticeList(ModelAndView mv) {
		ArrayList<Board> bList = boardService.selectNoticeList();
		
		mv.addObject("bList", bList).setViewName("board/noticeList");
		return mv;
	}
}
