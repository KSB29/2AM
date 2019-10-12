


/*회원 가입 js*/

$(function(){
	
	/* 체크박스 전체 선택 */
	$("#policy1").click(function(){
		var ck = $(this).is(":checked");
		if(ck){
			$(".policy_ck").prop('checked', true);
		}else{ 
			$(".policy_ck").prop('checked', false);
		}						
	});
	
	/* 체크박스 선택 */
    $("#policy2").on("change", function(){
    	
        var pol2 = $("#policy2").prop("checked");
        var pol3 = $("#policy3").prop("checked");
           
        if(pol2==true && pol3==true){
            $("#policy1").prop("checked",true);
        }else{
            $("#policy1").prop("checked",false);
        }
        
    });
	
    $("#policy3").on("change", function(){
    	
        var pol2 = $("#policy2").prop("checked");
        var pol3 = $("#policy3").prop("checked");

        if(pol2==true && pol3==true ){
            $("#policy1").prop("checked",true);
        }else{
            $("#policy1").prop("checked",false);
        }
        
    });
	
    $("#policy4").on("change", function(){
    	
        var pol2 = $("#policy2").prop("checked");
        var pol3 = $("#policy3").prop("checked");
        var pol4 = $("#policy4").prop("checked");

        if(pol2==true && pol3==true && pol4==true){
            $("#policy1").prop("checked",true);
        }else{
            $("#policy1").prop("checked",false);
        }
        
    });
	
	/* 필수 항목 check & 유효성 검사 */
	$("#join_btn").on('click', function(){
		
		var ck = $("#policy2").is(":checked");
		var ck2 = $("#policy3").is(":checked");
		
		var validate = $("#dupCheck").val();

		if(!ck){

			alert('필수 항목을 체크해주세요!');
			$('#policy_modal').focus();
			return false ;	
			
		}
		
		// 유효성 검사
		if(validate==0){
			alert("중복확인을 깜박 하셨네요 :p!");
			$("#checkId").focus();			
			return false;		
		}
		
		alert("환영합니다! 회원가입이 완료되었습니다 :) ");
		
		
	});

	/*회원 ID 관련*/

	// 아이디 중복검사 	
	$("#checkId").on("click", function(){
		
		
	
		var userId = $("#memberId").val();
		if(userId.length < 4){
			
			$(".guide").hide();
			$("#dupCheck").val(0);
			
			return;
		}
		
		
		$.ajax({
		    type : 'POST',
			url: 'checkId.sp',
			data:  {memberId:userId},
			success:function(result){
				console.log(result);
			
		        var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
				if(result){	
					$("#memberId").removeClass('error');
					$("#memberId").addClass('ok');
					$(".guide").show().text("사용 가능한 아이디입니다. :p").css("color","#1b6b2e");
					$("#dupCheck").val(1);	
					
					if(!regExp.test(userId)){
						$("#memberId").removeClass('ok');
						$("#memberId").addClass('error');	
						$(".guide").text("아이디 형식을 확인하세요!").css("color","rgb(204, 0, 0)");
					}					
				}else{
					$("#memberId").removeClass('ok');
					$("#memberId").addClass('error');
					$(".guide").show().text("중복되는 아이디가 있네요 :*(").css("color","rgb(204, 0, 0)");
					$("#dupCheck").val(0);	
				
				}			
			}

		});
	});
	
	$("#checkId").blur(function(){
		$("#memberId").removeClass('error');
	});
	
});


