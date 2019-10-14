package com.project.splace.space.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.project.splace.book.model.vo.Book;
import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.service.SpaceService;
import com.project.splace.space.model.vo.DayOff;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;
import com.project.splace.space.model.vo.WishList;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	@Autowired
	private WishList wishList;
	
	@RequestMapping("spaceInsertForm.sp")
	public ModelAndView spaceInsertForm(ModelAndView mv) {
		// 공간 타입
		ArrayList<Type> tList = sService.selectType();
		// 공간 옵션
		ArrayList<Option> oList = sService.selectOption();
		if (tList != null && oList != null) {
			mv.addObject("tList", tList).addObject("oList", oList).setViewName("space/spaceInsertForm");
		} else {
			mv.addObject("msg", "공간 타입 및 옵션 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("spaceInsert.sp")
	public String spaceInsert(Space space, String address, String post, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model, RedirectAttributes rd) {
		space.setMemberId(((Member)request.getSession().getAttribute("loginUser")).getMemberId());
		// 주소 : 우편번호,도로명주소,상세주소
		space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
		int result = sService.insertSpace(space, request, uploadFile, files);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간이 등록되었습니다");
			return "redirect:spaceList.sp";
		} else {
			model.addAttribute("msg", "공간 등록 중 오류 발생");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("spaceList.sp")
	public ModelAndView spaceInfoList(HttpSession session, ModelAndView mv, Integer page) {
		int currentPage = page == null? 1 : page;
		ArrayList<Space> sList = sService.selectList(((Member)session.getAttribute("loginUser")).getMemberId(), currentPage);
		if (sList != null) {
			mv.addObject("sList", sList).setViewName("space/spaceList");
		} else {
			mv.addObject("msg", "공간 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
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
		} else {
			mv.addObject("msg", "공간 정보 조회 중 오류 발생").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("spaceUpdate.sp")
	public String spaceUpdate(Space space, String address, String post, int filesIndex, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files, Model model, RedirectAttributes rd) {
		// 주소 : 우편번호,도로명주소,상세주소
		space.setSpaceAddress(post + "," + space.getSpaceAddress() + "," + address);
		int result = sService.updateSpace(space, filesIndex, request, uploadFile, files);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 내역이 수정되었습니다");
			return "redirect:spaceList.sp";
		} else {
			model.addAttribute("msg", "공간 내역 수정 중 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 공간 승인 요청
	@RequestMapping("spaceApply.sp")
	public String spaceApply(int spaceId) {
		int result = sService.updateApply(spaceId);
		if (result > 0) return "redirect:spaceList.sp";
		else return "common/errorPage";
	}
	
	// 공간 삭제
	@RequestMapping("spaceDelete.sp")
	public String spaceDelete(int spaceId) {
		int result = sService.deleteSpace(spaceId);
		if (result > 0) return "redirect:spaceList.sp";
		else return "common/errorPage";
	}
	
	// 공간 가격 등록
	@RequestMapping("spacePriceInsert.sp")
	public String spacePriceInsert(int spaceId, int spaceAdd, String[] spacePrice, Model model, RedirectAttributes rd) {
		int result = sService.insertPrice(spaceId, spaceAdd, spacePrice);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 가격이 등록되었습니다");
			return "redirect:spaceList.sp";
		} else {
			model.addAttribute("msg", "공간 가격 등록 중 오류 발생");
			return "common/errorPage";
		}
	}
  
	// 공간 가격 수정
	@RequestMapping("spacePriceUpdate.sp")
	public String spacePriceUpdate(int spaceId, int spaceAdd, String[] spacePrice, Model model, RedirectAttributes rd) {
		int result = sService.updatePrice(spaceId, spaceAdd, spacePrice);
		if (result > 0) {
			rd.addFlashAttribute("msg", "공간 가격이 수정되었습니다");
			return "redirect:spaceList.sp";
		} else {
			model.addAttribute("msg", "공간 가격 수정 중 오류 발생");
			return "common/errorPage";
		}
	}
	
	// 미리, 다운영역--------------------------------------------------------------------------------

	// 공간 상세보기 조회
	@RequestMapping("spaceDetail.sp")
	public ModelAndView spaceDatail(int spaceId, ModelAndView mv, HttpSession session) {
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
	         System.out.println("휴무일"+dayOffList);
	         book.setSpaceId(spaceId);
	         
	         //예약 조회 
			/*
			 * ArrayList<Book> bookTime = sService.bookTime(space.getSpaceId());
			 * System.out.println("예약시간"+bookTime);
			 */
	         
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
	   
	      System.out.println(memberId);
	      System.out.println(spaceId);
	      
	      int result = sService.wishSelect(wishList);
	      
	      System.out.println("찜"+result);
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
		public String timeList(String bookDate, int spaceId, ModelAndView mv) throws ParseException {
			Price price = new Price();
			Book book = new Book();
			
			// 달력 요일 뽑기 
			String day= bookDate.substring(11,12);
			System.out.println(bookDate);
			System.out.println(day);
		/*
		 * SimpleDateFormat original = new SimpleDateFormat("yy-mm-dd E");
		 * SimpleDateFormat newForm = new SimpleDateFormat("yyyy/mm/DD/E");
		 * 
		 * Date originDate = (Date) original.parse(inputDate);
		 * 
		 * String selectDate = newForm.format(originDate);
		 * 
		 * String day=selectDate.substring(11,12);
		 * 
		 */ 
		  price.setPriceWeekend(day); price.setSpaceId(spaceId);
		  
		  //해당 일의 예약 조회 DateFormat sdFormat = new SimpleDateFormat("yy-MM-dd E"); Date
		/*
		 * tempDate = (Date) sdFormat.parse(bookDate);
		 * 
		 * book.setSpaceId(spaceId); book.setBookDate(tempDate);
		 * 
		 * System.out.println(book.getBookDate());
		 * 
		 * ArrayList<Book> bookTime = sService.bookTime(book);
		 * 
		 * System.out.println("예약시간"+bookTime);
		 */
		
				 
				
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
}