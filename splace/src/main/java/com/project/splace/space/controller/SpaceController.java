package com.project.splace.space.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.splace.book.model.vo.Book;
import com.project.splace.common.Pagination;
import com.project.splace.host.model.vo.Host;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.service.SpaceService;
import com.project.splace.space.model.vo.DayOff;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;
import com.project.splace.space.model.vo.WishList;

//session에 hostId 추가
@SessionAttributes({"hostId"})
@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	@Autowired
	private WishList wishList;
	
	// 공간 등록 화면
	@RequestMapping("spaceInsertForm.sp")
	public ModelAndView spaceInsertForm(ModelAndView mv) {
		// 공간 타입
		ArrayList<Type> tList = sService.selectType();
		// 공간 옵션
		ArrayList<Option> oList = sService.selectOption();
		mv.addObject("tList", tList).addObject("oList", oList).setViewName("space/spaceInsertForm");
		return mv;
	}
	
	// 공간 등록 처리
	@RequestMapping("spaceInsert.sp")
	public String spaceInsert(Space space, String address, String post, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model, RedirectAttributes rd) {
		space.setMemberId(((Member)request.getSession().getAttribute("loginUser")).getMemberId());
		// 주소 : 우편번호,도로명주소,상세주소
		space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
		int result = sService.insertSpace(space, request, uploadFile, files);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간이 등록되었습니다.");
		} else {
			rd.addFlashAttribute("msg", "공간 등록 중 오류가 발생했습니다.");
		}
		return "redirect:spaceList.sp";
	}
	
	// 공간 리스트 화면
	@RequestMapping("spaceList.sp")
	public ModelAndView spaceInfoList(HttpSession session, ModelAndView mv, Integer page) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		// 메뉴에서 승인된 호스트일 경우 공간관리 화면으로 바로 이동
		Host hostInfo = sService.selectOne(memberId);
		mv.addObject("host", hostInfo).addObject("hostId", hostInfo.getHostId()); // hostId session 추가용
		
		int currentPage = page == null? 1 : page;
		ArrayList<Space> sList = sService.selectList(memberId, currentPage);
		mv.addObject("sList", sList).setViewName("space/spaceList");
		return mv;
	}
	
	// 공간 휴일 등록 화면
	@RequestMapping("spaceDayoff.sp")
	public ModelAndView spaceDayoff(HttpSession session, HostSearch search, ModelAndView mv, Integer page) {
		int hostId = (int)session.getAttribute("hostId");
		int currentPage = page == null? 1 : page;
		search.setHostId(hostId);
		
		ArrayList<DayOff> dList = sService.selectDayoffList(search, currentPage);
		ArrayList<Space> sList = sService.selectSpaceList(hostId);
		
		mv.addObject("search", search).addObject("dList", dList).addObject("sList", sList)
		.addObject("pi", Pagination.getPageInfo()).setViewName("space/spaceDayoff");
		return mv;
	}
	
	// 공간 가격 화면
	@RequestMapping("spacePrice.sp")
	public ModelAndView spacePrice(int spaceId, String priceFlag, HttpSession session, ModelAndView mv) {
		// 공간이용시간
		int spaceOpenTime = 0;
		int spaceCloseTime = 0;
		int spaceAdd = 0;
		
		ArrayList<Price> pList = sService.selectPrice(spaceId);
		if (pList != null) {
			for (int i = 0; i < pList.size(); i++) {
				if (i == 0) {
					spaceOpenTime = pList.get(i).getSpaceOpenTime();
					spaceCloseTime = pList.get(i).getSpaceCloseTime();
					spaceAdd = pList.get(i).getSpaceAdd();
				}
			}
			mv.addObject("pList", pList);
		}
		mv.addObject("spaceOpenTime", spaceOpenTime).addObject("spaceCloseTime", spaceCloseTime).addObject("spaceAdd", spaceAdd);
		mv.addObject("spaceId", spaceId).addObject("priceFlag", priceFlag).setViewName("space/spacePrice");

		return mv;
	}
	
	// 공간 수정 화면
	@RequestMapping("spaceUpdateForm.sp")
	public ModelAndView spaceUpdateForm(int spaceId, ModelAndView mv) {
		Space space = sService.selectSpace(spaceId);
		// 공간 사진 파일(슬라이드)
		ArrayList<SpaceAtt> attList = sService.selectSpaceAtt(spaceId);
		mv.addObject("attList", attList);
		// 공간 타입
		ArrayList<Type> tList = sService.selectType();
		// 공간 옵션
		ArrayList<Option> oList = sService.selectOption();
		
		String[] address = space.getSpaceAddress().split(",");
		// 상세주소
		String address2 = "";
		for (int i = 2; i < address.length; i++) {
			address2 += address[i];
		}
		// 도로명주소
		space.setSpaceAddress(address[1]);
		// 우편번호, 상세주소
		mv.addObject("post", address[0]).addObject("address", address2);
		mv.addObject("space", space).addObject("tList", tList).addObject("oList", oList).setViewName("space/spaceUpdateForm");
		return mv;
	}
	
	// 공간 수정 처리
	@RequestMapping("spaceUpdate.sp")
	public String spaceUpdate(Space space, String address, String post, int filesIndex, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, String[] spaceAttChanges, Model model, RedirectAttributes rd) {
		// 주소 : 우편번호,도로명주소,상세주소
		space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
		int result = sService.updateSpace(space, filesIndex, request, uploadFile, files, spaceAttChanges);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 내역이 수정되었습니다.");
		} else {
			rd.addFlashAttribute("msg", "공간 내역 수정 중 오류가 발생했습니다.");
		}
		return "redirect:spaceList.sp";
	}
	
	// 공간 파일 삭제 처리(Ajax)
	@ResponseBody
	@RequestMapping("spaceDeleteAtt.sp")
	public String spaceDeleteAtt(int spaceId, String attName, HttpServletRequest request) {
		System.out.println(spaceId);
		System.out.println(attName);
		String result = sService.spaceDeleteAtt(spaceId, attName, request);
		return result;
	}
	
	// 공간 승인 요청
	@RequestMapping("spaceApply.sp")
	public String spaceApply(int spaceId, RedirectAttributes rd) {
		int result = sService.updateApply(spaceId);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 승인 요청되었습니다.");
		} else {
			rd.addFlashAttribute("msg", "공간 승인 요청 중 오류가 발생했습니다.");
		}
		return "redirect:spaceList.sp";
	}
	
	// 공간 삭제 처리
	@RequestMapping("spaceDelete.sp")
	public String spaceDelete(int spaceId, HttpServletRequest request, RedirectAttributes rd) {
		int result = sService.deleteSpace(spaceId, request);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간이 삭제되었습니다.");
		} else {
			rd.addFlashAttribute("msg", "공간 삭제 중 오류가 발생했습니다.");
		}
		return "redirect:spaceList.sp";
	}
	
	// 공간 가격 등록 처리
	@RequestMapping("spacePriceInsert.sp")
	public String spacePriceInsert(int spaceId, int spaceAdd, String[] spacePrice, Model model, RedirectAttributes rd) {
		int result = sService.insertPrice(spaceId, spaceAdd, spacePrice);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 가격이 등록되었습니다.");
		} else {
			rd.addFlashAttribute("msg", "공간 가격 등록 중 오류가 발생했습니다.");
		}
		return "redirect:spaceList.sp";
	}
  
	// 공간 가격 수정 처리
	@RequestMapping("spacePriceUpdate.sp")
	public String spacePriceUpdate(int spaceId, int spaceAdd, String[] spacePrice, Model model, RedirectAttributes rd) {
		int result = sService.updatePrice(spaceId, spaceAdd, spacePrice);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 가격이 수정되었습니다.");
		} else {
			rd.addFlashAttribute("msg", "공간 가격 수정 중 오류가 발생했습니다.");
		}
		return "redirect:spaceList.sp";
	}
	
	// 공간 운영여부 변경 처리(Ajax)
	@ResponseBody
	@RequestMapping("spaceUpdateStatus.sp")
	public String spaceUpdateStatus(HostSearch search) {
		return sService.updateOperStatus(search);
	}
	
	// 공간 휴일 등록 전 예약 체크(Ajax)
	@ResponseBody
	@RequestMapping("spaceCheckDayoff.sp")
	public String spaceCheckDayoff(DayOff dayoff) {
		return sService.selectCheckDayoff(dayoff);
	}
	
	// 공간 휴일 등록 처리(Ajax)
	@ResponseBody
	@RequestMapping("spaceInsertDayoff.sp")
	public String spaceInsertDayoff(DayOff dayoff) {
		return sService.insertDayoff(dayoff);
	}
	
	// 공간 휴일 삭제 처리(Ajax)
	@ResponseBody
	@RequestMapping("spaceDeleteDayoff.sp")
	public String spaceDeleteDayoff(String list) {
		return sService.deleteDayoff(list);
	}
	
	// 미리, 다운영역--------------------------------------------------------------------------------

	// 공간 상세보기 조회
	@RequestMapping("detailSpace.sp")
	public ModelAndView spaceDetail(int spaceId, ModelAndView mv, HttpSession session) {
	      Space space =sService.selectspaceDetail(spaceId);
	      Book book = new Book();
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
	      
	         // 공간 이미지
	         ArrayList<SpaceAtt> spaceAttImg = sService.spaceAttImg(space.getSpaceId());
	         
	         // 호스트 다른 공간
	         ArrayList<Space> hostSpace = sService.hostSpace(space.getHostId());
	         
	         // 공간 휴무일 
	         DayOff dayOff = new DayOff();
	         ArrayList<DayOff> dayOffList = sService.dayOffList(space.getSpaceId());
	         String dayArr[]= new String[dayOffList.size()];
	         DayOff dddddddddd = dayOffList.get(1);
	       
	         SimpleDateFormat newForm = new SimpleDateFormat("yyyy-MM-dd");
	         for(int i=0; i<dayOffList.size(); i++) {
	        	 String dfdf = newForm.format((dayOffList.get(i)).getDayOffStart());
	        	 dayArr[i]=dfdf;
	         }
	         mv.addObject("dayArr", Arrays.toString(dayArr).substring(1,Arrays.toString(dayArr).lastIndexOf("]")));
	         mv.addObject("dayOffList", dayOffList);
	         mv.addObject("hostSpace", hostSpace);
	         mv.addObject("spaceAttImg",spaceAttImg);
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
	   
	// 찜등록
	@ResponseBody
	@RequestMapping("wishList.sp")
	public String wishList(WishList wishList, HttpSession session,RedirectAttributes rd) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
	    wishList.setMemberId(memberId);
	     try {
	       int result=sService.wishList(wishList);
	         return "success";
	    }catch (Exception e) {
	         return "fail";
	      }
	}
	   
	// 찜 여부 조회
	@ResponseBody
	@RequestMapping("wishSelect.sp")
	public String wishSelect(int spaceId, HttpSession session) {
	      String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
	      wishList.setMemberId(memberId);
	      wishList.setSpaceId(spaceId);
	      
	      int result = sService.wishSelect(wishList);
	      
	      if(result==0) {
	         return "success";
	      }else {
	         return "fail";
	      }
	}
	   
	// 찜 삭제 
	@ResponseBody
	@RequestMapping("wishDelete.sp")
	public String wishDelete(WishList wishList, HttpSession session) {
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		wishList.setMemberId(memberId);
		int result=sService.wishDelete(wishList);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	// 선택한 일자의 시간+가격 리스트 조회
		@ResponseBody
		@RequestMapping(value="timeList.sp", produces="application/json; charset=utf8")
		public String timeList(String bookDate, int spaceId) throws ParseException {
		   Price price = new Price();
		   Book book = new Book();
		  
		   // 달력 요일 뽑기 
		  String day= bookDate.substring(11,12);
		
		  SimpleDateFormat original = new SimpleDateFormat("yy-mm-dd E");
		  SimpleDateFormat newForm = new SimpleDateFormat("yyyy/mm/DD/E");
		  
		  price.setPriceWeekend(day); 
		  price.setSpaceId(spaceId);

		  //일치 요일의 가격 조회
		  Price selectPrice = sService.selectPriceList(price);


		  JsonParser jp = new JsonParser();

		  JsonArray priceTime = (JsonArray)jp.parse(selectPrice.getPriceTime());
		  // JsonParser --> HttpURLConnection 대체하기

		  Iterator<JsonElement> it = priceTime.iterator();

		  JsonObject obj = null;
		  Map<String, Integer> pricePerTime = new LinkedHashMap<String, Integer>();

		  JsonArray resultArr = new JsonArray();

		  while(it.hasNext()) {
			  JsonObject obj2 = new JsonObject();

			  obj = it.next().getAsJsonObject();

			  String h = obj.get("hour").toString();
			  String p = obj.get("price").toString();


			  obj2.addProperty(h.substring(1, h.lastIndexOf('~')), Integer.parseInt(p.replace('\"', ' ').trim()) );

			  resultArr.add(obj2);

		  }

		  return new Gson().toJson(resultArr);


	}
		
		
		//해당 일의 예약 조회 
		@ResponseBody
		@RequestMapping(value="timeListBook.sp")
		public ArrayList<Book> bookTimeArr(String bookDate, int spaceId) throws ParseException{
		 Book book = new Book();
		 
		 Date date = new SimpleDateFormat("yyyy-MM-dd").parse(bookDate);
		
		 book.setSpaceId(spaceId);
		 book.setBookDate(date);
		 
		 ArrayList<Book> bookTimeArrr= sService.bookTime(book);
		
		 return bookTimeArrr;
			
			 
		}
}