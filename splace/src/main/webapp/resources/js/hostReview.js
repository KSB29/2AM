/**
 * 후기 리스트
 */
$(document).ready(function(){
	
	var imgPath = $("#img").val() + "/resources/ReviewImg/";
	console.log(imgPath);
	
	$(".attInfo").each(function(item, index){
		if ($(this).val() != "") {
			var arr = $(this).val().split(", ");
			console.log(arr);
			var imgTag = "";
			
			for (var i = 0; i < arr.length; i++) {
				imgTag += "<span><img class='attImg' src='" + imgPath + arr[i] + "'></span>";
				console.log(imgTag);
			}
			$(this).after(imgTag);
		}
	});
	
	$("#spaceId").change(function(){
		$("form").submit();
	});
	
});