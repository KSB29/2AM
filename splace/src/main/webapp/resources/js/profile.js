
			 //전화번호 수정
			function updatePhone(){
					
					var phNo = $("#memberPhone").val();
					var memberId = $("#memberId").val();

						$.ajax({
						url: "updatePhoneNo.sp",
						data: {memberPhone:phNo, memberId:memberId},
						type: "POST",
						success:function(result){
							if(result){
								console.log("전화번호 변경성공");
								$("#phoneNo").text(phNo);
							}else{
								alert("전화번호 변경에 실패했습니다. 다시 시도해주세요 :*( ");
							}
							
						}
					});
				}
				
			 
			function pwdCheck(){
				
				var memberPwd = $("#memberPwd").val();
				var memberId = $("#memberId").val();
				console.log(memberId);
				
				$.ajax({
					url: "checkPwForm.sp",
					type: "POST",
					data: {memberPwd:memberPwd, memberId:memberId},
					success:function(result){				
						console.log('ajax성공')
						if(!result){							
							$(".warning").text('비밀번호를 잘못 입력하셨습니다').css('color','rgb(204, 0, 0)');
							setTimeout(function(){
								$(".warning").text("");
							},2000);
						}else{
							console.log('비밀번호 변경 폼으로 이동')
							location.href="deleteForm.sp"
						}
					}
				}); 
			}
			


// 전화번호 정규식
$("#memberPhone").on("input", function(){
    var input = $("#memberPhone").val();
    var regExp = /^\d{3}\d{3,4}\d{4}$/;
    
    if(regExp.test(input)){
        $("#memberPhone").removeClass("error");
        $("#memberPhone").addClass("ok");
        $(".warning2").text("");
        $("#changeNo_btn").attr("disabled",false);
        
    }else{
        $("#memberPhone").removeClass("ok");
        $("#memberPhone").addClass("error");
        $(".warning2").text("올바르지 않은 형식입니다.").css("color","rgb(204, 0, 0)");
        $("#changeNo_btn").attr("disabled",true);
        setTimeout(function(){
			$(".warning2").text("");
		},2000);
    }
});


$(document).ready(function(){
	$(".socialStatus").on("click",function(){
		alert("SNS 연동 상태는 변동이 불가능합니다.");
		return false;
		
	});
	
});


//광고수신 동의 변경
$(document).ready(function(){
    $("#smsAgree").click(function(){
		var memberId = $("#memberId").val();
		var memberAgree = $("#memberSocial").val();
		
    	if($("#smsAgree").prop("checked")){
    		$(this).attr("checked", false)
    		memberAgree = 'Y';
    	}else{
    		$(this).attr("checked", true)	
    		memberAgree = 'N';
    	}
    	console.log($("#smsAgree").prop("checked"));
		console.log(memberAgree);
		
		$.ajax({			
			url: "memberAgree.sp",
			type:"GET",
			data:{memberId:memberId, memberAgree:memberAgree},    			
			success:function(result){
				if(result){
					alert("광고 수신 동의 상태가 변경되었습니다.");
				}else{
					alert("광고 수신 동의 변경에 실패했습니다. 다시 시도해주세요 :*(");
				}
			}
		});

    	
    });
});



