/**
 * 공간 가격
 */

$(document).ready(function(){
	
	// 등록되어 있는 가격 화면에 표시
	if ($("#priceFlag").val() == 'Y') toJson();
	
	dayChange($("#dayArea input:checked").attr("id"));
	
	function toJson() {
		
		for (var i = 1; i <= 8; i++) {
			
			var str = $("#spacePrice" + i).val();
			
			if (str != "") {
				var json = JSON.parse(str);
				var hour, price, id;
				for (var j = 0; j < json.length; j++) {
					hour = json[j].hour;
					price = json[j].price;
					hour = hour.substring(0,hour.indexOf("~"));
					if (hour < 12) {
						id = "#timeTableAm" + (i) + "hour" + hour;
					} else {
						id = "#timeTablePm" + (i) + "hour" + hour;
					}
					$(id).val(price);
				}
			}
		}
	}
	
	$("#submitBtn").click(function(){
		
		for (var i = 1; i <= 8; i++ ) {
			
			var priceList = new Array();
			
			pushPrice("timeTableAm");
			pushPrice("timeTablePm");
			
			function pushPrice(timeTable) {
				$("#" + timeTable + i + " .price").each(function(j){
					var priceInfo = new Object();
					var id = $(this).attr("id");
					var val = $("#"+id).val();
					if (parseInt(val) > 0) {
						var hour = parseInt(id.replace(timeTable + i, "").replace("hour", ""));
						priceInfo.hour = hour + "~" + (hour + 1);
						priceInfo.price = val;
						priceList.push(priceInfo);
					}
				});
			};
			
			//var jsonStr = JSON.stringify(priceList);
			//console.log(jsonStr);
			//var json = JSON.parse(jsonStr);
			//console.log(json);
			
			if ($("#priceFlag").val() == 'Y') {
				var priceId = $("#spacePrice" + i).parent().attr("id");
				$("#spacePrice" + i).val(priceId + JSON.stringify(priceList));
			} else {
				$("#spacePrice" + i).val(i + JSON.stringify(priceList));
			}
		}
		
		$("form").submit();
		
	});
	
	$("#dayArea input[type=radio]").change(function(){
		dayChange($(this).attr("id"));
	});
	
	// 선택한 요일에 대한 금액테이블만 화면에 표시
	function dayChange(day) {
		var num = day.replace("day", "");
		// 선택한 요일 표시
		$("#dayText").html("* " + $("#"+day).next().html() + "1인 당 금액").css("color", "#4C74B9");
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