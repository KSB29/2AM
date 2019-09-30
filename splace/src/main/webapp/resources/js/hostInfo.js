/**
 * 호스트 정보
 */
$(document).ready(function(){
	// 승인 대기일 경우 수정버튼 비활성으로 설정
	if ($("#hostStatus").val() == 1) {
		$("#updateBtn").prop("disabled", true);
	}
	// 승인 상태일 경우 대표자명, 상호명, 사업자등록번호 비활성으로 설정
	if ($("#hostStatus").val() == 2) {
		$("#hostName").prop("disabled", true);
		$("#storeName").prop("disabled", true);
		$("#hostNo").prop("disabled", true);
	}
});