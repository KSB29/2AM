<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>이메일 로그인</title>
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div id="subContents">
        <section id="subCont">
            <div id="login_form bg">  
                <div class="login_left bg_L">
                    <form action="login.sp" method="POST">
                        <div class="login_wrapper">
                            <div class="tit_s3">
                                <h3>LOGIN</h3> 
                            </div>
                            <div class="login_type">
                                <ul>
                                    <li class="google_login_btn"><a href="">g</a></li>
                                    <li class="naver_login_btn"><a href="">n</a></li>
                                    <li class="kakao_login_btn"><a href="">k</a></li>
                                </ul>
                            </div>
                            <div class="input_box_s1">
                                <p class="center">이메일로 하실래요?</p>
                                <div class="input_group">
                                    <div>
                                        <input type="text" name="memberId" placeholder="이메일을 입력하세요" required>
                                    </div>
                                    <div>
                                        <input type="password" name="memberPwd" placeholder="비밀번호를 입력하세요." required>
                                    </div>
                                    <div class="idcheck_box">
                                        <div>
                                            <input id="id_check" name="saveId" type="checkbox"> 
                                            <label for="id_check">ID 기억하기</label>
                                        </div>  
                                        <div class="find_pwd">
                                            <p>ID/PW 찾기</p>
                                        </div>
                                    </div>
                                    <div class="login_btn_box">
                                        <input type="submit" class="login_btn">
                                    </div>
                                </div>
                            </div>  
                        </div>
                    </form>
                </div>
                <div class="login_right bg_R">
                    <img src="" alt="">
                    <form action="memberJoin.sp" method="POST">
                        <div id="join_wrapper">
                            <div class="tit_s3">
                                <h3>아직 회원이 아니신가요?</h3>
                            </div>
                            <div class="join_type">
                                <ul>
                                    <li class="google_join_btn"><a href="">g</a></li>
                                    <li class="naver_join_btn"><a href="">n</a></li>
                                    <li class="kakao_join_btn"><a href="">k</a></li>
                                </ul>
                            </div>
                            <div class="join_box_s1">
                                <p class="center">이메일로 가입할래요</p>
                                <div class="join_btn_box">
                                    <input type="button" class="join_btn" value="메일로 가입">
                                </div> 
                            </div>                            
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <!--subContents--->
</body>
</html>