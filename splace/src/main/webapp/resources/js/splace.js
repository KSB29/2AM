//scroll to top
$(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
        $('.scrollup').fadeIn();
        } else {
        $('.scrollup').fadeOut();
    }
});
$('.scrollup').click(function(){
    $("html, body").animate({ scrollTop: 0 }, 1000);
        return false;
});

/* 알림창 오픈클로즈 */
function myFunction() {
    var x = document.getElementById("bellList");
    if (x.style.display === "none") {
        x.style.display = "block";
    } else {
        x.style.display = "none";
    }
}

$(function(){
    /* select box */
    if(document.getElementById('default-select')) {
        $('select').niceSelect();
        $('.selectsff').niceSelect();
    }

    // buttonToggle
     $(".buttonToggle").click(function(){
        //  console.log($("this").hasClass("primary"));
         $(this).toggleClass("buttonToggleOpen");
         if($(this).hasClass("buttonToggleOpen") == true){
            $(this).parent().css("padding-bottom", "0.75em");
         } else{
            $(this).parent().css("padding-bottom", "0");
         }
        //  if($(this).hasClass("primary") == true){
        //     $(this).toggleClass("buttonToggle1");
        // } else{
        //     $(this).toggleClass("buttonToggle2");
        // }
     });

    // book.jsp----------------------------------

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
        $("#leftCol").removeClass("col-8");
        $("#rightCol").removeClass("col-4");
        $("#leftCol").addClass("col-12");
        $("#rightCol").addClass("col-12");
        $("#rightCol").css("col-12");
    } else{
        $("#leftCol").removeClass("col-12");
        $("#rightCol").removeClass("col-12");
        $("#leftCol").addClass("col-8");
        $("#rightCol").addClass("col-4");
        $("#rightCol").css("col-12");
    }
});

//창크기 변화 감지
$( window ).resize(function() {
    if($(window).width() <= 980){
        $("#leftCol").removeClass("col-8");
        $("#rightCol").removeClass("col-4");
        $("#leftCol").addClass("col-12");
        $("#rightCol").addClass("col-12");
        $("#rightCol").css("col-12");
    } else{
        $("#leftCol").removeClass("col-12");
        $("#rightCol").removeClass("col-12");
        $("#leftCol").addClass("col-8");
        $("#rightCol").addClass("col-4");
        $("#rightCol").css("col-12");
    }
});
