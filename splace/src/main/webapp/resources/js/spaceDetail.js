// 글자수 세기 
$(function() {
    $('#content').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/300');
    });
     $('#content').keyup();
    
    $(".cancel").on("click",function(){
    	$("#content").val("");
    	$('#counter').html('0/300');
    });
});

