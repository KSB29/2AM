package com.project.splace.space.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

@Service("sService")
public class SpaceServiceImpl implements SpaceService {
	
	@Autowired
	private SpaceDao sDao;
	
	@Autowired
	private SpaceAtt sAtt;
	
	@Autowired
	private Price price;
	
	@Override
	public int insertSpace(Space space, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files) {
		
		// 개행문자 변경
		space.setSpaceDetail(space.getSpaceDetail().replace("\n", "<br>"));
		
		// file명 변경
		String renameFileName = null;
		
		// 공간ID 생성
		int spaceId = sDao.selectSpaceId();
		space.setSpaceId(spaceId);
		int result = sDao.insertSpace(space);
		
		// 업로드된 파일이 있을 경우 파일명 변경
		// 파일이 없을 경우 null이 아니라 빈문자열로 전송이 됨
		if (!uploadFile.getOriginalFilename().equals("")) {
			renameFileName = renameFile(uploadFile, spaceId, 0); // 변경된 파일명
			sAtt.setSpaceId(spaceId);
			sAtt.setSpaceAttOrigin(uploadFile.getOriginalFilename());
			sAtt.setSpaceAttChange(renameFileName);
			// 서버에 파일 저장
			result = saveFile(renameFileName, uploadFile, request);
		}
		
		// DB에 파일 저장
		result = sDao.insertFile(sAtt);
		
		/*if (files.size() > 0) {
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).getOriginalFilename().equals("")) {
					renameFileName = renameFile(files.get(i), spaceId, i);
					//System.out.println(renameFileName);
					// 서버에 파일 저장
					result = saveFile(renameFileName, files.get(i), request);
				}
			}
		}*/
		
		// 서버에 파일 저장
		//if (renameFileName != null && result == 1) {
		//	result = saveFile(renameFileName, uploadFile, request);
		//}
		return result;
	}
	
	
	// 파일명 변경 메소드
	public String renameFile(MultipartFile file, int spaceId, int index) {
		
		// "공간아이디_순번_년월일시분초.확장자"로 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = spaceId + "_" + index + "_" + sdf.format(new Date()) + "."
							+ originFileName.substring(originFileName.lastIndexOf(".")+1);
		return renameFileName;
	}
	
	// 파일 저장 메소드
	public int saveFile(String renameFileName, MultipartFile uploadFile, HttpServletRequest request) {
		// 파일 저장 경로
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\spaceImg";
		System.out.println("savePath : " + savePath);
		
		// 저장 폴더 선택
		File folder = new File(savePath);
		
		// 만약 해당 폴더가 없는 경우
		if (!folder.exists()) folder.mkdir(); // 폴더 생성
		
		String filePath = folder + "\\" + renameFileName;
		System.out.println("filePath : " + filePath);
		
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
	public ArrayList<Price> selectPrice(String spaceId) {
		return sDao.selectPrice(spaceId);
	}


	@Override
	public int insertPrice(int spaceId, String[] spacePrice) {
		// {1},
		String dayArr[] =  {"월", "화", "수", "목", "금", "토", "일", "휴"};
		int result = 0;
		for (int i = 0; i < spacePrice.length; i++) {
			price.setPriceWeekend(dayArr[i]);
			price.setPriceTime(spacePrice[i].substring(4));
			price.setSpaceId(spaceId);
			
			result += sDao.insertPrice(price);
			
			System.out.println(spacePrice[i].toString());
		}
		if (result == spacePrice.length) return 1;
		else return 0;
	}

}
