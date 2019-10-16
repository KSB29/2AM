/**
 * 공간 정보
 */
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
	
	$(".imgClear").on("click", function(){
		if (confirm("이미지를 삭제하시겠습니까?")) {
			//var id = $(this).attr("id").replace("delBtn","");
			//$("#subFile"+id).val("");
			//$("#subImg"+id).prop("src","");
			
		} else {
			return false;
		}
	});

	// 공간 수정 시 정보 표시
	if ($("#spaceId").val() != null) {
		
		if ($("#statusId").val() == "0" || $("#statusId").val() == "3") maxLengthCheck("spaceName");
		maxLengthCheck("spaceComment");
		maxLengthCheck("spaceDetail");
		
		var option = $("#spaceOption").val();
		var tag = $("#spaceTag").val();
		var notice = $("#spaceNotice").val();
		// 옵션
		if (option != null) {
			var optionArr = option.substring(1).split("#");
			for (var i = 0; i < optionArr.length; i++) {
				$("#option"+optionArr[i]).prop("checked", "true").next().css("color", "#4C74B9");
			}
		}
		// 태그
		if (tag != null) {
			// 글자 수 표시
			$("#tagLength").html(byteCheck($("#spaceTag"))).css("color", "#4C74B9");
			var tagArr = tag.substring(1).split("#");
			if (tagArr != "") {
				// 태그 리스트에 추가
				var $tagList = $("#tagList");
				for (var i = 0; i < tagArr.length; i++) {
					var $span = $("<span class='tag'>").text("#"+tagArr[i]);
					var $clear = $("<i class='material-icons tagClear warningColor'>").text("cancel");
					$span.append($clear);
					$tagList.append($span);
				}
			}
		}
		// 주의사항
		if (notice != null) {
			// 글자 수 표시
			$("#noticeLength").html(byteCheck($("#spaceNotice"))).css("color", "#4C74B9");
			var noticeArr = notice.substring(1).split("#");
			if (noticeArr != "") {
				// 주의사항 리스트에 추가
				var $noticeList = $("#noticeList");
				for (var i = 0; i < noticeArr.length; i++) {
					var $span = $("<span class='notice'>").text(noticeArr[i]);
					var $clear = $("<i class='material-icons noticeClear warningColor'>").text("cancel");
					$span.append($clear);
					$noticeList.append($span);
				}
			}
		}
	}
	
	// 정규식 체크 알림
	$("#regCheck1").css("display", "none");
	
	// 전화번호 정규식
	$("#spacePhone").on("input", function(){
        var input = $("#spacePhone").val();
        var regExp = /^[0-9]+$/;
        if (regExp.test(input)){
			$("#regCheck1").css("display", "none");
			$("#regCheck1 span").text("");
			regExpCheck = true;
        } else {
        	$("#regCheck1").css("display", "block");
			$("#regCheck1 span").text("숫자만 입력해주세요!").css("color","#cc0000");
            regExpCheck = false;
        }
    });
	
	$("#addressBtn").click(function(){
		$("#addressBtn").postcodifyPopUp();
	});
	
	$("#submitBtn").click(function(){
		
		var typeId = $("input:radio").attr("checked", true);
		console.log(typeId);
		
		if ($("#spaceTag").val() == "") {
			alert("태그를 입력해주세요.");
			$("#tag").focus();
			return false;
		};
		
		if ($("#spaceOption").val() == "") {
			alert("세부옵션을 입력해주세요.");
			return false;
		};
		
		if ($("#spaceNotice").val() == "") {
			alert("주의사항을 입력해주세요.");
			$("#notice").focus();
			return false;
		};
		
		$("form").submit();
		
	});
	
	$(".tagClear").css("cursor", "pointer");
	$(".imgClear").css("cursor", "pointer");
	
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
			var $clear = $("<i class='material-icons tagClear warningColor'>").text("cancel");
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
			var $clear = $("<i class='material-icons noticeClear warningColor'>").text("cancel");
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
	
	// 옵션 저장 형태 : #A#B#C
	$("#optionField input:checkbox").click(function(){
		var check = $(this).prop("checked");
		var option = $(this).val();
		var options = $("#spaceOption").val();
		// 옵션 선택 체크
		if (check == true) {
			$("#spaceOption").val(options + "#" + option);
			$(this).next().css("color", "#4C74B9");
		// 옵션 선택 해제
		} else {
			$("#spaceOption").val("");
			$(this).next().css("color", "#585858");
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