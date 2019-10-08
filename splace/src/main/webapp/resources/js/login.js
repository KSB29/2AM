

$(document).ready(function(){
	
	/*ID 기억하기 */
	var key = getCookie("saveId");
	$("#memberId").val(key);
	
	if($("#memberId").val() !=""){
		$("#saveId").attr("checked",true);
	}
	
	$("#saveId").change(function(){
		if($("saveId").is(":checked")){
			setCookie("saveId", $("#memberId").val(),7); // 7일간 쿠키 보관
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
	
	/* 쿠키 생성 및 저장 함수*/
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
	
	/*로그인 검사*/
	
	/*아이디 미입력시 경고 메세지 출력*/
	$("#login_btn").on("click",function(){
		if($("#login_btn").val().tirm() ==""){
			$("#guide").show();
			$("#guide").text("아이디를 입력해주세요! :p").css("color","rgb(204, 0, 0)");
			$("#memberId").focus(); 
			return false;
		}else if($("#memberPwd").val.trim()==""){
			$("#guide").show();
			$("#guide").text("비밀번호를 입력해주세요! :p").css("color","rgb(204, 0, 0)");
			$("#memberId").focus(); 
			return false;
		}
			
	});
	
	/* 아이디 입력시 경고 메세지 가림 */
	$("#memberId").keyup(function(){
		$("#guide").hide();
	});
	
	$("#memberPwd").keyup(function(){
		$("#guide").hide();
	});
	
	
	
	
	
	 
});