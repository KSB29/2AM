/**
 * 공간 리스트
 */
function spaceApply(id) {
	if (confirm("승인 요청하시겠습니까?")){
		$(location).attr("href", "spaceApply.sp?spaceId=" + id);
	}
}

function spaceDelete(id) {
	if (confirm("공간을 삭제하시겠습니까? 삭제 시 복구가 불가능합니다.")){
		$(location).attr("href", "spaceDelete.sp?spaceId=" + id);
	}
}

$(document).ready(function(){
    $("input[type='checkbox']").click(function(){
    	
    	if (confirm("운영 상태를 변경하시겠습니까?")) {
    		
	    	var operStatus = $(this).prop("checked");
	    	var spaceId = $(this).attr("id").replace("space", "");
	    	var bookFlag = $(this).parent().prev().val();
	    	
	    	if (bookFlag == "Y") {
	    		alert("이용 예정인 예약이 있어 상태 변경이 불가합니다");
	    		return false;
	    	}
	        
	    	var id = $(this).attr("id").replace("space", "");
	    	var status = $("#status"+id).val();
	    	var $divImg = $("#status"+id).next();
	    	var $span = "<span class='bgBlur'><em>비공개 중입니다.</em></span>";

	    	if (operStatus == true) {
	    		$(this).attr("checked", true);
        		$(this).parent().next().html("운영").addClass("noticeColor").removeClass("warningColor");
        		if (status == 2) {
        			$divImg.children().remove();
        		}
        	} else {
        		$(this).attr("checked", false);
        		$(this).parent().next().html("운영중지").addClass("warningColor").removeClass("noticeColor");
        		if (status == 2) {
        			$divImg.append($span);
        		}
        	};
        	
	        var statusId = operStatus == true? "Y" : "N";
	        
        	$.ajax ({
        		url : "spaceUpdateStatus.sp",
        		data : {spaceId:spaceId, statusId:statusId},
        		type : "post",
        		success : function(result) {
        					if (result == "Success") {
        						alert("변경되었습니다");
        					} else {
        						alert("변경 중 오류가 발생했습니다");
        					}
        				},
        		error : function(e) {
        					console.log(e);
        				}
        	});
	        	
        } else {
        	return false;
        }
    });
});