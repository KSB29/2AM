// 글자수 세기 
$(function() {
    $('.content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('.counter').html(content.length + '/300');
    });
     $('.content').keyup();
    
    $(".cancel").on("click",function(){
    	$(".content").val("");
    	$('.counter').html('0/300');
    });
});

//별
$(document).ready(function(){
    $('#star_grade a').click(function(){
        $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
        $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
        return false;
    });
});


