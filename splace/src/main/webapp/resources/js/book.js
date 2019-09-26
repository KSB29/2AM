// 예약자정보 정규식 체크
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

    // 창크기 변화 감지
    if($(window).width() <= 980){
        $("#rightColFloat").removeClass("rightColFloat");
        $("#leftCol").removeClass("col-8");
        $("#rightCol").removeClass("col-4");
        $("#leftCol").addClass("col-12");
        $("#rightCol").addClass("col-12");
        $("#rightCol").css("col-12");
    } else{
        $("#leftCol").removeClass("col-12");
        $("#rightCol").removeClass("col-12");
        $("#rightColFloat").addClass("rightColFloat");
        $("#leftCol").addClass("col-8");
        $("#rightCol").addClass("col-4");
        $("#rightCol").css("col-12");
    }

    // 스크롤하면 따라오는 flaotingMenu
    $(window).scroll(function() {
        // 현재 스크롤 위치를 가져온다.
        var scrollTop = $(window).scrollTop();
        var newPosition = scrollTop +  "px";
        var mainHeight = parseInt($("#main").css('height')) / 1.25;

        if(scrollTop < mainHeight){
            $(".rightColFloat").stop().animate({
               "top" : newPosition
            }, 500);
        }
    }).scroll();

    // 예약자 정보 정규식
    $("#bookerI").on("input", function(){
        var input = $("#bookerI").val();
        var regExp = /^[가-힣]{2,5}$/;
        if(regExp.test(input)){
            $("#bookerI").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan").text("");
            regExpCheck=true;
        }else{
            $("#bookerI").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan").text("2글자이상 5글자 이내 한글로 작성해주세요!").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    $("#bookerPhone2, #bookerPhone3").on("input", function(){
        var input1 = $("#bookerPhone2").val();
        var input2 = $("#bookerPhone3").val();
        var regExp = /^[0-9]+$/;
        if(regExp.test(input1) && regExp.test(input2)){
            $("#bookerPhone2, #bookerPhone3").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan2").text("");
            regExpCheck=true;
        }else{
            $("#bookerPhone2, #bookerPhone3").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan2").text("숫자만 가능합니다.").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
    $("#bookerEmailI").on("input", function(){
        var input = $("#bookerEmailI").val();
        var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        if(regExp.test(input)){
            $("#bookerEmailI").css({
               "box-shadow":"inset 0 -1px 0 0 #1b6b2e", 
               "border-color":"#1b6b2e"}
            );
            $(".noticeSpan3").text("");
            regExpCheck=true;
        }else{
            $("#bookerEmailI").css({
               "box-shadow":"inset 0 -1px 0 0 rgb(204, 0, 0)", 
               "border-color":"rgb(204, 0, 0)"}
            );
            $(".noticeSpan3").text("이메일 형식으로 작성해주세요!").css("color","rgb(204, 0, 0)");
            regExpCheck=false;
        }
    });
});

//창크기 변화 감지
$( window ).resize(function() {
    if($(window).width() <= 980){
        $("#rightColFloat").removeClass("rightColFloat");
        $("#leftCol").removeClass("col-8");
        $("#rightCol").removeClass("col-4");
        $("#leftCol").addClass("col-12");
        $("#rightCol").addClass("col-12");
        $("#rightCol").css("col-12");
    } else{
        $("#leftCol").removeClass("col-12");
        $("#rightCol").removeClass("col-12");
        $("#rightColFloat").addClass("rightColFloat");
        $("#leftCol").addClass("col-8");
        $("#rightCol").addClass("col-4");
        $("#rightCol").css("col-12");
    }
});

// 예약자 정보 체크 && 약관동의 체크
function bookerCheck(){
    var check1 = $("#check1").prop("checked");
    var check2 = $("#check2").prop("checked");
    var check3 = $("#check3").prop("checked");
    if(regExpCheck && $("#bookerI").val() != "" && $("#bookerPhone2,#bookerPhone3").val() != "" && $("#bookerEmailI").val() != ""){
        if(!(check1 && check2 && check3)){
            alert("약관에 동의 해주세요!");
            $("#regExpCheck").removeAttr("data-toggle");
        }else{
            $("#regExpCheck").attr("data-toggle","modal");
            $("#booker").val($("#bookerI").val());
            $("#bookerPhone").val($("#bookerPhone1").val()+$("#bookerPhone2").val()+$("#bookerPhone3").val());
            $("#bookerEmail").val($("#bookerEmailI").val());
            $("#bookRequest").val($("#bookRequestI").val());
        }
    } else{
        alert("예약자 정보를 확인해주세요!");
        $("#regExpCheck").removeAttr("data-toggle");
        $("#bookerI").focus();
    }
}