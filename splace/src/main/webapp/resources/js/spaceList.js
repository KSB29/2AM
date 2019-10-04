/**
 * 공간 리스트
 */
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