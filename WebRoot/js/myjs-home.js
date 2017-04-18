/*登陆注册弹出框*/
$(function() {
	$("#my-login").click(function() {
		$('#login_a1').click();
	});
	$("#my-register").click(function() {
		$('#login_a2').click();
	});
})

/* 点击收藏颜色转换 */
$(function() {
	var changeSys = function() {
		if ($(this).hasClass('right_span2')) {
			$(this).removeClass('right_span2');
			$(this).addClass("right_span3");
		} else {
			$(this).removeClass('right_span3');
			$(this).addClass("right_span2");
		}
	};
	$(".right_click").each(function() {
		$(this).bind('click', changeSys);
	});
});

/*
 * 右下角回到顶部
 */
$(function() {
	var speed = 800;
	var h = document.body.clientHeight;
	$("#toTop").click(function() {
		$('html,body').animate({
			scrollTop : '0px'
		}, speed);
	});
});
function getTop() {
	if ($(document).scrollTop() > 600) {
		$("#getTop").css({
			'display' : 'block',
		});
	} else {
		$("#getTop").css('display', 'none');
	}
	setTimeout(getTop);
}
$(function() {
	// 点击图片更换验证码
	$("#verify").click(
			function() {
				$("#verifyImg").attr(
						"src",
						"/makeFriends/securityCodeImageAction.action?timestamp="
								+ new Date().getTime());
			});
});