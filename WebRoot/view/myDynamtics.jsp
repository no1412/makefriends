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
					<li class="active"><a href="${pageContext.request.contextPath }/user_getMyCollections.do">个人中心</a></li>
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
				<div class="bottom_div">
					<p>
						<a href="${pageContext.request.contextPath }/view/myGroups.jsp"><span class="icon-bookmark">&nbsp;&nbsp;我的吧台</span></a>
					</p>
				</div>
				<div class="bottom_div" style="background-color: #337AB7;">
					<p style="color: white;">
						<a href="#" style="color: white;"><span class="icon-tags">&nbsp;我的帖子</span></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span class="icon-chevron-right"></span>
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
				<h3 style="color: #000000;margin-top: 0;">我的帖子</h3>
			</div>
			<hr class="middle_right_hr">
			<!--
            	作者：756048962@qq.com
            	时间：2016-01-28
            	描述：ajax添加
            -->
			<div>
				<div class="mypost_div1">
					<a href="${pageContext.request.contextPath }/view/postHome.jsp">
						<div>
							<span class="mypost_span1">体验零下39℃：画面简直太震撼了画面简直太震撼了画面简直太震撼了画面简直太震撼了</span>
							<span class="mypost_span2">
								<i class="icon-angle-right">&nbsp;&nbsp;技术宅</i>
							</span>
						</div>
						<div class="mypost_div3">
							这两日，关于“六小龄童上央视春晚节目被毙”成了热议话题，“大师兄”一下子跳到网络热搜的榜首，后来网友们才发现“猴哥”压根就没有受到邀请 ，为此大伙愤愤不平：“蟠桃会不请猴哥也就算了，那是天上的事我们管不了，人间为啥也要把猴哥拒之门外？”有网友调侃道“看来春晚导演组的能 耐比如来佛大，当年猴哥只是被五指山压了五百年，而春晚的导演组却要把猴哥压制永生永世，因为人们是在怀疑12年后已经饕餮之年的猴哥还上得了春晚吗？”
						</div>
						<div class="mypost_div5">
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/200.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/201.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/202.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/203.jpg" /></div>
						</div>
					</a>
					<div class="mypost_div4">
						<span class="mypost_span3">2015-10-25 21:08:13</span>
						<span class="glyphicon glyphicon-eye-open" title="浏览量">45</span>&nbsp;&nbsp;
						<span class="glyphicon glyphicon-comment" title="帖子数量">89</span>&nbsp;&nbsp;
						<a class="icon-trash icon-large" title="删除"></a>
					</div>
				</div>
				<hr class="mymessage_hr1">
				<div class="mypost_div1">
					<a href="${pageContext.request.contextPath }/view/postHome.jsp">
						<div>
							<span class="mypost_span1">【Tiny Times】小时代续写</span>
							<span class="mypost_span2">
								<i class="icon-angle-right">&nbsp;&nbsp;小说吧</i>
							</span>
						</div>
						<div class="mypost_div3">
							 我们几个人订好房间后计划了一下，决定先在海南玩儿两天，然后去巴厘岛，最后去英国，最之后就回上海。 第二天，我们上午准备了一下，下午来到海边，放眼望去，一片都是穿比基尼的美女，我们也换上了事先准备好的比基尼，现在我们也成为她们其中的一员。我们在海边嬉闹着，仿佛这一刻我们都是孩子，我们互相泼着水，溅起来的水花贱到了我们每个人的脸上，我们一直玩儿到很晚，直到夕阳落山………
						</div>
						<div class="mypost_div5">
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/204.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/205.jpg" /></div>
						</div>
					</a>
					<div class="mypost_div4">
						<span class="mypost_span3">2016-12-25 08:08:43</span>
						<span class="glyphicon glyphicon-eye-open" title="浏览量">4222</span>&nbsp;&nbsp;
						<span class="glyphicon glyphicon-comment" title="帖子数量">11</span>&nbsp;&nbsp;
						<a class="icon-trash icon-large" title="删除"></a>
					</div>
				</div>
				<hr class="mymessage_hr1">
				<div class="mypost_div1">
					<a href="${pageContext.request.contextPath }/view/postHome.jsp">
						<div>
							<span class="mypost_span1">《蜀山战纪》虐恋之吻</span>
							<span class="mypost_span2">
								<i class="icon-angle-right">&nbsp;&nbsp;电视剧</i>
							</span>
						</div>
						<div class="mypost_div3">
							不多说，让我们看看以下图片吧？点暂是鼓励，赞赏是动力。发言是你们对“银杏夫妇”的爱意。友情提示【100赞一更哦！】
						</div>
						<div class="mypost_div5">
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/206.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/207.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/208.jpg" /></div>
						</div>
					</a>
					<div class="mypost_div4">
						<span class="mypost_span3">2005-10-04 01:58:13</span>
						<span class="glyphicon glyphicon-eye-open" title="浏览量">25</span>&nbsp;&nbsp;
						<span class="glyphicon glyphicon-comment" title="帖子数量">759</span>&nbsp;&nbsp;
						<a class="icon-trash icon-large" title="删除"></a>
					</div>
				</div>
				<hr class="mymessage_hr1">
				<div class="mypost_div1">
					<a href="${pageContext.request.contextPath }/view/postHome.jsp">
						<div>
							<span class="mypost_span1">如我战死沙场，愿亲人能理解，伤我最深的人过得比我好</span>
							<span class="mypost_span2">
								<i class="icon-angle-right">&nbsp;&nbsp;军人</i>
							</span>
						</div>
						<div class="mypost_div3">
							我们不是万能的，穿着军装我们是忠诚卫士，是不畏牺牲，不畏艰难困苦，脱下军装还是一个普普通通的人，不是神，愿那些只喜欢军装的女人不要再来打扰，不要再来伤害我，
						</div>
						<div class="mypost_div5">
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/210.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/209.jpg" /></div>
							<div class="mypost_imgs"><img src="${pageContext.request.contextPath }/img/203.jpg" /></div>
						</div>
					</a>
					<div class="mypost_div4">
						<span class="mypost_span3">2011-11-25 11:28:14</span>
						<span class="glyphicon glyphicon-eye-open" title="浏览量">442</span>&nbsp;&nbsp;
						<span class="glyphicon glyphicon-comment" title="帖子数量">879</span>&nbsp;&nbsp;
						<a class="icon-trash icon-large" title="删除"></a>
					</div>
				</div>
				<hr class="mymessage_hr1">
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