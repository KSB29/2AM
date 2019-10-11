package com.project.splace.space.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.splace.space.model.dao.SpaceDao;
import com.project.splace.space.model.vo.Option;
import com.project.splace.space.model.vo.Price;
import com.project.splace.space.model.vo.Space;
import com.project.splace.space.model.vo.SpaceAtt;
import com.project.splace.space.model.vo.Type;
import com.project.splace.space.model.vo.WishList;

@Service("sService")
public class SpaceServiceImpl implements SpaceService {
	
	@Autowired
	private SpaceDao sDao;
	
	@Override
	public int insertSpace(Space space, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files) {
		
		// 개행문자 변경
		space.setSpaceDetail(space.getSpaceDetail().replace("\n", "<br>"));
		
		// file명 변경
		String renameFileName = null;
		
		// 공간ID 생성
		int spaceId = sDao.selectSpaceId();
		space.setSpaceId(spaceId);
		
		// 공간 등록
		int result = sDao.insertSpace(space);
		
		// 공간 정보 파일
		SpaceAtt sAtt = new SpaceAtt();
		// 업로드된 파일이 있을 경우 파일명 변경
		// 파일이 없을 경우 null이 아니라 빈문자열로 전송이 됨
		if (result > 0 && !uploadFile.getOriginalFilename().equals("")) {
			renameFileName = renameFile(uploadFile, spaceId, 0); // 변경된 파일명
			sAtt.setSpaceAttOrigin(uploadFile.getOriginalFilename());
			sAtt.setSpaceAttChange(renameFileName);
			sAtt.setSpaceId(spaceId);
			sAtt.setSpaceAttType("0"); // 대표사진
			// 서버에 파일 저장
			if (renameFileName != null) result = saveFile(renameFileName, uploadFile, request);
			// DB에 파일 저장
			if (result > 0) result = sDao.insertFile(sAtt);
		}
		
		if (result > 0 && files.size() > 0) {
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).getOriginalFilename().equals("")) {
					renameFileName = renameFile(files.get(i), spaceId, i+1); // 변경된 파일명
					sAtt.setSpaceAttOrigin(files.get(i).getOriginalFilename());
					sAtt.setSpaceAttChange(renameFileName);
					sAtt.setSpaceId(spaceId);
					sAtt.setSpaceAttType("1"); // 슬라이드
					// 서버에 파일 저장
					if (renameFileName != null) result = saveFile(renameFileName, files.get(i), request);
					// DB에 파일 저장
					if (result > 0) result = sDao.insertFile(sAtt);
				}
			}
		}
		return result;
	}
	
	
	// 파일명 변경 메소드
	public String renameFile(MultipartFile file, int spaceId, int index) {
		
		// "공간아이디_순번.확장자"로 파일명 변경
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = spaceId + "_" + index //+ "_" + sdf.format(new Date())
								+ "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
		return renameFileName;
	}
	
	// 파일 저장 메소드
	public int saveFile(String renameFileName, MultipartFile uploadFile, HttpServletRequest request) {
		// 파일 저장 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\spaceImg";
		// 저장 폴더 선택
		File folder = new File(savePath);
		// 만약 해당 폴더가 없는 경우
		if (!folder.exists()) folder.mkdir(); // 폴더 생성
		
		String filePath = folder + "\\" + renameFileName;
		
		// 파일 저장 성공 여부, 성공 1, 실패 0
		int result = 0;
		
		try {
			uploadFile.transferTo(new File(filePath)); // 실제 파일 저장
			// 업로드된 파일을 filePath에 지정된 경로 + 파일명으로 저장
			// IOException 예외 처리 필요
			result = 1;
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			//throw new BoardException("파일 전송 에러");
		}
		
		return result;
	}


	@Override
	public ArrayList<Space> selectList(String memberId) {
		return sDao.selectList(memberId);
	}


	@Override
	public ArrayList<Type> selectType() {
		return sDao.selectType();
	}


	@Override
	public ArrayList<Option> selectOption() {
		return sDao.selectOption();
	}

	@Override
	public ArrayList<Price> selectPrice(int spaceId) {
		return sDao.selectPrice(spaceId);
	}


	@Override
	public int insertPrice(int spaceId, int spaceAdd, String[] spacePrice) {
		int result = 0;
		
		// 가격 정보 필수 입력이지만 체크
		if (spacePrice.length > 0) {
			// 공간 가격 등록
			String dayArr[] = {"월", "화", "수", "목", "금", "토", "일", "휴"};
			int day;
			Price price = new Price();
			for (int i = 0; i < spacePrice.length; i++) {
				day = Integer.parseInt(spacePrice[i].substring(0, 1));
				price.setPriceWeekend(dayArr[day-1]);
				price.setPriceTime(spacePrice[i].substring(1));
				price.setSpaceId(spaceId);
				result += sDao.insertPrice(price);
			}
			if (result == spacePrice.length) result = 1;
			else result = 0;
		}
		
		// 1 인당 추가 금액 저장
		// 최초 등록이라 0보다 클 경우에만 저장
		if (result > 0 && spaceAdd > 0) {
			Space space = new Space();
			space.setSpaceId(spaceId);
			space.setSpaceAdd(spaceAdd);
			result = sDao.updateAddPrice(space);
		}
		
		return result;
	}

	
	@Override
	public int updateApply(int spaceId) {
		return sDao.updateApply(spaceId);
	}


	@Override
	public int deleteSpace(int spaceId) {
		return sDao.deleleSpace(spaceId);
	}

	@Override
	public Space selectSpace(int spaceId) {
		return sDao.selectSpace(spaceId);
	}


	@Override
	public ArrayList<SpaceAtt> selectSpaceAtt(int spaceId) {
		return sDao.selectSpaceAtt(spaceId);
	}


	@Override
	public int updateSpace(Space space, int filesIndex, HttpServletRequest request, MultipartFile uploadFile,
			List<MultipartFile> files) {
		
		// 개행문자 변경
		space.setSpaceDetail(space.getSpaceDetail().replace("\n", "<br>"));
		
		// file명 변경
		// 새로 업로드된 파일이 있을 경우
		String renameFileName = null;
		
		int spaceId = space.getSpaceId();
		
		// 공간 정보 수정
		int result = sDao.updateSpace(space);
		
		// 업로드된 파일이 있을 경우 파일명 변경
		// 파일이 없을 경우 null이 아니라 빈문자열로 전송이 됨
		// 공간 정보 파일
		SpaceAtt sAtt = new SpaceAtt();
		if (result > 0 && !uploadFile.getOriginalFilename().equals("")) {
			renameFileName = renameFile(uploadFile, spaceId, 0); // 변경된 파일명
			sAtt.setSpaceAttOrigin(uploadFile.getOriginalFilename());
			sAtt.setSpaceAttChange(renameFileName);
			sAtt.setSpaceId(spaceId);
			sAtt.setSpaceAttType("0"); // 대표사진
			// 서버에 파일 저장
			if (renameFileName != null) result = saveFile(renameFileName, uploadFile, request);
			// DB에 파일 저장
			if (result > 0) result = sDao.updateFile(sAtt);
		}
		System.out.println(filesIndex);
		if (result > 0 && files.size() > 0) {
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).getOriginalFilename().equals("")) {
					System.out.println(i + " : " + files.get(i).getOriginalFilename());
					renameFileName = renameFile(files.get(i), spaceId, i+1); // 변경된 파일명
					sAtt.setSpaceAttOrigin(files.get(i).getOriginalFilename());
					sAtt.setSpaceAttChange(renameFileName);
					sAtt.setSpaceId(spaceId);
					sAtt.setSpaceAttType("1"); // 슬라이드
					// 서버에 파일 저장
					if (renameFileName != null) result = saveFile(renameFileName, files.get(i), request);
					// DB에 파일 저장
					if (result > 0) {
						if (filesIndex < i + 1 ) result = sDao.insertFile(sAtt);
						else result = sDao.updateFile(sAtt);
					}
				}
			}
		}
		return result;
	}


	@Override
	public int updatePrice(int spaceId, int spaceAdd, String[] spacePrice) {
		int result = 0;
		
		// 1 인당 추가 금액 저장
		if (spaceAdd >= 0) {
			Space space = new Space();
			space.setSpaceId(spaceId);
			space.setSpaceAdd(spaceAdd);
			result = sDao.updateAddPrice(space);
		}
		
		if (spaceAdd >= 0 && result > 0 ) {
			// 공간 가격 등록
			int priceId;
			Price price = new Price();
			for (int i = 0; i < spacePrice.length; i++) {
				int place = spacePrice[i].indexOf('[');
				priceId = Integer.parseInt(spacePrice[i].substring(0, place));
				price.setPriceId(priceId);
				price.setPriceTime(spacePrice[i].substring(place));
				price.setSpaceId(spaceId);
				
				result += sDao.updatePrice(price);
			}
			if (result == spacePrice.length) return 1;
			else return 0;
		} else {
			return result;
		}
	}
	


	// 미리, 다운영역--------------------------------------------------------------------------------

	// 공간 상세보기 조회 
	@Override
	public Space selectspaceDetail(int spaceId) {
		
		return sDao.selectspaceDetail(spaceId);
  }
	
	// 공간 유형 타입 조회
	@Override
   public Type selectTypeName(int typeId) {
      
      return sDao.selectTypeName(typeId);
   }

   // 공간 세부 옵션 조회
   @Override
   public ArrayList<Option> selectOptionList() {
      
      return sDao.selectOptionList();
   }

   // 공간 찜하기 
   @Override
   public int wishList(WishList wishList) throws Exception{
   
      return sDao.wishList(wishList);
   }

   // 찜 조회
   @Override
   public int wishSelect(WishList wishList) {
      return sDao.wishSelect(wishList);
   }

   //찜 삭제
   @Override
   public int wishDelete(WishList wishList) {
      return sDao.wishDelete(wishList);
   }

   // 이미지 가져오기
   @Override
   public ArrayList<SpaceAtt> spaceAttImg(int spaceId) {
      return sDao.spaceAttImg(spaceId);
   }

   // 호스트의 다른 공간 조회
   @Override
   public ArrayList<Space> hostSpace(int hostId) {
      return sDao.hostSpace(hostId);
   }


   // 일치 요일의 가격 조회
	@Override
	public Price selectPriceList(Price price) {
		return sDao.selectPriceList(price);
	}

	



}