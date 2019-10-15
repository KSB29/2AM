package com.project.splace.main.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.main.model.dao.MainDao;
import com.project.splace.main.model.vo.Notice;
import com.project.splace.member.model.dao.MemberDao;
import com.project.splace.member.model.vo.Member;
import com.project.splace.space.model.vo.Space;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDao mainDao;
	
	// 새로 등록된 공간 리스트 
	@Override
	public ArrayList<Space> newSpace() {
		
		return mainDao.newSpace();
	}
	// 추천 공간 리스트
	@Override
	public ArrayList<Space> bestSpace() {
		
		return mainDao.bestSpace();
	}
	@Override
	public ArrayList<Notice> noticeSelect(String userId) {
		return mainDao.noticeSelect(userId);
	}
	@Override
	public int noticeDelete(int noticeId) {
		return mainDao.noticeDelete(noticeId);
	}

}
