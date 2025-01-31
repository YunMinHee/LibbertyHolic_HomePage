<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="./resources/JS/common.js"></script>  <!-- js_왼쪽 세로메뉴 -->

<!-- Main nav 메세지   -->
<style>
 	.notice-message-pre{
		border-top  : 1px solid #C8C8C8;
		border-bottom: 1px solid #C8C8C8;
		display		: block;
		
		height		: 50px;
		width    	: 735px;
		top         : 130px;
		left		: 590px;
		padding		: 12px 10px 8px 20px;
		
		line-height	: 25px;
		text-align	: left;
		font-weight	: 10px;
		position	: absolute;
}
	}
</style>

<!--  최신이미지 & 마우스휠 슬라이드  -->
<style>
	/*최신 이미지*/
	.newest-img-title{
	    border-top   : 1px solid #C8C8C8;
	    border-bottom: 1px solid #C8C8C8;
	    width		 : 150px;
	    top			 : 210px;
	    left		 : 590px;
	    padding		 : 15px 10px 15px 10px;
	    line-height  : 8px;
	    text-align	 : center;
	    position	 : absolute;	
	}
	
	/*마우스휠 슬라이드*/
	.newest-img-wraper{
		height		 : 400px;
	    width		 : 725px;
	    position	 : absolute;
	    overflow     : hidden;
	    top			 : 195px;
	    left		 : 590px;
	}
	.newest-img-wraper img{
		height        : 230px;
		width         : 230px;
		position      : absolute;
		margin        : 80px 250px 0px 0px; 
	}
</style>

<!--  최신공지 & 게시글  -->
<style>
	/*최신공지글*/
	.main-news-line{
		border-top   : 1px solid #C8C8C8;
		border-bottom: 1px solid #C8C8C8;
	    width        : 150px;
	    top			 : 550px;
	    left		 : 590px;
	    padding		 : 15px 10px 15px 10px;
	    line-height  : 8px;
	    text-align   : center;
	    position     : absolute;	
	}
	
	/*최신게시글*/
	.main-atc-line{
		border-top   : 1px solid #C8C8C8;
		border-bottom: 1px solid #C8C8C8;
	    width        : 150px;
	    top			 : 550px;
	    left		 : 835px;
	    padding		 : 15px 10px 15px 10px;
	    line-height  : 8px;
	    text-align   : center;
	    position     : absolute;	
	}
	
	/*회사 위치*/
	.company-location{
		border-top   : 1px solid #C8C8C8;
		border-bottom: 1px solid #C8C8C8;
		width        : 150px;
	    top			 : 550px;
	    left		 : 1080px;
	    padding		 : 15px 10px 15px 10px;
	    line-height  : 8px;
	    text-align   : center;
	    position     : absolute;	
	}
</style>

<!--  최신글 게시판미리보기 -->
<style>

	.mainBbs td{
	  padding: 0 !important;
	}
	
	.container{
		top			 : 600px;
	    left		 : 595px;
	    width        : 220px;
	    padding 	 : 15px 0 0 5px;
	    height		 : 15px;
	    position     : absolute;
	}
	
	.newsMainView{
	 	padding-top  : 3px;
		width		 : 180px;
		font-size 	 : 15px;
		display 	 : inline-block;
		text-overflow: ellipsis;
		overflow	 : hidden;
		white-space	 : nowrap;
		text-align	 : left;
	}
	
</style>
</head>

