/*비밀번호 변경 폼*/


$(function(){
	var regExpCheck;
	
	// 현재 비밀번호 검사
	$("#currentPwd").blur(function(){
		var currentPwd = $("#currentPwd").val();
		var memberId = $("#memberId").val();
		
		
		// 현재비밀번호가 암호화된 비밀번호가 일치하는지 확인
		$.ajax({ 
			url: "checkPwForm.sp",
			type: "POST",
			data: {memberPwd:currentPwd, memberId:memberId},
			success:function(result){				
				console.log('ajax성공')
				if(!result){	
		        	$("#currentPwd").removeClass('ok');
		            $("#currentPwd").addClass('error');
		            $(".warning3").show().text("비밀번호를 확인해 주세요! :p").css("color","rgb(204, 0, 0)");
				}else{
		            $(".warning3").hide();
		        	$("#currentPwd").removeClass('error');	
		            $("#currentPwd").addClass('ok');  
		            regExpCheck=true;  
				}
			}
		}); 
	});
	
	// 유효성 검사
	$("#change_btn").on("click",function(){
		var currentPwd = $("#currentPwd").val();
		var newPwd = $("#newPwd").val();
			
		if(!regExpCheck){

			alert("현재 비밀번호를 확인해주세요!");
			$("#currentPwd").focus();
			return false;
		}
		alert("비밀번호가 성공적으로 변경되었습니다 :)");

	});
	
    // 새비밀번호  정규식 - 숫자와 문자 포함 8자 이상
    $("#newPwd").on("input", function(){
    	
        var input = $("#newPwd").val();
        if(input.length<4){
        	$(".warning").hide();
    		$("#newPwd").removeClass('ok');
    		$("#newPwd").removeClass('error');

        	return;
        }
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        if(regExp.test(input)){
        	$("#newPwd").removeClass('error');
            $("#newPwd").addClass('ok');    
            $(".warning").hide(); 
        }else{
        	$("#newPwd").removeClass('ok');
            $("#newPwd").addClass('error');
            $(".warning").show().text("숫자와 문자를 포함하여 8자 이상 작성해주세요 :p").css("color","rgb(204, 0, 0)");
            regExpChec=false;
        }
        
    	// 중복검사  - 현재 비밀번호와 같을 시 
        if(input==$("#currentPwd").val()){
        	$("#newPwd").removeClass('ok');
            $("#newPwd").addClass('error');
            $(".warning").show().text("현재 비밀번호는 사용하실 수 없습니다 ").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    
    
    // 비밀번호 확인
    $("#newPwd2").on("input", function (){
    	
    	var pwd = $("#newPwd").val();
    	var pwd2 = $("#newPwd2").val();
    	if(pwd == pwd2){
    		console.log("비밀번호 일치");
        	$("#newPwd2").removeClass('error');	
            $("#newPwd2").addClass('ok');  
            $(".warning2").text("비밀번호가 일치합니다").css("color","#1b6b2e");
    	}else{
            $("#newPwd2").removeClass('ok');  
    	    $("#newPwd2").addClass('error');
            $(".warning2").text("비밀번호를 확인해주세요!").css("color","rgb(204, 0, 0)");
    	}
    	
    });
	
	
});