$(function(){
	    // 체크박스
	
	    $("#all").on("change", function(){
	        if($("#all").prop("checked") == true){
	            $("[id^='check']").prop("checked", true);
	        } else{
	            $("[id^='check']").prop("checked", false);
	        }
	    });
	    $("[id^='check']").on("change", function(){
	        var check1 = $("[id='check1']").prop("checked");
	        var check2 = $("[id='check2']").prop("checked");
	        var check3 = $("[id='check3']").prop("checked");
	
	        if(check1 == true && check2 == true && check3 == true){
	            $("#all").prop("checked", true);
	        } else{
	            $("#all").prop("checked", false);
	        }
	    });
	    

	    

    
    // 회원 이름 정규식
    $("#memberName").on("input", function(){
    	
        var input = $("#memberName").val();
        if(input.length<2){
            $(".noticeSpan").hide();
            return;
        } 
        
        var regExp = /^[가-힣]{2,5}$/;

        console.log(regExp.test(input))
        if(regExp.test(input)){
        	
            $("#memberName").removeClass("error");
            $("#memberName").addClass("ok");
            $(".noticeSpan").hide();
            regExpCheck=true;
            
        }else{

            $("#memberName").removeClass("ok");
            $("#memberName").addClass("error");
            $(".noticeSpan").show().text("2글자이상 5글자 이내 한글로 작성해주세요!").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
            
        }
    });
    
    // 전화번호 정규식
    $("#memberPhone").on("input", function(){
        var input = $("#memberPhone").val();
        var regExp = /^\d{3}\d{3,4}\d{4}$/;
        
        if(regExp.test(input)){
            $("#memberPhone").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan2").text("");
            regExpCheck=true;
            
        }else{
            $("#memberPhone").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan2").text("숫자만 가능합니다.").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    
    
    // 회원 비밀번호 정규식 - 숫자와 문자 포함 8자 이상
    $("#memberPwd").on("input", function(){
    	
        var input = $("#memberPwd").val();
        if(input.length<4){
        	$(".noticeSpan4").hide();
    		$("#memberId").removeClass('ok');
    		$("#memberId").removeClass('error');

        	return;
        }
      
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

        if(regExp.test(input)){
        	$("#memberPwd").removeClass('error');
            $("#memberPwd").addClass('ok');    
            $(".noticeSpan4").hide();
            regExpCheck=true;  
            
        }else{
        	$("#memberPwd").removeClass('ok');
            $("#memberPwd").addClass('error');
            $(".noticeSpan4").show().text("숫자와 문자를 포함하여 8자 이상 작성해주세요 :p").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
          
        }
    });
    
    
    // 비밀번호 확인 
    $("#memberPwd2").on("input", function (){
    	var pwd = $("#memberPwd").val();
    	var pwd2 = $("#memberPwd2").val();
    	if(pwd == pwd2){
        	$("#memberPwd2").removeClass('error');
            $("#memberPwd2").addClass('ok');
            $(".noticeSpan5").text("");
    	}else{
        	$("#memberPwd2").removeClass('ok');
    	    $("#memberPwd2").addClass('error');
            $(".noticeSpan5").text("비밀번호를 확인해주세요!").css("color","rgb(204, 0, 0)");
    	}
    	
    	
    });
    
    // Modal 약관 동의 
    $("#agree").on("click", function(){
        var check1 = $("#check1").is(":checked");
        var check2 = $("#check2").is(":checked");
        var check3 = $("#check3").is(":checked");

        
        if(!check1){
          	$("#warning").text("서비스 이용약관 동의는 필수입니다.");
        	$("#check1").focus();
        	return false;   	
        }else if(!check2){
           	$("#warning").text("서비스 이용약관 동의는 필수입니다.");
        	$("#check2").focus();
        	return false;       	
        }else if(!check3) {
        	$("#warning").text("서비스 이용약관 동의는 필수입니다.");
        	$("#check3").focus();
        	return false;
        }
        
        $("#policy2").prop("checked",true);
        
        
    });
    
    
    
    // 인증 번호 발송
    var code;
    var emailC=false;
    var pwdC = false;
    var nickC= false;
    var min = 2;
    var sec =59;
    var timer;
    var checkOk;
    
    
    // 타이머 리셋 메소드
	function resetTimer(){
		clearInterval(timer);
		min=2;
		sec=59;
		//$("#timer").css("display","none"); 
		$("#min").text("3");
		$("#sec").text("00");
		
	}

    $("#sendNo").click(function(){
    	
		var validate = $("#dupCheck").val();


    	if($("#memberId").val().trim()==""){
    		alert('아이디를 먼저 입력해 주세요!');
    		return false;
    		
    	}else if(validate==0){

    		alert('사용가능한 아이디인지 확인해 주세요!');
    		$("#checkId").focus();
    		return false;
    		
    	}else if(validate==1){
    		
	    	alert('인증번호가 발송되었습니다.');
	        $("#sendNo").css("display","none");
	        $("#sendOk").css("display","block");
	    	$("#timer").css("display","block");  
	        
	        timer = window.setInterval(function(){
	        	$("#min").text("0"+min);
	        	if(sec < 0){
	        		sec =59;
	        	}
	        	if(sec == 0){
	        		"0"+min--;
	        	}
	        	if(sec >= 10){
	        		$("#sec").text(sec);
	        	}else{
	        		$("#sec").text("0"+sec);
	        	}
	        	sec--;
	        }, 1000);
	 
	    	
	        // 인증시간 초과시 
	      checkOk = window.setTimeout(function(){
	    
	        	clearInterval(timer);
	        	$("#timer").text("");
	        	$("#timer").text("인증 시간이 초과되었습니다.").css("color","rgb(204, 0, 0)");
	        	$("#sendOk").css("display","none");
	        	$("#sendNo").css("display","block");
	        	resetTimer();	
	        	
	        	alert('인증시간이 초과되었습니다. 회원가입을 다시 진행해 주세요!');
	        	location.reload();    
	        	
	        },180000);
	        
	        var email=$("#memberId").val();
	        $.ajax({
	        	url:"sendCertiNo.sp",
	        	data:{email:email},
	        	type:"post",
	        	success:function(num){       	 
	        		console.log("ajax통신 성공");
	        		code=num;
	        	}
	        });
    	}
    }); 
    
    
	/*인증버튼 클릭  */
	$("#sendOk").click(function(){
		console.log("인증버튼 클릭");
		if($("#certiNo").val()==""){
			
			console.log("인증번호 미입력");
			
			$("#timer").text("인증번호를 입력해주세요!").css("color","rgb(204, 0, 0)");						
			setTimeout(function(){
				$("#timer").text("");
			},2000);
		}else{
			
			if(code!=null){
				console.log("인증번호 입력 확인");

				if($("#certiNo").val()==code){	
					console.log("인증번호 입력 인증완료");
					$("#timer").text("인증이 완료되었습니다 :)").css("color","#1b6b2e");
					clearInterval(checkOk);
					emailC=true;
				}else{
					console.log("인증번호 틀림1");
					$("#timer").css("display","none");
					$(".noticeSpan1").css({"color":"rgb(204, 0, 0)","display":"block"});
					setTimeout(function(){
						$(".noticeSpan1").css("display","none");
						$("#timer").css("display","block");		
					},2000);
				}
			}else{
				// code가 null일 때
				console.log("code : "+code);
				$("#timer").css("display","none");
				$(".noticeSpan1").text("인증번호가 틀렸습니다").css({"color":"rgb(204, 0, 0)","display":"block"});
				setTimeout(function(){
					$(".noticeSpan1").css("display","none");
					$("#timer").css("display","block");	
				},2000);
			}
		}
		
	});
	
	/*메일 수신동의 확인*/
	$("#memberAgree").on("change", function(){
		var $check = $("#memberAgree");
		console.log($check.val());

		if($check.is(":checked")){
			$check.val("Y");
			console.log($check.val());
		}else{
			$check.val("N");
			console.log($check.val());
		}
		
		
	});
	
	$("#join_btn").on("click",function(){
		

		
	});

	
	
});