<body>
<!-- 전체 -->
<div id="page-wrapper">
<!-- 세션과리 -->
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
%>
<!-- 
	세션 다 만듦 
	해결할 사항
	1. 로그인 전 <a href="#">내 공간</a> - alert창 만들기
	2. 화면단에서 utf-8이 적용안되서 db에 한글이 깨져서 들어가는 거..
	3. css 만들때마다 깨지는 거
 -->
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
	<header id ="main-header">
		<!-- 타이틀 -->
		<hgroup>
			<h1 class ="master-title"><a href ="main.jsp">Libertyholic</a></h1>
			<h4 class ="master-description">컨셉콘텐츠제작소</h4>
		</hgroup>
	</header>
	
	<!-- 목록 & 알림말  -->
	<nav id= "main-navigation">
		<div class= "gubun-nav-title">목록</div>
		<div class= "notice-message-pre">모든 창작자를 위한 놀이터입니다. 서로 배려하며 즐겁게 홯동해주세요.</div>
	</nav>
	
	<!-- 목록 위쪽 화살표  -->
	<div id="arrowSwitch" class=" upper_arrow" ></div>
	
	<!-- 목록 세로 메뉴바 --> 
	<ul id="navi">
		<li class="group">
		    <div class="title">전체공지</div>
		    <ul class="sub">
		        <li><a href="bbsTmpt.jsp">전체공지</a></li>
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
		<li class="group">
		    <div class="title">요리</div>
		    <ul class="sub">
		        <li><a href="#">요라정보</a></li>                
		        <li><a href="#">요리Tip</a></li>
		        <li><a href="#">요리자랑</a></li>
		    </ul>
		</li>  
		<li class="group">
		    <div class="title">의상</div>
		    <ul class="sub">
		        <li><a href="#">옷본정보</a></li>                
		        <li><a href="#">제작Tip</a></li>
		        <li><a href="#">의상자랑</a></li>
		    </ul>
		</li>
		<li class="group">
		    <div class="title">음악</div>
		    <ul class="sub">
		        <li><a href="#">음악정보</a></li>                
		        <li><a href="#">악기정보</a></li>
		        <li><a href="#">작곡_작사</a></li>
		    </ul>
		</li>
    </ul>
    
	<!-- 목록 아래쪽 화살표  -->
	<div id="arrowSwitch" class="bottom_arrow"></div>
    
	<!-- 최신 이미지 좌우 스크롤 -->
	<div class= "newest-img-title">최신 이미지</div>
	<div class="newest-img-wraper">
		<img src="./resources/img/ImissYou.jpg"> 
		<img src="./resources/img/meowf.jpg"> 
		<img src="./resources/img/ONESEYES.jpg"> 
		<img src="./resources/img/StalkingTheMoon.jpg"> 
		<img src="./resources/img/profile.jpg"> 
		<img src="./resources/img/bird.jpg"> 
		<img src="./resources/img/picnic.jpg"> 
		<img src="./resources/img/tiger.jpg">
	</div>
	
	<div class= "main-news-line">최신공지글</div>
	
	<!-- 최근공지글 - 5개 -->
	<div class="container">
		<div class = "row">
			<table class="table table-striped mainBbs" style="text-align: center; ">
				<tbody>
					<%
						LbhBbsDAO bbsDAO = new LbhBbsDAO();
						ArrayList<LbhMainBBS> list = bbsDAO.getList();
						for(int i = 0; i < list.size(); i++){
					%>
						<tr>
							<td><div class="newsMainView"><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></div></td>
						</tr>
					<% 
						} 
					%>
				</tbody>
			</table>
		</div>
	</div>
	<div class= "main-atc-line">최신게시글</div>
	<div class= "company-location">회사 위치</div> 
			
</div>
</body>

<!-- js_TODO-->
<script>

var imgObj = null;

/* window.onload = init; */

// 오른족 메뉴 화살표 제어
/* function init(){
		alert(111);
	var imgObj = document.getElementById("arrowSwitch");
	var navi = document.getElementById("navi");
	navi.style.height = parseInt(navi.style.height);
	if(navi.style.height >= 455 + "px"){
		imgObj.style.display = "block";
		
	}
	
} */

/* function moveRight(){
	imgObj.style.left = parseInt(imgObj.style.left) + 100 +'px';
} */

// 최신이미지 -롤링 배너
window.onload = function() {
	var bannerLeft = 0;
	var first = 1;
	var last;
	var imgCnt = 0;
	var $img = $(".newest-img-wraper img");
	var $first;
	var $last;

	$img.each(function() { // 5px 간격으로 배너 처음 위치 시킴
		$(this).css("left", bannerLeft);
		bannerLeft += $(this).width() + 15;
		$(this).attr("id", "banner" + (++imgCnt)); // img에 id 속성 추가
	});
	
	$(".newest-img-wraper").on('mousewheel',function(e){
		var wheelDelta = e.originalEvent.wheelDelta;
		if(wheelDelta > 0){
			console.log("up");
			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		}else{
			console.log("down");
			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		}
	});
};



</script>
</html>