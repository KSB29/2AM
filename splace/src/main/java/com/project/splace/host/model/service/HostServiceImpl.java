package com.project.splace.host.model.service;

import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.splace.admin.model.vo.Account;
import com.project.splace.common.PageInfo;
import com.project.splace.common.Pagination;
import com.project.splace.host.model.dao.HostDao;
import com.project.splace.host.model.vo.BookList;
import com.project.splace.host.model.vo.Host;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.host.model.vo.Status;
import com.project.splace.qna.model.vo.QnA;
import com.project.splace.review.model.vo.Review;
import com.project.splace.space.model.vo.Space;

@Service("hService")
public class HostServiceImpl implements HostService {
	
	@Autowired
	private HostDao hDao;
	
	@Override
	public Host selectOne(String memberId) {
		return hDao.selectOne(memberId);
	}

	@Override
	public Host insertHost(Host host) {
		int result = hDao.insertHost(host);
		// 호스트 등록 완료 후 호스트 정보 리턴
		if (result > 0) return hDao.selectOne(host.getMemberId());
		else return null;
	}

	@Override
	public Host updateHost(Host host) {
		int result = hDao.updateHost(host);
		// 호스트 수정 완료 후 호스트 정보 리턴
		if (result > 0) return hDao.selectInfo(host.getHostId());
		else return null;
	}

	@Override
	public Host updateApplyHost(int hostId) {
		int result = hDao.updateApplyHost(hostId);
		// 호스트 신청 완료 후 호스트 정보 리턴
		if (result > 0) return hDao.selectInfo(hostId);
		else return null;
	}

	@Override
	public ArrayList<BookList> selectBookList(HostSearch search, int currentPage) {
		// 예약리스트 수 조회
		int listCount = hDao.getbListCount(search);
		
		// 예약리스트 조회(페이징 처리 적용)
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount);
		return hDao.selectBookList(search, pageInfo);
	}

	@Override
	public ArrayList<Space> selectSpaceList(int hostId) {
		return hDao.selectSpaceList(hostId);
	}

	@Override
	public int updateApplyBook(String statusId, JSONArray jsonArr) {
		int result = 0;
		int noticeResult = 0;
		Iterator<String> iterator = jsonArr.iterator();
		String bookId = "";
		while (iterator.hasNext()) {
			bookId = iterator.next();
			// 예약 승인
			if (statusId.equals("101")) {
				if (hDao.updateApproveBook(bookId) > 0) {
					if (hDao.insertNoticeApprove(bookId) > 0) {
						result++;
					}
				}
			}
			// 예약 취소
			else if (statusId.equals("102")) {
				if (hDao.updateCancelBook(bookId) > 0) {
					if (hDao.insertNoticeCancel(bookId) > 0) {
						result++;
					}
				}
			}
		}
		// 처리 건 수 리턴
		if (jsonArr.size() == result) return result;
		else return 0;
		/*String arr[] = list.substring(1).split(",");
		for (int i = 0; i < arr.length; i++) {
			// 예약 승인
			if (statusId.equals("101")) {
				result += hDao.updateApproveBook(arr[i]);
			}
			// 예약 취소
			else if (statusId.equals("102")) {
				result += hDao.updateCancelBook(arr[i]);
			}
		}
		// 처리 건 수 리턴
		if (arr.length == result) return result;
		else return 0;*/
	}

	@Override
	public ArrayList<QnA> selectQnaList(HostSearch search, int currentPage) {
		// 공간 문의 리스트 수 조회
		int listCount = hDao.getqListCount(search);
		
		// 공간 문의 리스트 조회(페이징 처리 적용)
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount);
		return hDao.selectQnaList(search, pageInfo);
	}

	@Override
	public ArrayList<Account> selectAccountList(int hostId, int currentPage) {
		// 정산 리스트 수 조회
		int listCount = hDao.getaListCount(hostId);
		// 정산 리스트 조회(페이징 처리 적용)
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount);
		return hDao.selectAccountList(hostId, pageInfo);
	}

	@Override
	public int updateAnswer(QnA qna) {
		return hDao.updateAnswer(qna);
	}

	@Override
	public ArrayList<Review> selectReviewList(HostSearch search, int currentPage) {
		// 후기 리스트 수 조회
		int listCount = hDao.getrListCount(search);
		// 후기 리스트 조회(페이징 처리 적용)
		PageInfo pageInfo = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Review> rList = hDao.selectReview(search, pageInfo);
		if (rList != null) {
			ArrayList<String> reviewAtt;
			for (int i = 0; i < rList.size(); i++) {
				if (rList.get(i).getAttInfo() != null) {
					reviewAtt = hDao.selectReviewAtt(rList.get(i).getReviewId());
					if (reviewAtt.size() > 0) {
						rList.get(i).setAttInfo(reviewAtt.toString().replace("[", "").replace("]", ""));
					} else {
						rList.get(i).setAttInfo("");
					}
				}
			}
		}
		return rList;
	}

	@Override
	public ArrayList<Status> selectStatus(String status) {
		return hDao.selectStatus(status);
	}
	
}
