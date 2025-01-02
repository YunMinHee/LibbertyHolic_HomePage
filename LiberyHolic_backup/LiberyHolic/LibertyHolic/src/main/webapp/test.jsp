<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
var imgObj = null;

function init(){
		
	imgObj = document.getElementById('myImage');
	imgObj.style.position ='relative';
	imgObj.style.left = '0px';
	
}

function moveRight(){
	imgObj.style.left = parseInt(imgObj.style.left) + 100 +'px';
}

window.onload = init;

</script>

</head>
<body>

<form>
<img id="myImage" src="./resources/img/ImissYou.jpg" />
<input type="button" value="Click Me" onclick ="moveRight();"/>
</form>

</body>
</html>
