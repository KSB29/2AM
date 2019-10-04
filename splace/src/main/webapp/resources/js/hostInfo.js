/**
 * 호스트 정보
 */

var regExpCheck = false;

function checkHostNo(value) {
	
	// 사업자등록번호 10자리
	// 123 국체청/세무서별코드
	// 45 개인/법인 구분코드
	// 6789 과세/면세/법인사업자등록/지정일자일련번호
	// 0 검증번호
	var hostNo = value.replace(/-/gi, "").split("").map(function(item) {
		return parseInt(item, 10);
	});
	
	if (hostNo.length == 10) {
		// 인증키 배열
		var multiply = new Array(1,3,7,1,3,7,1,3,5);
		var checkSum = 0;
		
		// 사업자등록번호 1 ~ 9번째 값, 인증키 1 ~ 9번째 값 각각 곱하여 더함
		for (var i = 0; i < multiply.length; i++) {
			checkSum += multiply[i] * hostNo[i];
		}
		
		// 각각의 9번째 값 곱한 후 10으로 나누고(소수점 제거) 합산 
		checkSum += parseInt((multiply[8] * hostNo[8]) / 10, 10);
		// 합계를 10으로 나눈 나머지를 10에서 빼기
		// 사업자등록번호 10번째 값과 동일하면 검증 완료
		return Math.floor(hostNo[9]) === (10 - (checkSum % 10));
	}
	
	return false;
}

$(document).ready(function(){
	
	// 승인 대기일 경우 수정버튼 비활성으로 설정
	if ($("#statusId").val() == 1) {
		$("#updateBtn").prop("disabled", true);
	}
	// 승인 상태일 경우 대표자명, 상호명, 사업자등록번호 비활성으로 설정
	if ($("#statusId").val() == 2) {
		$("#hostName").prop("disabled", true);
		$("#storeName").prop("disabled", true);
		$("#hostNo").prop("disabled", true);
	}
	
	// 정규식 체크 알림
	$("#regCheck1").css("display", "none");
	$("#regCheck2").css("display", "none");
	$("#regCheck3").css("display", "none");
	
	// 사업자 등록번호 체크
	$("#hostNo").on("input", function(){
		var input = $(this).val();
		var regExp = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
		if (regExp.test(input) && checkHostNo(input)) {
			$("#regCheck1").css("display", "none");
			$("#regCheck1 span").text("");
			regExpCheck = true;
		} else {
			$("#regCheck1").css("display", "block");
			$("#regCheck1 span").text("유효한 사업자등록번호를 입력해주세요!").css("color","#cc0000");
			regExpCheck = false;
		}
	});
	
	// 이메일 정규식
	$("#hostEmail").on("input", function(){
		var input = $("#hostEmail").val();
		var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		if (regExp.test(input)){
			$("#regCheck2").css("display", "none");
			$("#regCheck2 span").text("");
			regExpCheck = true;
		} else {
			$("#regCheck2").css("display", "block");
			$("#regCheck2 span").text("이메일 형식으로 작성해주세요!").css("color","#cc0000");
			regExpCheck = false;
		}
	});
	
	// 전화번호 정규식
	$("#hostPhone").on("input", function(){
        var input = $("#hostPhone").val();
        var regExp = /^[0-9]+$/;
        if (regExp.test(input)){
			$("#regCheck3").css("display", "none");
			$("#regCheck3 span").text("");
			regExpCheck = true;
        } else {
        	$("#regCheck3").css("display", "block");
			$("#regCheck3 span").text("숫자만 입력해주세요!").css("color","#cc0000");
            regExpCheck = false;
        }
    });
});