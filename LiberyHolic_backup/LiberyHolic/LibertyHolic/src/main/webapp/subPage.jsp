<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libertyholic_컨셉콘텐츠제작소</title>
<link href="./resources/css/common.css" rel="stylesheet" type="text/css" />
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
	<!-- 전체태그 -->
	<div id="page-wrapper">
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
						</ul></li>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>