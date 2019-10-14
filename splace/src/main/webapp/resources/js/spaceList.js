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
	    	if (operStatus == true) {
	        	$(this).attr("checked", true);
	        	$(this).parent().next().html("운영").addClass("noticeColor").removeClass("warningColor");
	        } else {
	        	$(this).attr("checked", false);
	        	$(this).parent().next().html("운영중지").addClass("warningColor").removeClass("noticeColor");
	        };
	        
	        if (operStatus == false) {
	        	
	        	$.ajax ({
	        		url : "spaceOperCheck.sp",
	        		data : {spaceId:spaceId},
	        		type : "post",
	        		success : function(result) {
	        					alert("상태가 변경되었습니다");
	        					location.reload();
	        				},
	        		error : function(e) {
	        					console.log(e);
	        				}
	        	});
	        	
	        }
        } else {
        	return false;
        }
    });
});