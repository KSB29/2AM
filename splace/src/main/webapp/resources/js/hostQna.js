/**
 * QnA
 */

function answer() {
	
	var aContent = $("#aContent").val();
	var qnaId = $("#qnaId").val();
	
	$.ajax ({
		url : "hostAnswer.sp",
		data : {aContent:aContent, qnaId:qnaId},
		type : "post",
		success : function(result) {
					alert("답변이 등록되었습니다");
					location.reload();
				},
		error : function(e) {
					console.log(e);
				}
	});
	
}

$(document).ready(function(){
	
	$("#spaceId, #statusId").change(function(){
		$("form").submit();
	});
	
	$("#qArea td").click(function(){
		$("#qContent").text($(this).parent().children().eq(4).val());
		$("#aContent").text($(this).parent().children().eq(5).val());
		$("#qnaId").val($(this).parent().children().eq(6).val());
	}).mouseenter(function(){
		$(this).parent().css("cursor", "pointer");
	});
});