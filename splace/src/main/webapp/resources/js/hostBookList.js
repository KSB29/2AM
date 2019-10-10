/**
 * 예약 리스트
 */
function submit() {
	if (confirm("승인하시겠습니까?")) {
		updateStatus("101"); // 승인
	};
}
function reject() {
	if (confirm("반려하시겠습니까?")) {
		updateStatus("102"); // 취소
	};
}

function updateStatus(statusId) {
	var list = "";
	$("#bookArea .checkList input:checked").not(":disabled").each(function(index, item){
		var idIndex = $(this).attr("id").replace("check","");
		list += "," + $("#bookId"+idIndex).text();
	});
	console.log(list);
	if (list != "") {
		$.ajax ({
			url : "hostApplyBook.sp",
			data : {statusId:statusId, list:list},
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
		alert("승인/취소 처리할 예약번호를 선택하세요");
		return false;
	}
}

$(document).ready(function(){
	
	$("#spaceId, #statusId").change(function(){
		//var spaceId = $("#spaceId option:selected").val();
		//var statusId = $("#statusId option:selected").val();
		$("form").submit();
	});
	
	/*$("#bookArea .detail").css("display", "none");
	$("#bookArea .list td").not(".checkList").click(function(){
		if($(this).parent().next("tr").css("display") == "none") {
			//$(this).parent().siblings(".detail").slideUp();
			$(this).parent().next().slideDown();
		} else {
			$(this).parent().next().slideUp();
		}
	});*/
	
	$("#checkAll").click(function(){
		$("#bookArea .checkList input[type=checkbox]").not(":disabled").prop("checked", $(this).prop("checked"));
	});
	
});