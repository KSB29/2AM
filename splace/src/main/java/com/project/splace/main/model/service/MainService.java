package com.project.splace.main.model.service;

import java.util.ArrayList;

import com.project.splace.main.model.vo.Notice;
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

	/** 알림 조회
	 * @param userId
	 * @return
	 */
	public abstract ArrayList<Notice> noticeSelect(String userId);

	/** 알림 삭제 
	 * @param noticeId
	 * @return
	 */
	public abstract int noticeDelete(int noticeId);

	/** 
	 * 안읽은 알림 조회
	 * @param memberId
	 * @return
	 */
	public abstract int checkAlarm(String memberId);
}
