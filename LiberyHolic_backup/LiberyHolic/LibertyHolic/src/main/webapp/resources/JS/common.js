/* js_왼쪽 세로메뉴 */ 
$(document).ready(function() {

	//모든 서브 메뉴 감추기
	$(".sub").css({ display: "none" });

	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	$(".title").click(function() {
		var submenu = $(this).next(".sub");
		// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
});
