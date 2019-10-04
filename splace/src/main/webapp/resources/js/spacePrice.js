/**
 * 공간 가격
 */
var priceArr = new Array();

$(document).ready(function(){
	
	dayChange($("#dayArea input:checked").attr("id"));
	
	var priceMap;
	
	$("#submitBtn").click(function(){
		var day = $("#"+day).next().html();
		
		for (var i = 1; i <= 8; i++ ) {
			
			priceMap = "{" + i + "}";
			
			$("#timeTableAm" + i + " .price").each(function(){
				var id = $(this).attr("id");
				var val = $("#"+id).val();
				if (parseInt(val) > 0) {
					var hour = parseInt(id.replace("timeTableAm" + i, "").replace("hour", ""));
					var key = "'" + hour + "~" + (hour + 1) + "'";
					var value = "'" + val + "'";
					priceMap += ",{" + key + ":" + value + "}";
				}
			});
			
			$("#timeTablePm" + i + " .price").each(function(){
				var id = $(this).attr("id");
				var val = $("#"+id).val();
				if (parseInt(val) > 0) {
					var hour = parseInt(id.replace("timeTablePm" + i, "").replace("hour", ""));
					var key = "'" + hour + "~" + (hour + 1) + "'";
					var value = "'" + val + "'";
					priceMap += ",{" + key + ":" + value + "}";
				}
			});
			
			$("#spacePrice" + i).val(priceMap);
		}
		
//		console.log(priceArr[0]);
//		console.log(priceArr[1]);
//		console.log(priceArr[2]);
		
		$("form").submit();
		
	});
	
	function pushPrice(timeTable) {
		
		$("#" + timeTable +" .price").each(function(){
			var id = $(this).attr("id");
			var val = $("#"+id).val();
			console.log(id + " : " + val);
			if (parseInt(val) > 0) {
				var hour = parseInt(id.replace(timeTable, "").replace("hour", ""));
				var key = "'" + hour + "~" + (hour + 1) + "'";
				var value = "'" + val + "'";
				priceMap += "{" + key + ":" + value + "},";
			}
		});
		//console.log(timeTable.replace("timeTableAm", "").replace("timeTablePm", ""));
		$("#spacePrice" + timeTable.replace("timeTableAm", "").replace("timeTablePm", "")).val(priceMap);
		
	}
	
	$("#dayArea input[type=radio]").change(function(){
		dayChange($(this).attr("id"));
	});
	
	// 선택한 요일에 대한 금액테이블만 화면에 표시
	function dayChange(day) {
		var num = day.replace("day", "");
		// 선택한 요일 표시
		$("#dayText").html("* " + $("#"+day).next().html() + "시간 당 금액").css("color", "#4C74B9");
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