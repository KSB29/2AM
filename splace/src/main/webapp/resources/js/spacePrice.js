/**
 * 공간 가격
 */
$(document).ready(function(){
	
	dayChange($("#dayArea input:checked").attr("id"));
	
	$("#dayArea input[type=radio]").change(function(){
		dayChange($(this).attr("id"));
	});
	
	// 선택한 요일에 대한 금액테이블만 화면에 표시
	function dayChange(day) {
		var num = day.replace("day", "");
		$(".timeTable").css("display", "none");
		$("#timeTableAm"+num).css("display", "table-row");
		$("#timeTablePm"+num).css("display", "table-row");
	}
	
	// 공간 이용시간에 해당하는 시간대에만 금액 입력 가능
	$("#priceArea input[type=number]").not(".price").css("border-bottom", "none").prop("disabled", true);
	
	// 금액 일괄 입력
	$(document).on("click", "#insertBtn", function(){
		var num = ($("#dayArea input:checked").attr("id")).replace("day", "");
		// 시간 당 금액
		var price = $("#inputPrice").val();
		$("#timeTableAm"+num + " .price").val(price);
		$("#timeTablePm"+num + " .price").val(price);
	});
	
	// 입력된 금액 정보 삭제
	$(document).on("click", "#clearBtn", function(){
		var num = ($("#dayArea input:checked").attr("id")).replace("day", "");
		$("#timeTableAm" + num + " .price").val("");
		$("#timeTablePm" + num + " .price").val("");
	});
});