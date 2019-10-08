
$(function(){
	
	var $memberId = $("#memberId");
	var $warning = $(".warning");
	

		$memberId.on("input", function(){
	    var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	    
	    if($memberId.val().length<4){
	    	$warning.hide();
	    	return ;
	    }
	    
	    // 이메일 정규식 검사
	    if(regExp.test($memberId.val())){
	    	
	    	// 임시 이메일 버튼 활성화
	    	$("#sendPwd").attr("disabled",false);
			$memberId.removeClass('error');
	    	$memberId.addClass('ok');
	    	$warning.hide();
		}else{
	    	$("#sendPwd").attr("disabled",true);
			$memberId.removeClass('ok');
			$memberId.addClass('error');
			$warning.show().text("아이디 형식이 일치하지 않네요  :*(").css("color","rgb(204, 0, 0)");
		}		
		
		
	});

	$('#sendPwd').on("click",function(){
		var memberId = $memberId.val();
		
		$("#sendPwd").css("display","none");
		$("#reSendPwd").css("display","block");
		
		$.ajax({
			url:"findPwMail.sp",
			type:"POST",
			data: {to:memberId},
			success: function(result){
				if(result == 1){
					alert("임시 비밀번호가 성공적으로 발급되었습니다!");
				}else{
					alert("임시 비밀번호 발급에 실패했어요 ㅠ 다시 시도해주세요")
				}

			}
			
				
				
			
		});
		
		
		
		
	});
	
	
});
