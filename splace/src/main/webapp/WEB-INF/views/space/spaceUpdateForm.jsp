<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<style>
	#noticeList > span, #offList > span {
		display: block;
		border-bottom: 1px solid #c9c9c9;
	}
	#optionField > ul > li {
		display: inline-block;
		width: 24%;
		box-sizing: border-box;
	}
	/* 파일 필드 숨기기 */
	input[type="file"] {
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip:rect(0,0,0,0);
		border: 0;
	}
	#imageArea .image:hover {
		cursor: pointer;
	}
	.inputArea {
		border-top: 3px solid #4C74B9;
	}
</style>
<title>공간 수정</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			<!-- Host Menu -->
				<jsp:include page="/WEB-INF/views/host/hostMenu.jsp"/>
			<!-- Content -->
				<section>
					<h1 class="align-center">공간 수정</h1>	
					<form method="post" action="spaceInsert.sp" enctype="multipart/form-data">
						<h2>1. 기본정보</h2>
						<div class="row gtr-uniform inputArea">
							<div class="col-12 col-12-xsmall">
								<label for="spaceName">공간이름</label>
								<p>라운지앤스터디</p>
							</div>
							<div class="col-12 col-12-small"><label>공간유형</label></div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId1" name="typeId" value="1" checked>
								<label for="typeId1">스터디룸</label>
							</div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId2" name="typeId" value="2">
								<label for="typeId2">파티룸</label>
							</div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId3" name="typeId" value="3">
								<label for="typeId3">스튜디오</label>
							</div>
							<div class="col-2 col-12-small">
								<input type="radio" id="typeId4" name="typeId" value="4">
								<label for="typeId4">회의실</label>
							</div>
							<div class="col-4 col-12-small">
								<input type="radio" id="typeId5" name="typeId" value="5">
								<label for="typeId5">카페</label>
							</div>
							<div class="col-12 col-12-xsmall">
								<label for="spaceAddress">주소</label>
								<p>서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</p>
							</div>
						</div>
						<br><br>
						<h2>2. 공간정보</h2>
						<div class="row gtr-uniform inputArea">
							<div class="col-12 col-12-xsmall">
								<label for="spaceComment">* 한줄소개 <span id="commentLength"></span></label>
								<input type="text" name="spaceComment" id="spaceComment" placeholder="한줄소개" maxlength="100" value="라운지앤스터디" required>
							</div>
							<div class="col-12">
								<label for="spaceDetail">* 상세소개 <span id="detailLength"></span></label>
								<textarea name="spaceDetail" id="spaceDetail" placeholder="상세소개" rows="6" maxlength="10000" required>- 강연과 더불어 함께 취준을 준비하는 커뮤니티가 있는 공간</textarea>
							</div>
							
							<div class="col-10 col-12-xsmall">
								<label for="tag">태그 <span id="tagLength"></span></label>
								<input type="text" id="tag" placeholder="태그">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addTagBtn" value="추가">
							</div>
							<div class="col-12 col-12-xsmall" id="tagList"></div>
							<!-- <input type="hidden" name="spaceTag" id="spaceTag" maxlength="150"> -->
							<input type="text" name="spaceTag" id="spaceTag" maxlength="150">
							
							<div class="col-12 col-12-xsmall">
								<label>세부옵션</label>
								<div class="row" id="optionField">
									<ul>
										<li>
											<input type="checkbox" id="option1" class="option" value="1" checked>
											<label for="option1"><i class="material-icons">fastfood</i> 음식물반입가능</label>
										</li>
										<li>
											<input type="checkbox" id="option2" class="option" value="2" checked>
											<label for="option2"><i class="material-icons">local_parking</i> 주차가능</label>
										</li>
										<li>
											<input type="checkbox" id="option3" class="option" value="3">
											<label for="option3"><i class="material-icons">mic</i> 음향/마이크</label>
										</li>
										<li>
											<input type="checkbox" id="option4" class="option" value="4" checked>
											<label for="option4"><i class="material-icons">wifi</i> 인터넷/와이파이</label>
										</li>
										<li>
											<input type="checkbox" id="option5" class="option" value="5">
											<label for="option5"><i class="material-icons">pets</i> 반려동물동반가능</label>
										</li>
										<li>
											<input type="checkbox" id="option6" class="option" value="6" checked>
											<label for="option6"><i class="material-icons">smoke_free</i> 금연</label>
										</li>
										<li>
											<input type="checkbox" id="option7" class="option" value="7">
											<label for="option7"><i class="material-icons">live_tv</i> TV/프로젝터</label>
										</li>
										<li>
											<input type="checkbox" id="option8" class="option" value="8">
											<label for="option8"><i class="material-icons">local_bar</i> 주류반입가능</label>
										</li>
										<li>
											<input type="checkbox" id="option9" class="option" value="9" checked>
											<label for="option9"><i class="material-icons">local_printshop</i> 복사/인쇄기</label>
										</li>
										<li>
											<input type="checkbox" id="option10" class="option" value="10" checked>
											<label for="option10"><i class='fas fa-restroom'></i> 화장실</label>
										</li>
										<li>
											<input type="checkbox" id="option11" class="option" value="11" checked>
											<label for="option11"><i class='fas fa-chalkboard'></i> 화이트보드</label>
										</li>
										<li>
											<input type="checkbox" id="option12" class="option" value="12" checked>
											<label for="option12"><i class='fab fa-hotjar'></i> 난방기</label>
										</li>
										<li>
											<input type="checkbox" id="option13" class="option" value="13" checked>
											<label for="option13"><i class='fas fa-wind'></i> 에어컨</label>
										</li>
										<li>
											<input type="checkbox" id="option14" class="option" value="14">
											<label for="option14"><i class='fas fa-video'></i> CCTV</label>
										</li>
									</ul>
								</div>
							</div>
							
							<div class="col-12 col-12-xsmall">
								<input type="text" name="spaceOption" id="spaceOption" readonly>
							</div>
							
							<div class="col-10 col-12-xsmall">
								<label for="">주의사항 <span id="noticeLength"></span></label>
								<input type="text" id="notice" placeholder="주의사항">
							</div>
							<div class="col-2 col-12-xsmall">
								<label>&nbsp;</label>
								<input type="button" class="button primary small" id="addNoticeBtn" value="추가">
							</div>
							<div class="col-12 col-12-xsmall" id="noticeList"></div>
							<!-- <input type="hidden" name="spaceNotice" id="spaceNotice" maxlength="1000"> -->
							<input type="text" name="spaceNotice" id="spaceNotice" maxlength="1000">
							
						</div>
						<br><br>
						
						<h2>3. 이용정보</h2>
						<div class="row gtr-uniform inputArea">
							<div class="col-4 col-12-xsmall">
								<label for="spaceOpenTime">* 운영시작시간(0 ~ 24)</label>
								<input type="number" name="spaceOpenTime" id="spaceOpenTime" min="0" max="24" value="8">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceCloseTime">* 이용종료시간(0 ~ 24)</label>
								<input type="number" name="spaceCloseTime" id="spaceCloseTime" min="1" max="24" value="23">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceTime">* 최소예약시간(시간)</label>
								<input type="number" name="spaceTime" id="spaceTime" min="1" max="24" value="2">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceMinPer">* 최소예약인원(명)</label>
								<input type="number" name="spaceMinPer" id="spaceMinPer" min="1" value="3">
							</div>
							<div class="col-4 col-12-xsmall">
								<label for="spaceMaxPer">* 최대수용인원(명)</label>
								<input type="number" name="spaceMaxPer" id="spaceMaxPer" min="1" value="10">
							</div>
							<div class="col-4 col-12-xsmall">
							</div>
						</div>
						<br><br>
						
						<h2>4. 이미지</h2>
						<!-- <div class="box alt"> -->
							<div class="row gtr-uniform inputArea" id="imageArea">
								<div class="col-2 col-12-xsmall">
									<label for="mainFile" class="button primary small">메인 이미지 등록</label>
									<input type="file" name="uploadFile" id="mainFile" value="등록" onchange="loadImg(this,1);" required>
									<img id="mainImg" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile1" class="button small">이미지1 등록</label>
									<input type="file" name="files" id="subFile1" value="등록" multiple onchange="loadImg(this,1);">
									<img id="subImg1" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile2" class="button small">이미지2 등록</label>
									<input type="file" name="files" id="subFile2" value="등록" multiple onchange="loadImg(this,2);">
									<img id="subImg2" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile3" class="button small">이미지3 등록</label>
									<input type="file" name="files" id="subFile3" value="등록" multiple onchange="loadImg(this,3);">
									<img id="subImg3" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile4" class="button small">이미지4 등록</label>
									<input type="file" name="files" id="subFile4" value="등록" multiple onchange="loadImg(this,4);">
									<img id="subImg4" class="image fit">
								</div>
								<div class="col-2">
									<label for="subFile5" class="button small">이미지5 등록</label>
									<input type="file" name="files" id="subFile5" multiple onchange="loadImg(this,5);">
									<img id="subImg5" class="image fit">
								</div>
							</div>
						<!-- </div> -->
						<br><br>
						<div class="row">
							<div class="col-3"></div>
							<div class="col-3"><input type="submit" class="button primary fit" value="수정"></div>
							<div class="col-3"><input type="button" class="button fit" value="취소" onclick="location.href='spaceList.sp'"></div>
							<div class="col-3"></div>
						</div>
					</form>
				</section>
				
				<script>
					
					// 입력된 글자 길이를 체크하여 화면에 표시
					function maxLengthCheck(id){
						var txtObj = $("#" + id); // 정보가 입력되는 input 태그 id
						var txtLen = $("#" + id.substring(5).toLowerCase() + "Length"); // 길이 표시될 span 태그 id
						var maxLength = Number(txtObj.attr("maxlength"));
						var strLength = Number(byteCheck(txtObj));
						if (strLength > maxLength) txtLen.html(strLength).css("color", "red");
						else txtLen.html(strLength).css("color", "#4C74B9");
					}
					
					// 글자 바이트 체크
					function byteCheck(el){
						var codeByte = 0;
						for (var i = 0; i < el.val().length; i++) {
							var oneChar = escape(el.val().charAt(i));
							if ( oneChar.length == 1 ) {
								codeByte ++;
							} else if (oneChar.indexOf("%u") != -1) {
								codeByte += 3; // 한글 3
							} else if (oneChar.indexOf("%") != -1) {
								codeByte ++;
							}
						}
						return codeByte;
					}
					
					// 이미지 업로드
					function loadImg(value, num) {
						var reader = new FileReader(); // FileReader -> javascript
						console.log(reader);
						var imgId = "#" + $(value).attr("id").replace("File", "Img");
						// reader.onload : reader 객체가 생성된 경우 이벤트 발생
						reader.onload = function(e) {
							$(imgId).attr("src", e.target.result); // e.target this와 비슷, e.target.result 해당 파일 이름(경로포함)
						}
						// 보안처리(Data URI) : RFC 2397 정의되어 있는 개발 규약
						// 미사용 시 파일 경로가 모두 표시됨, 파일 경로를 알 수 없게 만들어줌 (파일의 직접적인 경로 노출 방지)
						reader.readAsDataURL(value.files[0]);
					}
					
					$(document).ready(function(){
						
						// 이미지 클릭 시 원본 이미지 보여주는 창 열기
						$("#imageArea .image").click(function(){
							var url = $(this).attr("src");
							// 원본 이미지 사이즈
							var width = $(this).get(0).naturalWidth;
							var height = $(this).get(0).naturalHeight;
							imageWin = window.open(url, "원본 이미지", "width=" + width + ",height=" + height + ",top=200,left=200,scrollbars=yes");
							imageWinTag = "<html><head><title>원본 이미지</title></head>"
										 + "<body background='" + url + "' onclick='self.close()' "
										 + "style='cursor:hand;background-repeat:no-repeat;' title='닫기'>"
										 + "</body></html>";
							imageWin.document.write(imageWinTag);
						});
						
						// 입력되는 글자 수 체크
						$("#spaceName, #spaceComment, #spaceDetail, #spaceTag, #spaceNotice").keyup(function(){
							maxLengthCheck($(this).attr("id"));
						});
						
						// 태그 목록 생성
						// 저장 형태 : #태그1#태그2#태그3
						$("#addTagBtn").click(function(){
							var tag = $("#tag").val();
							var tags = $("#spaceTag").val();
							if (tag != "") {
								var $tagList = $("#tagList");
								var $span = $("<span class='tag'>").text("#"+tag);
								var $clear = $("<i class='material-icons tagClear'>").text("cancel");
								$span.append($clear);
								$tagList.append($span);
								$("#spaceTag").val(tags + "#" + tag);
								// 입력되는 글자 수 체크
								maxLengthCheck("spaceTag");
								$("#tag").val("");
							}
						});
						
						// 태그 삭제 아이콘 클릭 시 태그 목록에서 제거
						$(document).on("click", ".tagClear", function(){
							var iconTag = $(this);
							var spanTag = $(this).parent();
							iconTag.remove();
							var spanText = spanTag.text();
							spanTag.remove();
							$("#spaceTag").val($("#spaceTag").val().replace(spanText, ""));
							// 입력되는 글자 수 체크
							maxLengthCheck("spaceTag");
						});
						
						// 주의사항 목록 생성
						$("#addNoticeBtn").click(function(){
							var notice = $("#notice").val();
							if (notice != "") {
								var $noticeList = $("#noticeList");
								var $span = $("<span class='notice'>").text(notice);
								var $clear = $("<i class='material-icons noticeClear'>").text("cancel");
								$span.append($clear);
								$noticeList.append($span);
								$("#notice").val("");
								noticeListChange(notice);
							}
						});

						// 주의사항 삭제 아이콘 클릭 시 주의사항 목록에서 제거
						$(document).on("click", ".noticeClear", function(){
							var iconTag = $(this);
							var spanTag = $(this).parent();
							iconTag.remove();
							var spanText = "#"+spanTag.text();
							spanTag.remove();
							$("#spaceNotice").val($("#spaceNotice").val().replace(spanText, ""));
							// 입력되는 글자 수 체크
							maxLengthCheck("spaceNotice");
						});
						
						// 주의사항 저장 형태 : #주의사항1#주의사항2
						function noticeListChange(notice){
							var list = $("#spaceNotice").val();
							$("#spaceNotice").val(list + "#" + notice);
							// 입력되는 글자 수 체크
							maxLengthCheck("spaceNotice");
						};
						
						// 옵션 저장 형태 : #음식물반입가능#주차가능#반려동물동반가능
						$("#optionField input:checkbox").click(function(){
							var check = $(this).prop("checked");
							var option = $(this).val();
							var options = $("#spaceOption").val();
							// 옵션 선택 체크
							if (check == true) {
								$("#spaceOption").val(options + "#" + option);
							// 옵션 선택 해제
							} else {
								$("#spaceOption").val("");
								var arr = options.substring(1).split("#");
								var idx = arr.indexOf(option);
								arr.splice(idx, 1);
								if (arr.length > 0) {
									var str = arr.toString().replace(/,/gi, "#");
									$("#spaceOption").val("#" + str);
								}
							}
						});
						
					});
				</script>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>