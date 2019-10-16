<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.slide{
    width: 100%;
    height: 24.7em;
}
.row>section{
	position:relative !important;
	width:100%;
	display:block;
	padding:0;
	margin-top: 0;
	margin-left:0;
 
	
}
.row>h2{
margin-top:3em;
margin-bottom:0;
}


.tiles>.row>article{
/* border:1px solid black;   */
height:23em;
}

.location>span>img,.reviewHeart>span>img{
width:1em;
height:1em;
}
.price, .reviewHeart{
width:3em;
display:inline;
}
.price{
margin-right:4em
}
.locationName>h3{
margin-top:1em;
margin-bottom: 1em !important;

}
</style>
<title>SPLACE</title>
</head>
<body>
	<!-- 이 형식을 꼭 지켜주세요! 
		top.jsp, bottom.jsp, style.css, fontawesome-all.min.css, noscript.css,
		main.js, browser.min.js, breakpoints.min.js, util.js파일은 수정 금지
	-->
	<div id="wrapper">
	
		<jsp:include page="WEB-INF/views/common/top.jsp"/>
		<div id="main">
			<div class="inner">
			
				<!-- 여기에만 씁시다.(다른 부분은 고정!)
					section단위로 묶고 nav 템플릿에 elements.html를 참고해주세요.
				-->

				<!--슬라이드   -->
				<section>
					<div class="row">
						<div id="carouselExampleInterval" class="carousel slide"data-ride="carousel">
							<div class="carousel-inner w-100 h-100">
								<div class="carousel-item w-100 h-100 active" data-interval="10000">
									<img src="resources/img/studio.jpg" class="d-block w-100 h-100" alt="...">
								</div>
								<div class="carousel-item w-100 h-100" data-interval="2000">
									<img src="resources/img/conference.jpg" class="d-block w-100 h-100" alt="...">
								</div>
								<div class="carousel-item w-100 h-100">
									<img src="resources/img/rooftop.jpg" class="d-block w-100 h-100" alt="...">
								</div>
							</div>
							<a class="carousel-control-prev" href="#carouselExampleInterval"role="button" data-slide="prev"> 
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> 
								<span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next"> 
							<span class="carousel-control-next-icon" aria-hidden="true"></span> 
							<span class="sr-only">Next</span> 
							</a>
						</div>
					</div>
				</section>

				<!-- 추천 공간 -->
				<section>
					<div class="row">
						<h2>추천 공간</h2>
					</div>
					<hr>
				</section>
				
				<!-- 목록 -->
				<section class="tiles">
					<div class="row" id="bestSpace">
					<c:url var="sDetail" value="detailSpace.sp">
			        <c:param name="spaceId" value="${bestSpace.spaceId}"></c:param>
			        </c:url>
					</div>
				</section>
				
				<!-- 새로 등록된 공간  -->
				<section>
					<div class="row">
						<h2>새로 등록된 공간</h2>
					</div>
					<hr>
				</section>
				
				<!-- 목록  -->
				<section class="tiles">
					<div class="row" id="newSpace">
					<c:url var="sDetail" value="detailSpace.sp">
			        <c:param name="spaceId" value="${newSpace.spaceId}"></c:param>
			        </c:url>
						
					</div>
				</section>
			</div>
		</div>
		<script>
		$(function(){
			newSpaceList();
			bestSpaceList();
		});
		// 새로운 공간 리스트 출력
		function newSpaceList(){
			$.ajax({
				url:"newSpace.sp",
				dataType:"JSON",
				success:function(newSpace){
					var $body=$("#newSpace");
					
					$body.html("");
					console.log("newSpace");
					if(newSpace.length>0){
						$.each(newSpace,function(i){
							var result ="";
							var addr=newSpace[i].spaceAddress.split(",");
							console.log(addr);
							
							result+='<article>'
									+'<span class="image">' 
									+'<img src="${contextPath}/resources/spaceImg/'
									+newSpace[i].spaceAttChange
									+'" alt="" />'
									+'</span>' 
									+'<a href="${sDetail}'
									+newSpace[i].spaceId
									+'"></a>'
									+'<span>'
									+'<div class="locationName">'
									+'<h3>'
									+newSpace[i].spaceName
									+'</h3>'
									+'</div>'
									+'<div class="location">'
									+'<span> '
									+'<img src="resources/img/location.svg">'
									+addr[1]
									+'</span>'
									+'</div>'
									+'<div class="tags">'
									+'<span>'
									+newSpace[i].spaceTag
									+'</span>'
									+'</div>'
									+'<div class="price">'
									+'<strong>'
									+newSpace[i].spaceAdd
									+'</strong> <span>원/시간</span>'
									+'</div>'
									+'</span>'
									+'</article>';
									
									$body.append(result);
						});
					}
				},
				error:function(){
					console.log("error");
				}
			});
			
		}
		
		// 추천 공간 리스트 출력
		function bestSpaceList(){
			$.ajax({
				url:"bestSpace.sp",
				dataType:"JSON",
				success:function(bestSpace){
					var $body=$("#bestSpace");
					
					$body.html("");
					console.log("bestSpace");
					if(bestSpace.length>0){
						$.each(bestSpace,function(i){
							var result ="";
							var addr=bestSpace[i].spaceAddress.split(",");
							console.log(addr);
							
							result+='<article>'
									+'<span class="image">' 
									+'<img src="${contextPath}/resources/spaceImg/'
									+bestSpace[i].spaceAttChange
									+'" alt="" />'
									+'</span>' 
									+'<a href="${sDetail}'
									+bestSpace[i].spaceId
									+'"></a>'
									+'<span>'
									+'<div class="locationName">'
									+'<h3>'
									+bestSpace[i].spaceName
									+'</h3>'
									+'</div>'
									+'<div class="location">'
									+'<span> '
									+'<img src="resources/img/location.svg">'
									+addr[1]
									+'</span>'
									+'</div>'
									+'<div class="tags">'
									+'<span>'
									+bestSpace[i].spaceTag
									+'</span>'
									+'</div>'
									+'<div class="price">'
									+'<strong>'
									+bestSpace[i].spaceAdd
									+'</strong> <span>원/시간</span>'
									+'</div>'
									+'</span>'
									+'</article>';
									
									$body.append(result);
									
						});
					}
				},
				error:function(){
					console.log("error");
				}
			});
		}
	
	
		</script>
		<jsp:include page="WEB-INF/views/common/bottom.jsp"/>
	</div>
</body>
</html>