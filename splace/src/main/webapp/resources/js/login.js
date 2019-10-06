

$(document).ready(function(){
	
	
	var key = getCookie("saveId");
	$("#memberId").val(key);
	
	if($("#memberId").val() !=""){
		$("#saveId").attr("checked",true);
	}
	
	$("#saveId").change(function(){
		if($("saveId").is(":checked")){
			setCookie("saveId", $("memberId").val(),7); // 7일간 쿠키 보관
		}else{
			deleteCookie("saveId");
		}
	});
	
	// ID저장하기를 체크한 상태로 ID 입력 시 쿠기 저장
	$("#memberId").keyup(function(){
		if($("#saveId").is(":checked")){
			setCookie("saveId",$("#memberId").val(),7);
		}
	});
	
	
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	 
});