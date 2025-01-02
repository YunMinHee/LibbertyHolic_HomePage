<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libertyholic_컨셉콘텐츠제작소</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></head>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="./resources/css/common.css" rel="stylesheet" type="text/css" />
<link href="./resources/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="./resources/JS/common.js"></script>  


<!-- 로그인 전후 메인 - nav -->
<style>
 	.notice-message{
	    border-top   : 1px solid #C8C8C8;
		border-bottom: 1px solid #C8C8C8;	
		display      : block;
		height       : 50px; 
		width        : 700px; 
		margin       : 10px 250px 0px 250px;
		padding      : 12px 10px 8px 20px;
		line-height  : 25px;
		text-align   : left;
	    font-weight  : 10px;
	    position     : absolute;
	} 
	
</style>

<!-- 로그인 화면 스타일 -->
<style>
 .container {

 	height       : 550px;
    width        : 730px;
    background   : #edeff2;
    margin       : 0;
    top          : 212.5px;
    left         : 250px;
    padding      : 0px auto;
  	position     : absolute;
 }

.cont_wrap {
	margin       :  85px 0 0 5px;
	padding      :  0 0 0 100px;
}
.login-title{
	text-align    : center; 
	padding-bottom: 20px;
	width         : 500px;
	text-shadow   : gray;
	font-weight	  : 500;
}

.form-group{
	padding-bottom : 20px;
}

.form-control{
	
	width : 500px;
}
</style>
<!-- 로그인 화면 전체 -->
<style>
.container {
	left : 520px;
}
</style>

<body>
	<!-- 전체 -->
	<div id="page-wrapper">
		<!-- 상단 작은 메뉴 -->
		<div id="upper_menu" >
			<div class ="upper_menu_item login"><a href="login.jsp"> 로그인 </a></div>
			<div class ="upper_menu_item join"><a href="#"> 회원가입 </a></div>
			<div class ="upper_menu_item my_space"><a href="#"> 내 공간 </a></div>
		</div>		
	
		<header id ="main-header">
			<!-- 타이틀 -->
			<hgroup>
				<h1 class ="master-title"><a href ="main.jsp">Libertyholic</a></h1>
				<h4 class ="master-description">컨셉콘텐츠제작소</h4>
			</hgroup>
		</header>
		
		<!-- 목록 & 알림말  -->
		<nav class= "main-navigation">
			<div class= "gubun-nav-title">목록</div>
			<div class= "notice-message">모든 창작자를 위한 놀이터입니다. 서로 배려하며 즐겁게 홯동해주세요.</div>
		</nav>
		
		<!-- 목록 세로 메뉴바 --> 
		<ul id="navi">
	        <li class="group">
	            <div class="title">전체공지</div>
	            <ul class="sub">
	                <li><a href="#">전체공지</a></li>
	            </ul>
	        </li>
	        <li class="group">
	            <div class="title">그림</div>
	            <ul class="sub">
	                <li><a href="#">일러스트</a></li>     
	                <li><a href="#">만화</a></li>
	                <li><a href="#">회화</a></li>
	                           
	            </ul>
	        </li>
	        <li class="group">
	            <div class="title">글</div>
	            <ul class="sub">
	                <li><a href="#">도서</a></li>                
	                <li><a href="#">문장수집</a></li>
	                <li><a href="#">주제수집</a></li>
	                <li><a href="#">스토리</a></li>    
	            </ul>
	        </li>        
	    </ul>
		
		<!-- 회원가입 양식 -->
		<div class ="container">
			<div class="cont_wrap">
				<form method="post" action="joinAction.jsp">
					<h3  class="login-title">회원가입 화면</h3>
					<div class="form-group"> 
						<input type="text" class="form-control" autofocus placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" autofocus placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>	
					<div class="form-group">
						<input type="text" class="form-control" autofocus placeholder="이름" name="userName" maxlength="20">
					</div>	
					<div class="form-group" style = "text-align: left ; ">
							<label class ="btn btn-primary active">
								<input type ="radio" name ="userGender" autocomplete ="off" value ="남자" checked>남자
							</label>
							<label class ="btn btn-primary active">
								<input type ="radio" name ="userGender" autocomplete ="off" value ="여자" checked>여자
							</label>
							<label class ="btn btn-primary active">
								<input type ="radio" name ="userGender" autocomplete ="off" value ="중성" checked>중성
							</label>
							<label class ="btn btn-primary active">
								<input type ="radio" name ="userGender" autocomplete ="off" value ="미정" checked>미정
							</label>
					</div>	
					<div class="form-group">
						<input type="email" class="form-control" autofocus placeholder="이메일" name="userEmail" maxlength="20">
					</div>	
					<input type ="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
		
	</div>
</body>
</html>