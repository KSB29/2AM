package com.project.splace.space.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.project.splace.space.model.vo.Space;

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

}
