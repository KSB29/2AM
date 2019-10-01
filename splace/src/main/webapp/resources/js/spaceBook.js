/**
 * 예약 리스트
 */
function submit() {
	if (confirm("승인하시겠습니까?")) {
		var checkCnt = $("#bookArea .checkList input[type=checkbox]").not(":disabled").attr("checked");
		console.log(checkCnt);
	};
}
function reject() {
	if (confirm("반려하시겠습니까?")) {
		
	};
}
$(document).ready(function(){
	
	//$("#bookArea .detail").css("display", "none");
	$("#bookArea .list td").not(".checkList").click(function(){
		if($(this).parent().next("tr").css("display") == "none") {
			//$(this).parent().siblings(".detail").slideUp();
			$(this).parent().next().slideDown();
		} else {
			$(this).parent().next().slideUp();
		}
	});
	
	$("#checkAll").click(function(){
		$("#bookArea .checkList input[type=checkbox]").not(":disabled").prop("checked", $(this).prop("checked"));
	});
	
});