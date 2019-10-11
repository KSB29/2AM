/**
 * QnA
 */
$(document).ready(function(){
	
	$("#spaceId, #statusId").change(function(){
		$("form").submit();
	});
	
	$("#qArea td").click(function(){
		$("#qContent").text($(this).parent().children().eq(0).html()+"문의내역");
		$("#aContent").text($(this).parent().children().eq(0).html()+"답변내역");
	}).mouseenter(function(){
		$(this).parent().css("cursor", "pointer");
	});
});