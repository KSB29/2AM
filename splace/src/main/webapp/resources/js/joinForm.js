


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
        
        

        if(pol2==true && pol3==true && pol4==true){
            $("#policy1").prop("checked",true);
        }else{
            $("#policy1").prop("checked",false);
        }
        
    });
	
    $("#policy3").on("change", function(){
    	
        var pol2 = $("#policy2").prop("checked");
        var pol3 = $("#policy3").prop("checked");
        var pol4 = $("#policy4").prop("checked");

        if(pol2==true && pol3==true && pol4==true){
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
	

	/* 필수 항목 check */
	$("#join_btn").on('click', function(){
		var ck = $("#policy2").is(":checked");
		var ck2 = $("#policy3").is(":checked");
		
		if(!ck){
			alert('필수 항목을 체크해주세요!');
			$('#policy2').focus();
			return false ;						
		}else if(!ck2){
			alert('필수 항목을 체크해주세요!');
			$('#policy3').focus();
			return false ;	
		}
		
		if(checkNo>0){
			location.href=""
		}else{
			alert('아이디를 중복체크를 해주세요!');
		}

	});

	

	// 아이디 중복검사 
	var checkNo = 0;
	
	$("#checkId").on("click", function(){
	
		var userId = $("#memberId").val();
		console.log(userId);
		
		$.ajax({
		    type : 'POST',
			url: 'checkId.sp' ,
			data:  {memberId:userId},
			success:function(result){
				if(result==1){	
					  $("#memberId").css({
			               "box-shadow":"inset 0 -1px 0 0 #1b6b2e)", 
			               "border-color":"#1b6b2e"}
					  );
			            $(".noticeSpan3").text("사용중인 아이디입니다 :p").css("color","#1b6b2e");
			            
			            checkNo =1; 

				}else{
		            $("#memberId").css({
		                "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
		                "border-color":"rgb(204, 0, 0)"}
		             );
		            $(".noticeSpan3").text("중복되는 아이디가 있습니다.").css("color","rgb(204, 0, 0)");
		            		
		            	checkNo= 0 ;

				}
				

			}

		});
	
		
		
	});
		
	
	
});






/*이용 약관*/
function setParent(){
	opener.document.getElementById("policy2").attr("checked",true);
	/**//////////**************
	



}


// 
var regExpCheck = false;
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
        var regExp = /^[가-힣]{2,5}$/;
        if(regExp.test(input)){
            $("#memberName").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan").text("");
            regExpCheck=true;
        }else{
            $("#memberName").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan").text("2글자이상 5글자 이내 한글로 작성해주세요!").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    
    
//    전화번호 정규식
    $("#memberPhone").on("input", function(){
        var input = $("#memberPhone").val();
        var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
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
    
    
    // 회원 이메일 정규식
    $("#memberId").on("input", function(){
        var input = $("#memberId").val();
        var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
       
        if(regExp.test(input)){
            $("#memberId").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan3").text("");
            regExpCheck=true;
        }else{
            $("#memberId").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan3").text("이메일 형식으로 작성해주세요!").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    
    
    // 회원 비밀번호 정규식 - 숫자와 문자 포함 8자 이상
    $("#memberPwd").on("input", function(){
        var input = $("#memberPwd").val();
        var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/


        if(regExp.test(input)){
            $("#memberPwd").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan4").text("");
            regExpCheck=true;
        }else{
            $("#memberPwd").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan4").text("숫자와 문자를 포함하여 8자 이상 작성해주세요!").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    
    
    // 비밀번호 확인 
    $("#memberPwd2").on("input", function (){
    	var pwd = $("#memberPwd").val();
    	var pwd2 = $("#memberPwd2").val();
    	if(pwd == pwd2){

            $("#memberPwd2").css({
                "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
                "border-color":"#1b6b2e"}
             );
             $(".noticeSpan5").text("");
    	}else{
    	       $("#memberPwd2").css({
                   "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
                   "border-color":"rgb(204, 0, 0)"}
                );
                $(".noticeSpan5").text("비밀번호를 확인해주세요!").css("color","rgb(204, 0, 0)");
    	}
    	
    	
    })
});




