package com.project.splace.space.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.Type;

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
	 * @return sList
	 */
	public abstract ArrayList<Space> selectList(String memberId);

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
	
	//-------------------- 191002 추가 ----------------------------
	/**
	 * 공간 상세보기 조회
	 * @param spaceId
	 * @return space
	 */
	public abstract Space selectspaceDetail(int spaceId); 
}
