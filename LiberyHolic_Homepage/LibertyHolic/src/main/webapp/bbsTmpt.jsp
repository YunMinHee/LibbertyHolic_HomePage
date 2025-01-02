<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="lbhbbs.LbhBbsDAO" %>
<%@ page import ="lbhbbs.LbhMainBBS" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libertyholic_컨셉콘텐츠제작소</title>

<!-- 외부css와 js 위아래 위치순서 바뀌면 동작 안함. 주의 요구 -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"></head>

<!-- 공통 CSS -->
<link href="./resources/css/common.css" rel="stylesheet" type="text/css" />

<!-- 공통 JS -->
<script type="text/javascript" src="./resources/JS/common.js"></script>

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<!-- tilte row 기능 끄기 -->
<style>
#main-header {
	
}
</style>

<!-- 상단 메뉴 css -->
<style>
.main-nav-item {
	border-top: 1px solid #C8C8C8;
	border-bottom: 1px solid #C8C8C8;
	height	: 50px;
	width	: 750px;
	padding	: 0px;
	top  	: 130px;
	left 	: 575px; 
	position: absolute;
}

.gubun-menu-item {
	float: left;
	position: relative;
}

.outer-menu-item {
	float: left;
	position: relative;
}

.outer-menu-item:hover {
	background: lIGHTGRAY;
	color: black;
}

.gubun-title {
	display: block;
	height: 30px;
	linte-height: 50px;
	text-align: left;
	padding: 11px 40px 11px 20px;
	float: left;
	font-weight: bold;
}

.menu-title {
	display: block;
	height: 30px;
	line-height: 20px;
	text-align: left;
	padding: 11px 20px;
	float: left;
}

.inner-menu {
	display: none;
	position: absolute;
	top: 40px;
	left: 0;
	width: 100%;
	background: white;
	box-shadow: 0 2px 6px rgba(5, 5, 5, 0.9);
	z-index: 1000;
	text-align: center;
}

.inner-menu-item>a {
	display: block;
	padding: 5px 10px;
	color: black;
}

.inner-menu-item>a:hover {
	background: lIGHTGRAY;
	color: black;
}
</style>

<!-- 테이블 css -->
<style>
.container{
	margin : 0 ;
  	top  : 210px;
	left : 445px; 
}

.table {
	top  : 210px;
	left : 445px; 
	width: 750px;
	position: relative;
}
</style>
<!-- 버튼 css -->
<style>
.btn-arrow-left{
	top  : 550px;
	right : 500px; 
	width: 100px;
	height : 35px;
 	position: relative;
}
</style>
<!-- 글쓰기 버튼 -->
<style>

.pull-right{
	top  : 150px;
	left : 150px; 
	width: 10%;
	height: 40px;
	position: relative;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="./resources/JS/common.js"></script>
<!-- js_왼쪽 세로메뉴 -->

<script>
	$(document).ready(function() {
		$('.outer-menu-item').hover(function() {
			$(this).find('.inner-menu').show();
		}, function() {
			$(this).find('.inner-menu').hide();
		});
	});
</script>

</head>

<body>
<!-- 전체 -->
<div id="page-wrapper">
<!-- 
	세션 다 만듦 
	해결할 사항
	1. 로그인 전 <a href="#">내 공간</a> - alert창 만들기
	2. 화면단에서 utf-8이 적용안되서 db에 한글이 깨져서 들어가는 거..
	3. css 만들때마다 깨지는 거
 -->
	 <!-- 세션관리 -->
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
 	<!-- 로그인 전 -->
	<%
		if(userID == null){
	%>
		<!-- 상단 작은 메뉴 -->
		<div id="upper_menu" >
			<div class ="upper_menu_item login"><a href="login.jsp">로그인</a></div>
			<div class ="upper_menu_item join"><a href="join.jsp">회원가입</a></div>
			<div class ="upper_menu_item my_space"><a href="#">내 공간</a></div>
		</div>
	<!-- 로그인 후 -->
	<%
		} else{
	%>	
		<div id="upper_menu" >
			<div class ="upper_menu_item login"><a href="logoutAction.jsp">로그아웃</a></div>
			<div class ="upper_menu_item join"><a href="joinAction.jsp">회원가입</a></div>
			<div class ="upper_menu_item my_space"><a href="#">내 공간</a></div>
		</div>
	<%
		}
	%>
	<!-- 메인 헤더 -->
	<header id="main-header">
		<hgroup>
			<h1 class="master-title">Libertyholic</h1>
			<h4 class="master-description">컨셉콘텐츠제작소</h4>
		</hgroup>
	</header>
	<nav id="main-navigation">
		<div class="gubun-nav-title">목록</div>
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
		<!-- 상단메뉴 -->
		<div class="main-nav-item">
			<ul class="outer-menu">
				<li class="gubun-menu-item"><span class="gubun-title"><a
						href="#">일러스트</a></span></li>
				<li class="outer-menu-item"><span class="menu-title">자료</span>
					<ul class="inner-menu">
						<li class="inner-menu-item"><a href="#">아무거나</a></li>
					</ul></li>
				<li class="outer-menu-item"><span class="menu-title">컨셉주제</span>
					<ul class="inner-menu">
						<li class="inner-menu-item"><a href="#">자유 주제 (고정)</a></li>
						<li class="inner-menu-item"><a href="#">정령15제 (매달변경)</a></li>
						<li class="inner-menu-item"><a href="#">몽환10제 (매달변경)</a></li>
						<li class="inner-menu-item"><a href="#">도시15제 (매달변경)</a></li>
					</ul></li>
				<li class="outer-menu-item"><span class="menu-title">일러스트
						이어그리기</span>
					<ul class="inner-menu">
						<li class="inner-menu-item"><a href="#">자유주제 (고정)</a></li>
						<li class="inner-menu-item"><a href="#">컨셉주제 (매달변경)</a></li>
					</ul></li>
				<li class="outer-menu-item"><span class="menu-title">준비중</span>
					<ul class="inner-menu">
						<li class="inner-menu-item"><a href="#">작업중</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- 게시판 -->
	<div class="container">
		<div class = "row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd ">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						LbhBbsDAO bbsDAO = new LbhBbsDAO();
						ArrayList<LbhMainBBS> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
						<tr>
							<td><%= list.get(i).getBbsID() %></td>
							<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
							<td><%= list.get(i).getUserID() %></td>
							<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시 " + list.get(i).getBbsDate().substring(14, 16) + "분 "%></td>
						</tr>
					<% 
						} 
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href ="bbsTmpt.jsp?pageNumber=<%=pageNumber - 1%>"class="btn btn-success btn-arrow-left">이전</a>
			<% 
				} if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href ="bbsTmpt.jsp?pageNumber=<%=pageNumber + 1%>"class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>
		</div>
	</div>
	<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>		
</div>
</body>
</html>