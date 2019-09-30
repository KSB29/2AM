package com.project.splace.space.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.splace.space.model.vo.Space;

@Service("sService")
public class SpaceServiceImpl implements SpaceService {
	
	@Override
	public int insertSpace(Space space, HttpServletRequest request, MultipartFile uploadFile, List<MultipartFile> files) {
		// file명 변경
		String renameFileName = null;
		int result;
		
		// 업로드된 파일이 있을 경우 파일명 변경
		// 파일이 없을 경우 null이 아니라 빈문자열로 전송이 됨
		if (!uploadFile.getOriginalFilename().equals("")) {
			renameFileName = "5_main_" + renameFile(uploadFile); // 변경된 파일명
			System.out.println(renameFileName);
			//board.setOriginalFileName(uploadFile.getOriginalFilename());
			//board.setRenameFileName(renameFileName);
			result = saveFile(renameFileName, uploadFile, request);
			System.out.println(result);
		}
		
		if (files.size() > 0) {
			for (int i = 0; i < files.size(); i++) {
				if (!files.get(i).getOriginalFilename().equals("")) {
					renameFileName = "5_sub_" + i + "_" + renameFile(files.get(i));
					System.out.println(renameFileName);
					result = saveFile(renameFileName, files.get(i), request);
					System.out.println(result);
				}
			}
		}
		
		// DB에 게시글 저장
		//int result = sDao.insertSpace(space);
		result = 1;
		
		// 서버에 파일 저장
		//if (renameFileName != null && result == 1) {
		//	result = saveFile(renameFileName, uploadFile, request);
		//}
		return result;
	}
	
	
	// 파일명 변경 메소드
	public String renameFile(MultipartFile file) {
		
		// "년월일시분초.확장자"로 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "."
							+ originFileName.substring(originFileName.lastIndexOf(".")+1);
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

}
