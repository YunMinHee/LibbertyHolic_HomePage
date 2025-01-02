<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="lbhbbs.LbhMainBBS" %>
<%@ page import ="lbhbbs.LbhBbsDAO" %>
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

<!-- 상단 메뉴 css -->
<style>
.main-nav-item {
	border-top: 1px solid #C8C8C8;
	border-bottom: 1px solid #C8C8C8;
	height: 50px;
	width: 750px;
	padding: 0px;
	margin: 10px 250px 0px 250px;
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
.table {
	top  : 85px;
	left : 250px; 
	width: 750px;
	position: relative;
}
</style>

<!-- 글쓰기 수저 버튼 -->
<style>
.pull-write {
	top  : 80px;
	left : 900px; 
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
	 <!-- 세션과리 -->
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");			
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));		
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbsTmpt.jsp'");
			script.println("</script>");
		}
		LbhMainBBS bbs = new LbhBbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbsTmpt.jsp'");
			script.println("</script>");
		}
	%>
	<!-- 오른편 상단 메뉴-->
	<div id="upper_menu" >
		<div class ="upper_menu_item login"><a href="logoutAction.jsp">로그아웃</a></div>
		<div class ="upper_menu_item join"><a href="joinAction.jsp">회원가입</a></div>
		<div class ="upper_menu_item my_space"><a href="#">내 공간</a></div>
	</div>
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
			<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd ">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>" ></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;"><%= bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-write" value="글쓰기">
			</form>		
		</div>
	</div>
</div>
</body>
</html>