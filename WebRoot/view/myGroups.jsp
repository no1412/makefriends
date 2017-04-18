<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="s" uri="/struts-tags" %>
<!doctype html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="Cache-Control" content="no-transform" />
	<title>寻友</title>
	<meta property="wb:webmaster" content="c65b073df2ffe5a1" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css"></link>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style2.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<!--<加载bootstrap.min.js之前先加载jquery.min.js-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/wow.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myjs-person.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/myAjax.js"></script>
	
	<script>
		new WOW().init();
		getTop();
	</script>
	<!--[if lt IE 9]>
	    <script src="http://static.sfcdn.org/dep/js/html5shiv.min.js "></script>
	    <script src="http://static.sfcdn.org/dep/js/respond.min.js "></script>
	    <link rel="respond-proxy " id="respond-proxy " href="http://static.sfcdn.org/cross-domain/respond-proxy.html "/>
	    <link rel="respond-redirect " id="respond-redirect " href="/assets/cross-domain/respond.proxy.gif "/>
	    <script src="/assets/cross-domain/respond.proxy.js "></script>
	    <![endif]-->

</head>

<body style="background-color:#eee;">

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：导航栏
		-->
	<nav class="nav navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="#" class="navbar-brand">
					<img src="${pageContext.request.contextPath }/img/logo.png" style="height: 45px;margin-top: -10px;" />
				</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${pageContext.request.contextPath }/view/index.jsp">首页</a></li>
					<li><a href="${pageContext.request.contextPath }/interest_getAllInfos.action">社区</a></li>
					<li class="active"><a href="${pageContext.request.contextPath }/view/personaCenter.jsp">个人中心</a></li>
					<li><a href="${pageContext.request.contextPath }/view/createInterestGroup.jsp">创建兴趣小组</a></li>
					<li><a href="#" data-toggle="modal" data-target="#about-modal">关于</a></li>
				</ul>
				<div class="navbar-form navbar-right">
					<div class="input-group" style="float: left;">
						<input type="text" class="form-control" placeholder="请输入关键字" />
						<div class="input-group-addon">
							<span class="glyphicon glyphicon-search"></span>
						</div>
					</div>
					<!-- 作者：756048962@qq.com 时间：2016-01-19 描述：登入后状态 -->
					<s:if test="#session.user!=null">
						<div id="login-area" style="height:20px; float: right;margin-left: 15px;">
						<ul class="clearfix logined">

							<li class="set_btn user-card-box">
								<a id="header-avator" class="user-card-item" href="${pageContext.request.contextPath }/user_getMyCollections.do">
									<img src='${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>' width='35' height='35' />
									<i class="myspace_remind" style="display: none;"></i>
								</a>
								<div class="g-user-card">
									<div class="card-inner">
										<div class="card-top">
											<img src="${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>" alt="<s:property value='#session.user.nickName'/>" class="l">
											<span class="name text-ellipsis"><s:property value="#session.user.nickName"/></span>
											<p class="meta">
												<a href="#">经验<b id="js-user-credit"><s:property value="#session.user.experience"/></b></a>
											</p>
										</div>
										<div class="card-links">
											<a href="${pageContext.request.contextPath }/view/myDynamtics.jsp" class="my-mooc l">我的帖子<i class="dot-update"></i></a>
											<span class="split l"></span>
											<a href="${pageContext.request.contextPath }/user_getMyCollections.do" class="my-sns l">个人中心</a>
										</div>
										<div class="card-sets clearfix">
											<a href="${pageContext.request.contextPath }/view/accountSetting.jsp" class="l">账号设置</a>
											<a href="${pageContext.request.contextPath }/user_logOut.action" class="r">退出</a>
										</div>
									</div>
									<i class="card-arr"></i>
								</div>
							</li>
						</ul>
					</div>
					</s:if>
					<s:else>
						<div class="input-group" style="margin-left:10px;overflow:hidden;">
							<a href="#" id="my-login" class="navbar-link active login-a" data-toggle="modal" data-target="#login-modal">登入</a>
							<span style="color:white;">|</span>
							<a href="#" id="my-register" class="navbar-link login-a" data-toggle="modal" data-target="#login-modal">注册</a>
						</div>
					</s:else>

				</div>
			</div>

		</div>
	</nav>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：关于
		-->
	<div class="modal fade" id="about-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">关闭</span></button>
					<h4 class="modal-title" id="modal-label">关于</h4>
				</div>
				<div class="modal-body">
					<p>寻友介绍
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
				</div>
			</div>
		</div>
	</div>

	<!--
    	作者：756048962@qq.com
    	时间：2016-01-21
    	描述：个人中心所关注的交流圈內容
    -->
	<div class="container" style="width: 1245px;margin-top:50px;">
		<div class="middle_left">
			<div class="middle_left_top">
				<img src="${pageContext.request.contextPath }/<s:property value="#session.user.head_pic"/>" />
				<div class="divspan1">
					<span><s:property value="#session.user.nickName"/></span>
				</div>
				<div class="divspan2">
					<span><marquee scrollamount="3" onmouseover=this.stop() onmouseout=this.start() ><s:property value="#session.user.signature"/></marquee></span>
				</div>
				<div style="margin-top: 0;margin-bottom: 10px;">
					<a href="#" style="margin-left: 10px;margin-right: 40px;">经验:<b id="js-user-credit"><s:property value="#session.user.experience"/></b></a>
					<a href="${pageContext.request.contextPath }/user_getMyCollections.do" title="我的收藏"><span class="icon-heart icon-large"></span></a>
					<a href="${pageContext.request.contextPath }/view/myMessages.jsp" title="我的消息"><span class="icon-envelope-alt icon-large"></span></a>
					<a href="${pageContext.request.contextPath }/view/accountSetting.jsp" title="账号设置"><span class="icon-cog icon-large"></span></a>
				</div>
			</div>
			<div class="middle_left_bottom">
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/user_getMyCollections.do"><span class="icon-heart">&nbsp;我的收藏</span></a>
					</p>
				</div>
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-bookmark">&nbsp;&nbsp;我的吧台</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myDynamtics.jsp"><span class="icon-tags">&nbsp;我的帖子</span></a>
					</p>
				</div>
				<%-- <div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myMessages.jsp"><span class="icon-envelope">&nbsp;我的消息</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myFriends.jsp"><span class="icon-comments">&nbsp;我的好友</span></a>
					</p>
				</div>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myPhotos.jsp"><span class="icon-camera-retro">&nbsp;我的相册</span></a>
					</p>
				</div> --%>
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/accountSetting.jsp"><span class="icon-cog">&nbsp;账号设置</span></a>
					</p>
				</div>
			</div>
		</div>

		<div class="middle_right">
			<div>
				<h3 style="color: #000000;margin-top: 0;">我的吧台</h3>
			</div>
			<hr class="middle_right_hr">
			<div class="right_div rounded wow fadeInUp">
				<h3 class="h3 right_h3">兼职平台~~~</h3>
				<hr class="right_hr" />
				<div class="right_imgdiv">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img class="right_img" src="${pageContext.request.contextPath }/img/3.jpg" /></a>
				</div>
				<p class="right_p">
					曾经有人问我，失去的东西回来还要吗？我说，我曾经丢了一粒扣子，等到找回那粒扣子时，我已经换了衣服。 人与人之间没有谁离不开谁， 只有谁不珍惜谁。 无论是故友还是红颜，一个转身，二个世界。 一生之中有一个爱你，疼你，牵挂你的人，这就是幸福。 人生皆回忆，且行 且珍惜！送给2016的第一天接吻的情侣，，，且行珍惜！？！
				</p>
				<div class="right_indiv">
					<span class="glyphicon glyphicon-user right_span1" title="用户数量">458</span>
					<span class="glyphicon glyphicon-edit right_span1" title="帖子数量">4332345</span>
					<span  title="收藏" class="icon-heart icon-large right_click right_span1 right_span3"></span>
				</div>
			</div>
			<div class="right_div rounded wow fadeInUp">
				<h3 class="h3 right_h3">大理旅游</h3>
				<hr class="right_hr" />
				<div class="right_imgdiv">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img class="right_img" src="${pageContext.request.contextPath }/img/4.jpg" /></a>
				</div>
				<p class="right_p">
					当兵一年多了，很想家，也很喜欢部队。家里的亲人还好吗？兄弟还好吗。张雅倩你还好吗？我很想回家过年。但是不能。因为我是兵。
				</p>
				<div class="right_indiv">
					<span class="glyphicon glyphicon-user right_span1" title="用户数量">55745</span>
					<span class="glyphicon glyphicon-edit right_span1" title="帖子数量">72245</span>
					<span  title="收藏" class="icon-heart icon-large right_click right_span1 right_span2"></span>
				</div>
			</div>
			<div class="right_div rounded wow fadeInUp">
				<h3 class="h3 right_h3">多面体</h3>
				<hr class="right_hr" />
				<div class="right_imgdiv">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img class="right_img" src="${pageContext.request.contextPath }/img/2.jpg" /></a>
				</div>
				<p class="right_p">
					最珍重的事应该最沉默。不肯说给人听，不肯拿给人看，放在心底，生怕语言扭曲它，空气氧 化它。日久月深成了一个人的心血，我们才成为了人群中彼此不同的人。
				</p>
				<div class="right_indiv">
					<span class="glyphicon glyphicon-user right_span1" title="用户数量">4532</span>
					<span class="glyphicon glyphicon-edit right_span1" title="帖子数量">896345245</span>
					<span  title="收藏" class="icon-heart icon-large right_click right_span1 right_span2"></span>
				</div>
			</div>
			<div class="right_div rounded wow fadeInUp">
				<h3 class="h3 right_h3">QQ飞车游戏</h3>
				<hr class="right_hr" />
				<div class="right_imgdiv">
					<a href="${pageContext.request.contextPath }/view/interestGroup.jsp"><img class="right_img" src="${pageContext.request.contextPath }/img/5.jpg" /></a>
				</div>
				<p class="right_p">
					"男人不要觉得有很多备胎多光荣，因为只有破车才需要备胎。女人也不要觉得有很多追求者多骄傲，因为只有廉价货才被哄抢！"所以做一个限量版的自己 ！
				</p>
				<div class="right_indiv">
					<span class="glyphicon glyphicon-user right_span1" title="用户数量">745</span>
					<span class="glyphicon glyphicon-edit right_span1" title="帖子数量">8978245</span>
					<span  title="收藏" class="icon-heart icon-large right_click right_span1 right_span2"></span>
				</div>
			</div>
		</div>
	</div>

	<!--
			作者：756048962@qq.com
			时间：2015-12-20
			描述：底部制作
		-->

	<br/>
	<br/>
	<footer style="padding: 15px;margin-top: 20px;background-color: white;">
		<p align="center">@2015寻友团队</p>
	</footer>

	<!--
        	作者：756048962@qq.com
        	时间：2015-12-21
        	描述：右下角流动框
        -->
	<div id="getTop" class="fixed-btn" style="background: #d0d6d9;-webkit-border-radius: 50%;display: none;">
		<a id="toTop" style="margin-left: 6px;"><span class="glyphicon glyphicon-chevron-up"></span></a>
	</div>

</body>

</html>