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
    	if ($(this).prop("checked") == true) {
        	$(this).attr("checked", true);
        	$(this).parent().next().html("운영").addClass("noticeColor").removeClass("warningColor");
        } else {
        	$(this).attr("checked", false);
        	$(this).parent().next().html("운영중지").addClass("warningColor").removeClass("noticeColor");
        };
    });
});