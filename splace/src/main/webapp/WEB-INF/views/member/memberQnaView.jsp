<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/common.css" />
		<link rel="stylesheet" href="${contextPath}/resources/css/memberQna.css" />
		
	</head>
	
	
	<body class="is-preload">
		
		<!-- header -->
		
		<jsp:include page="../common/top.jsp"/>
		<!-- Wrapper -->
			<div id="wrapper">
		

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<jsp:include page="memberMenu.jsp"/>
                            <section>

                            </section>
                                <section>
                                        <h1 class="center">1:1문의 </h1>
                                        <article class="row"> 
                                            <div class="col-12 bookListTop">
                                         	   <div class="filterContainer">
                                         	   		<div class="default-select" id="default-select">
		                                                <select name="filter" id="filter">
		                                                    <option value="">전체검색</option>
		                                                    <option value="1">답변 완료</option>
		                                                    <option value="1">답변 대기</option>
		                                                </select>
	                                                </div>
                                                </div>
                                            </div>
                                        </article>
                                        <div class=>
                                            <table>
												<colgroup>
													<col width="20%">							
													<col width="60%">							
													<col width="10%">							
													<col width="10%">							
												</colgroup>
                                                <thead>
                                                    <tr class="center">
                                                        <th>글번호</th>
                                                        <th>제목</th>
                                                        <th></th>
                                                        <th>처리상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>Item One</td>
                                                        <td>Ante turpis integer aliquet porttitor.</td>
                                                        <td>29.99</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Item Two</td>
                                                        <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                                        <td>19.99</td>
                                                        <td></td>

                                                    </tr>
                                                    <tr>
                                                        <td>Item Three</td>
                                                        <td> Morbi faucibus arcu accumsan lorem.</td>
                                                        <td>29.99</td>
                                                        <td></td>

                                                    </tr>
                                                    <tr>
                                                        <td>Item Four</td>
                                                        <td>Vitae integer tempus condimentum.</td>
                                                        <td>19.99</td>
                                                        <td></td>

                                                    </tr>
                                                    <tr>
                                                        <td>Item Five</td>
                                                        <td>Ante turpis integer aliquet porttitor.</td>
                                                        <td>29.99</td>
                                                        <td></td>

                                                    </tr>
                                                </tbody>

                                            </table>
                                        </div>
    
							</section>
						</div>
					</div>
			</div>
			
			<!-- Footer -->
			<jsp:include page="../common/bottom.jsp"/>
			



	</body>
</html>