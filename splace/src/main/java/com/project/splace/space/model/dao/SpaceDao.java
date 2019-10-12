package com.project.splace.space.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	 * 공간 리스트 조회 Dao
	 * @param memberId
	 * @return sList
	 */
	public ArrayList<Space> selectList(String memberId) {
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
}