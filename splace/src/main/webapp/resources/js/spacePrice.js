/**
 * 공간 가격
 */
$(document).ready(function(){
									
	dayChange($("#dayArea input:checked").attr("id"));
	
	$("#dayArea input[type=radio]").change(function(){
		dayChange($(this).attr("id"));
	});
	
	function dayChange(day) {
		var num = day.replace("day","");
		$("#inputPrice").val(1000*num);
		priceInput();
	}
	
	// 공간 이용시간에 해당하는 시간대에만 금액 입력 가능
	$("#priceArea input[type=number]").not(".price").css("border-bottom", "none").prop("disabled", true);
	
	// 금액 일괄 입력
	$(document).on("click", "#insertBtn", function(){
		priceInput();
	});
	
	function priceInput() {
		var price = $("#inputPrice").val();
		$(".price").val(price);
		//$("#inputPrice").val("");
	}
	
	// 입력된 금액 정보 삭제
	$(document).on("click", "#clearBtn", function(){
		$(".price").val("");
	});
});