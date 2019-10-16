package com.project.splace.space.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.project.splace.book.model.vo.Book;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.space.model.vo.DayOff;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;
import com.project.splace.space.model.vo.WishList;

public interface SpaceService {
	
	/**
	 * 공간 등록 Service
	 * @param space
	 * @param request
	 * @param uploadFile
	 * @param files
	 * @return result
	 */
	public abstract int insertSpace(Space space, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files);

	/**
	 * 공간 리스트 조회 Service
	 * @param memberId
	 * @param currentPage 
	 * @return sList
	 */
	public abstract ArrayList<Space> selectList(String memberId, int currentPage);

	/**
	 * 공간 타입 리스트 조회 Service
	 * @return tList
	 */
	public abstract ArrayList<Type> selectType();

	/**
	 * 공간 옵션 리스트 조회 Service
	 * @return oList
	 */
	public abstract ArrayList<Option> selectOption();

	/**
	 * 공간 가격 조회 Service
	 * @param spaceId 
	 * @return
	 */
	public abstract ArrayList<Price> selectPrice(int spaceId);

	/**
	 * 공간 가격 등록 Service
	 * @param spaceId
	 * @param spacePrice
	 * @return result
	 */
	public abstract int insertPrice(int spaceId, int spaceAdd, String[] spacePrice);
	
	/**
	 * 공간 승인 요청 Service
	 * @param spaceId
	 * @return result
	 */
	public abstract int updateApply(int spaceId);

	/**
	 * 공간 삭제 Service
	 * @param spaceId
	 * @param request 
	 * @return result
	 */
	public abstract int deleteSpace(int spaceId, HttpServletRequest request);

	/**
	 * 공간 정보 조회 Service
	 * @param spaceId
	 * @return space
	 */
	public abstract Space selectSpace(int spaceId); 
	
	/**
	 * 공간 사진 파일 조회 Service
	 * @param spaceId
	 * @return attList
	 */
	public abstract ArrayList<SpaceAtt> selectSpaceAtt(int spaceId);

	/**
	 * 공간 정보 수정 Service
	 * @param space
	 * @param request
	 * @param uploadFile
	 * @param files
	 * @return result
	 */
	public abstract int updateSpace(Space space, int filesIndex, HttpServletRequest request, MultipartFile uploadFile,
			List<MultipartFile> files, String[] spaceAttChanges);

	/**
	 * 공간 가격 수정 Service
	 * @param spaceId
	 * @param spaceAdd
	 * @param spacePrice
	 * @return result
	 */
	public abstract int updatePrice(int spaceId, int spaceAdd, String[] spacePrice);

	// 미리, 다운영역--------------------------------------------------------------------------------

   /**
    * 공간 상세보기 조회
    * @param spaceId
    * @return space
    */
   public abstract Space selectspaceDetail(int spaceId);

   /**
    * 공간 유형 조회
    * @param typeId
    * @return type
    */
   public abstract Type selectTypeName(int typeId);

   /**
    * 공간 세부 옵션 조회
    * @return 
    */
   public abstract ArrayList<Option> selectOptionList();


   /**
    * 호스트 다른 공간 조회
    * @param hostId
    * @return
    */
   /* public abstract ArrayList<Space> otherSpace(int hostId); */
   
   
   /**
    * 찜 등록
    * @param wishList
    * @return
    * @throws Exception 
    */
   public abstract int wishList(WishList wishList) throws Exception;

   /**
    * 찜 조회
    * @param wishList
    * @return
    */
   public abstract int wishSelect(WishList wishList);

   /**
    * 찜삭제
    * @param wishList
    * @return
    */
   public abstract int wishDelete(WishList wishList);

   /**
    * 공간 이미지
    * @param spaceId
    * @return
    */
   public abstract ArrayList<SpaceAtt> spaceAttImg(int spaceId);

   /**
    * 호스트 다른 공간
    * @param hostId
    * @return
    */
   public abstract ArrayList<Space> hostSpace(int hostId);

	/**
	 * 일치 요일의 가격 조회
	 * @param price
	 * @return
	 */
	public abstract Price selectPriceList(Price price);

	/**
	 * 해당 공간의 휴무일 조회
	 * @param spaceId
	 * @return
	 */
	public abstract ArrayList<DayOff> dayOffList(int spaceId);

	/**
	 * 해당 공간의 예약 조회
	 * @param book
	 * @return
	 */
	public abstract ArrayList<Book> bookTime(Book book);

	/**
	 * 공간 휴일 리스트 조회
	 * @param search
	 * @param currentPage
	 * @return dList
	 */
	public abstract ArrayList<DayOff> selectDayoffList(HostSearch search, int currentPage);

	/**
	 * 공간 운영 여부 변경 처리
	 * @param search
	 * @return result
	 */
	public abstract String updateOperStatus(HostSearch search);

	/**
	 * 공간 휴일 등록 처리
	 * @param dayoff
	 * @return result
	 */
	public abstract String insertDayoff(DayOff dayoff);

	/**
	 * 호스트 공간 리스트
	 * @param hostId
	 * @return sList
	 */
	public abstract ArrayList<Space> selectSpaceList(int hostId);

	/**
	 * 공간 휴일 등록 전 예약 체크
	 * @param dayoff
	 * @return result
	 */
	public abstract String selectCheckDayoff(DayOff dayoff);

	/**
	 * 공간 휴일 삭제 처리
	 * @param list
	 * @return result
	 */
	public abstract String deleteDayoff(String list);
}