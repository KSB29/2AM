$(function(){



	$("#deleteWish").on("click",function(){
		var memberId = $("#memberId").val();
		var spaceId = $("#spaceId").val();
		
		$.ajax({
			url:"deleteWishList.sp",
			data: {memberId:memberId, spaceId:spaceId},
			type: "get",
			success:function(result){
				if(result){
					window.location.reload();
				}else{
					alert('삭제에 실패했습니다  다시한번 시도해주세요! :*(')
				}
			}
			
		});
	});
	
	
});