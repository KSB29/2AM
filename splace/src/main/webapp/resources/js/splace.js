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
        $("#bell>i").css("color","#4c74b9");
    } else {
        x.style.display = "none";
        $("#bell>i").css("color","#585858");
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
});

