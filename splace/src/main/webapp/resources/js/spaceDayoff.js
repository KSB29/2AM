/**
 * 휴일 리스트
 */
$(document).ready(function(){
	
	$("#bookCheck").css("display", "none");
	
	$("#spaceId").change(function(){
		$("#dayoffSearchForm").submit();
	});
	
	function checkOffday() {
		
		var spaceId = $("#spaceId").val();
		
		if (spaceId == "") {
			alert("공간을 먼저 선택해주세요.");
			$("#spaceId").focus();
			return false;
		}
		
		var dayOffStart = $("#offStart").val();
		var dayOffEnd = $("#offEnd").val();
		
		if (dayOffStart == "") {
			alert("휴일 시작일을 입력하세요.");
			$("#offStart").focus();
			return false;
		}
	
		if (dayOffEnd == "") {
			alert("휴일 종료일을 입력하세요.");
			$("#offEnd").focus();
			return false;
		}
		
		if (dayOffStart > dayOffEnd) {
			alert("휴일 시작일과 종료일을 다시 입력하세요.");
			return false;
		}
	}
	
	$("#checkBtn").click(function(){
		
		checkOffday();
		
		var spaceId = $("#spaceId").val();
		var dayOffStart = $("#offStart").val();
		var dayOffEnd = $("#offEnd").val();
		
		$.ajax ({
			url : "spaceCheckDayoff.sp",
			data : {dayOffStart:dayOffStart, dayOffEnd:dayOffEnd, spaceId:spaceId},
			type : "post",
			success : function(result) {
						if (result == "Y") {
							$("#bookCheck").css("display", "block");
							$("#bookCheck span").text("해당 기간 내에 이용 예정인 예약 내역이 있습니다.").css("color","#cc0000");
						} else {
							$("#bookCheck").css("display", "block");
							$("#bookCheck span").text("해당 기간 내에 이용 예정인 예약 내역이 없습니다.");
						}
					},
			error : function(e) {
						console.log(e);
					}
		});
	});
	
	$("#insertBtn").click(function(){

		checkOffday();
		
		var spaceId = $("#spaceId").val();
		var dayOffStart = $("#offStart").val();
		var dayOffEnd = $("#offEnd").val();
		
		$.ajax ({
			url : "spaceInsertDayoff.sp",
			data : {dayOffStart:dayOffStart, dayOffEnd:dayOffEnd, spaceId:spaceId},
			type : "post",
			success : function(result) {
						alert(result + "건 처리되었습니다.");
						location.reload();
					},
			error : function(e) {
						console.log(e);
					}
		});
		
	});
	
	$("#checkAll").click(function(){
		$("#offArea .checkList input[type=checkbox]").prop("checked", $(this).prop("checked"));
	});
	
	$("#deleteBtn").click(function(){
		
		if (!confirm("삭제하시겠습니까?")) return false;
		
		if ($("#spaceId").val() == "") {
			alert("공간을 먼저 선택해주세요.");
			$("#spaceId").focus();
			return false;
		}
		
		var dayoffList = "";
		
		$("#offArea .checkList input:checked").each(function(index, item){
			var dayoffId = $(this).parent().parent().children().eq(0).attr("value");
			dayoffList += "," + dayoffId;
		});
		
		if (dayoffList.length > 0) {
			$.ajax ({
				url : "spaceDeleteDayoff.sp",
				data : {list:dayoffList},
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
			alert("삭제 처리할 휴일을 선택하세요");
			return false;
		}
	});
	
});