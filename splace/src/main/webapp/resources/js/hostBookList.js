/**
 * 예약 리스트
 */
function submit() {
	if (confirm("승인하시겠습니까?")) {
		var checkCnt = $("#bookArea .checkList input[type=checkbox]").not(":disabled").attr("checked");
		updateStatus();
		console.log(checkCnt);
	};
}
function reject() {
	if (confirm("반려하시겠습니까?")) {
		
	};
}

function updateStatus() {
	var list = "";
	$(".checkList:checked").each(function(index, item){
		list += $(".bookId").text() + ",";
	});
	console.log(list);
	/*if (list != "") {
		$.ajax ({
			url : "spaceApply.sp",
			data : {list:list},
			type : "post",
			success : function(result) {
						alert(result + " 건 처리되었습니다");
						location.reload();
					},
			error : function(e) {
						console.log(e);
					}
		});
	} else {
		alert("승인 처리할 예약번호를 선택하세요");
		return false;
	}*/
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