package com.project.splace.review.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.splace.book.model.vo.Book;
import com.project.splace.review.model.dao.ReviewDao;
import com.project.splace.review.model.vo.Review;
import com.project.splace.review.model.vo.Review_ATT;

@Service("rService")
public class ReviewServiceImpl implements ReviewService{
   
   @Autowired
   private ReviewDao rDao;
   
   // 리뷰 등록
   @Override
   public int insertReview(Review review, List<MultipartFile> files, HttpServletRequest request) {
      System.out.println("여기는 서비스 임플 : " + review);
      // 개행문자 변경
      review.setReviewContent(review.getReviewContent().replace("\n", "<br>"));
      // 공간ID 생성
      int reviewId = rDao.selectReviewId();
      review.setReviewId(reviewId);
      System.out.println("reviewId : " +review );
      // 게시글 등록 (사진 제외 )
      int result = rDao.insertReview(review);
      
      // file등록--------------------
      
      // 리뷰 파일
      Review_ATT rAtt = new Review_ATT();
      
      if (result > 0 && !files.isEmpty()) {

         // 기존 업로드 파일이 있을 경우
         // 기존 파일 삭제
         for(int i = 0; i < files.size(); i++) {
            String renameFile = renameFile(files.get(i), reviewId, i);
            
            String filepath = saveFile(files.get(i), renameFile, request);
            System.out.println("filepath: "+filepath);
            
            if(filepath != null) {
               rAtt.setReviewAttOrigin(files.get(i).getOriginalFilename());
               rAtt.setReviewAttChange(renameFile);
               rAtt.setReviewAttFilepath(filepath);
               rAtt.setReviewId(reviewId);
            }
            
            result = rDao.insertReviewFile(rAtt);
         }
      }
      return result;
   }
   
   
   
      // 파일명 변경 메소드
      public String renameFile(MultipartFile file, int reviewId, int index) {
         
         // "공간아이디_순번.확장자"로 파일명 변경
         //SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
         String originFileName = file.getOriginalFilename();
         String renameFileName = reviewId + "_" + new Date().getTime() //index //+ "_" + sdf.format(new Date())
                           + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
         return renameFileName;
      }
      
      // 파일 저장 메소드
      public String saveFile(MultipartFile uploadFile, String renameFile, HttpServletRequest request) {
         // 파일 저장 경로
         String root = request.getSession().getServletContext().getRealPath("resources");
         String savePath = root + "\\ReviewImg";
         // 저장 폴더 선택
         File folder = new File(savePath);
         // 만약 해당 폴더가 없는 경우
         if (!folder.exists()) folder.mkdir(); // 폴더 생성
         
         String filePath = folder + "\\" + renameFile;
         
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
         
         return filePath;
      }
      
      
      
      
      // 리뷰 글 리스트 출력 
      @Override
      public ArrayList<Review> selectReview(int spaceId) {
         return rDao.selectReview(spaceId);
      }

      // 리뷰 작성한 이용자가 있는지 카운트 
      @Override
      public int selectWriteBtn(Book book) {
         return rDao.selectWriteBtn(book);
      }


      // 리뷰 조회 (사진)
      @Override
      public ArrayList<Review_ATT> selectReviewImg(int reviewId) {
         return rDao.selectReviewImg(reviewId);
      }


      // 리뷰 수정 조회
      @Override
      public Review reviewUpdate(int reviewId) {
         return rDao.reviewUpdate(reviewId);
      }

      // 파일 삭제 메소드
      //  공지글 등록 실패 또는 글 수정으로 업로드 파일이 변한 경우
      //  저장되어있는 기존 파일 삭제
      public void deleteFile(String fileName, 
                     HttpServletRequest request) {
         // 파일 저장 경로 설정
         String root 
            = request.getSession().getServletContext().getRealPath("resources");
         
         String savePath = root + "\\ReviewImg";
         
         // 삭제할 파일 경로 + 파일명
         File deleteFile = new File(savePath + "\\" + fileName);
         
         // 해당 파일이 존재할 경우 삭제
         if(deleteFile.exists()) {
            deleteFile.delete();
         }
         
      }
      
      // 리뷰 수정 
      @Override
      public int reviewUpdateSubmit(Review review, List<MultipartFile> files, HttpServletRequest request) {
         
         // 리뷰내용 수정
         review.setReviewContent(review.getReviewContent().replace("\n", "<br>"));
         int result = rDao.reviewUpdateSubmit(review);

         // file등록--------------------
         
         // 리뷰 사진 수정
         ArrayList<Review_ATT> rAtt = selectReviewImg(review.getReviewId());
         
         
         // 새로 업로드된 파일이 있을 경우 
         if (result > 0 && !files.isEmpty() && files!=null) {
            
            // 기존 업로드 파일이 있을 경우
            // 기존 파일 삭제
            for(int i = 0; i <files.size(); i++) {
               // 다지워
//               for(int j=0; j<rAtt.size(); j++) {
//                  if(!rAtt.get(j).getReviewAttOrigin().equals(files.get(i).getOriginalFilename())) {
//                     deleteFile(rAtt.get(i).getReviewAttChange(), request);
//                     int deleteResult = rDao.deleteReviewAtt(rAtt.get(i).getReviewAttId());
//                     System.out.println("파일삭제됨: "+deleteResult);                  
//                  }
//               }
               
               String renameFile = renameFile(files.get(i), review.getReviewId(), i);
               
               String savePath= saveFile(files.get(i), renameFile, request);
               System.out.println("savePath: "+savePath);
               
               Review_ATT rt = new Review_ATT();
               if(savePath != null) {
                  rt.setReviewAttOrigin(files.get(i).getOriginalFilename());
                  rt.setReviewAttChange(renameFile);
                  rt.setReviewAttFilepath(savePath);
                  rt.setReviewId(review.getReviewId());
               } else {
                  rt.setReviewAttFilepath(null);
               }
               
               result = rDao.insertReviewFile(rt);
            }
            
         }
         
         int reviewId = review.getReviewId();
         
         System.out.println("사비스 임플 reviewId : "+reviewId);
         
         
         System.out.println("result:" +result);
         
         
         return result;
      }


      
      // 리뷰 삭제 
      @Override
      public int reviewDelete(int reviewId) {
         return rDao.reviewDelete(reviewId);
      }



      // 리뷰파일삭제
      @Override
      public int deleteFileAtt(String src, HttpServletRequest request) {
         deleteFile(src, request);
         int deleteResult = rDao.reviewAttDeleteSRC(src);
         System.out.println("파일삭제됨: "+deleteResult);
         
         return deleteResult;
      }

      

      

}