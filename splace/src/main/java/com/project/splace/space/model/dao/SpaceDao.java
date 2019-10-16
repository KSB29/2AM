package com.project.splace.space.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.splace.book.model.vo.Book;
import com.project.splace.common.PageInfo;
import com.project.splace.host.model.vo.Host;
import com.project.splace.host.model.vo.HostSearch;
import com.project.splace.space.model.vo.DayOff;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;
import com.project.splace.space.model.vo.WishList;

@Repository("sDao")
public class SpaceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 공간ID 생성 Dao
	 * @return
	 */
	public int selectSpaceId() {
		return sqlSession.selectOne("spaceMapper.selectSpaceId");
	};

	/**
	 * 신규 공간 등록 Dao
	 * @param space
	 * @param memberId 
	 * @return
	 */
	public int insertSpace(Space space) {
		return sqlSession.insert("spaceMapper.insertSpace", space);
	}

	/**
	 * 신규 공간 사진파일 등록 Dao
	 * @param sAtt
	 * @return
	 */
	public int insertFile(SpaceAtt sAtt) {
		return sqlSession.insert("spaceMapper.insertFile", sAtt);
	}

	/**
	 * 공간 리스트 수 조회 Dao
	 * @param memberId
	 * @return listCount
	 */
	public int getsListCount(String memberId) {
		return sqlSession.selectOne("spaceMapper.getsListCount", memberId);
	}

	/**
	 * 공간 리스트 조회 Dao
	 * @param memberId
	 * @param pageInfo 
	 * @return sList
	 */
	public ArrayList<Space> selectList(String memberId, PageInfo pageInfo) {
		//int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getLimit();
		//RowBounds rowBounds = new RowBounds(offset, pageInfo.getLimit());
		//return (ArrayList)sqlSession.selectList("spaceMapper.selectList", memberId, rowBounds);
		return (ArrayList)sqlSession.selectList("spaceMapper.selectList", memberId);
	}

	/**
	 * 공간 타입 리스트 조회 Dao
	 * @return tList
	 */
	public ArrayList<Type> selectType() {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectType");
	}

	/**
	 * 공간 옵션 리스트 조회 Dao
	 * @return oList
	 */
	public ArrayList<Option> selectOption() {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectOption");
	}

	/**
	 * 공간 가격 조회 Dao
	 * @param spaceId
	 * @return pList
	 */
	public ArrayList<Price> selectPrice(int spaceId) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectPrice", spaceId);
	}

	/**
	 * 공간 가격 등록 Dao
	 * @param price
	 * @return result
	 */
	public int insertPrice(Price price) {
		return sqlSession.insert("spaceMapper.insertPrice", price);
	}
	
	/**
	 * 1인당 추가 금액 저장 Dao
	 * @param space
	 * @return result
	 */
	public int updateAddPrice(Space space) {
		return sqlSession.update("spaceMapper.updateAddPrice", space);
	}

	/**
	 * 공간 승인 요청 Dao
	 * @param spaceId
	 * @return result
	 */
	public int updateApply(int spaceId) {
		return sqlSession.update("spaceMapper.updateApply", spaceId);
	}
	
	
	/**
	 * 공간 사진 파일 삭제 Dao
	 * @param spaceId
	 * @return result
	 */
	public int deleleSpaceAtt(int spaceId) {
		return sqlSession.delete("spaceMapper.deleteSpaceAtt", spaceId);
	}
	
	
	/**
	 * 공간 삭제 Dao
	 * @param spaceId
	 * @return result
	 */
	public int deleleSpace(int spaceId) {
		return sqlSession.delete("spaceMapper.deleteSpace", spaceId);
	}

	/**
	 * 공간 정보 조회 Dao
	 * @param spaceId
	 * @return space
	 */
	public Space selectSpace(int spaceId) {
		return sqlSession.selectOne("spaceMapper.selectSpace", spaceId);
	}

	/**
	 * 공간 사진 파일 조회 Dao
	 * @param spaceId
	 * @return attList
	 */
	public ArrayList<SpaceAtt> selectSpaceAtt(int spaceId) {
		return (ArrayList)sqlSession.selectList("spaceMapper.selectSpaceAtt", spaceId);
	}

	/**
	 * 공간 정보 수정 Dao
	 * @param space
	 * @return result
	 */
	public int updateSpace(Space space) {
		return sqlSession.update("spaceMapper.updateSpace", space);
	}
	
	
	/**
	 * 공간 사진 파일 수정 Dao
	 * @param sAtt
	 * @return result
	 */
	public int updateFile(SpaceAtt sAtt) {
		return sqlSession.update("spaceMapper.updateFile", sAtt);
	}

	/**
	 * 공간 가격 수정 Dao
	 * @param price
	 * @return result
	 */
	public int updatePrice(Price price) {
		return sqlSession.update("spaceMapper.updatePrice", price);
	}


	// 미리, 다운영역--------------------------------------------------------------------------------

   /**
    * 공간 상세보기 조회 
    * @param spaceId
    * @return
    */
   public Space selectspaceDetail(int spaceId) {
      
      return sqlSession.selectOne("spaceMapper.selectspaceDetail",spaceId);
  }
  
   /**
    * 공간 유형 타입 Dao
    * @param typeId
    * @return 
    */
   public Type selectTypeName(int typeId) {
      
      return sqlSession.selectOne("spaceMapper.selectTypeName",typeId);
   }

   /**
    * 공간 세부 옵션 조회 Dao
    * @return
    */
   public ArrayList<Option> selectOptionList() {
      
      return (ArrayList)sqlSession.selectList("spaceMapper.selectOptionList");
   }

   /**   
    * 찜하기
    * @param wishList
    * @return
    * @throws Exception
    */
   public int wishList(WishList wishList) throws Exception{
      
      return sqlSession.insert("spaceMapper.wishList", wishList);
   }

   /**
    * 찜 여부 조회하기 
    * @param wishList
    * @return
    */
   public int wishSelect(WishList wishList) {
      return sqlSession.selectOne("spaceMapper.wishSelect", wishList);
   }

   /**
    * 찜 삭제하기 
    * @param wishList
    * @return
    */
   public int wishDelete(WishList wishList) {
      
      return sqlSession.delete("spaceMapper.wishDelete", wishList);
   }

   /**
    * 공간 이미지 가져오기 
    * @param spaceId
    * @return
    */
   public ArrayList<SpaceAtt> spaceAttImg(int spaceId) {
      
      return (ArrayList)sqlSession.selectList("spaceMapper.spaceAttImg", spaceId);
   }

   /**
    * 호스트 다른 공간
    * @param hostId
    * @return
    */
   public ArrayList<Space> hostSpace(int hostId) {
   
      return (ArrayList)sqlSession.selectList("spaceMapper.hostSpace", hostId);
   }

	/** 
	 * 일치한 요일의 금액 조회
	 * @param price
	 * @return
	 */
	public Price selectPriceList(Price price) {
		
		return sqlSession.selectOne("spaceMapper.selectPriceList",price);
	}

	public ArrayList<DayOff> dayOffList(int spaceId) {
		return (ArrayList)sqlSession.selectList("spaceMapper.dayOffList", spaceId);
	}

	/**
	 * 해당 공간의 예약 조회
	 * @param book
	 * @return
	 */
	public ArrayList<Book> bookTime(Book book) {
		return (ArrayList)sqlSession.selectList("spaceMapper.bookTime", book);
	}

	/**
	 * 휴일 리스트 수 조회 Dao
	 * @param search
	 * @return result
	 */
	public int getdListCount(HostSearch search) {
		return sqlSession.selectOne("spaceMapper.getdListCount", search);
	}

	/**
	 * 휴일 리스트 조회 Dao
	 * @param search
	 * @param pageInfo
	 * @return dList
	 */
	public ArrayList<DayOff> selectDayoffList(HostSearch search, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getLimit());
		return (ArrayList)sqlSession.selectList("spaceMapper.selectDayoffList", search, rowBounds);
	}

	/**
	 * 공간 운영여부 변경 Dao
	 * @param search
	 * @return result
	 */
	public int updateOperStatus(HostSearch search) {
		return sqlSession.update("spaceMapper.updateOperStatus", search);
	}

	/**
	 * 공간 휴일 등록 Dao
	 * @param dayoff
	 * @return result
	 */
	public int insertDayoff(DayOff dayoff) {
		return sqlSession.insert("spaceMapper.insertDayoff", dayoff);
	}

	/**
	 * 호스트의 공간 리스트 Dao
	 * @param hostId
	 * @return sList
	 */
	public ArrayList<Space> selectSpaceList(int hostId) {
		return (ArrayList)sqlSession.selectList("hostMapper.selectSpaceList", hostId);
	}

	/**
	 * 공간 휴일 등록 전 예약 체크 Dao
	 * @param dayoff
	 * @return result
	 */
	public int selectCheckDayoff(DayOff dayoff) {
		return sqlSession.selectOne("spaceMapper.selectCheckDayoff", dayoff);
	}

	/**
	 * 공간 휴일 삭제 Dao
	 * @param string
	 * @return
	 */
	public int deleteDayoff(int dayoffId) {
		return sqlSession.delete("spaceMapper.deleteDayoff", dayoffId);
	}

	/**
	 * 공간 사진 파일ID 조회 Dao
	 * @param spaceId
	 * @param prevFileName
	 * @return attId
	 */
	public int getAttId(String prevFileName) {
		return sqlSession.selectOne("spaceMapper.getAttId", prevFileName);
	}

	/**
	 * 공간 가격 삭제 Dao
	 * @param spaceId
	 * @return result
	 */
	public int deleteSpacePrice(int spaceId) {
		return sqlSession.delete("spaceMapper.deleteSpacePrice", spaceId);
	}

	/**
	 * 공간 휴일 삭제 Dao
	 * @param spaceId
	 * @return result
	 */
	public int deleteSpaceDayoff(int spaceId) {
		return sqlSession.delete("spaceMapper.deleteSpaceDayoff", spaceId);
	}

	/**
	 * 호스트 정보 조회 Dao
	 * @param memberId
	 * @return host
	 */
	public Host selectOne(String memberId) {
		return sqlSession.selectOne("hostMapper.selectOne", memberId);
	}
}