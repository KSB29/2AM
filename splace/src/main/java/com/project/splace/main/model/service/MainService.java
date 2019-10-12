package com.project.splace.main.model.service;

import java.util.ArrayList;

import com.project.splace.space.model.vo.Space;

public interface MainService {

	/**
	 * 새로 등록된 공간 리스트
	 * @return
	 */
	public abstract ArrayList<Space> newSpace();

	/**
	 * 추천 공간 리스트
	 * @return
	 */
	public abstract ArrayList<Space> bestSpace();
}
