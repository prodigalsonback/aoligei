<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>奥利给动漫</title>
	<meta charset="utf-8">
	<meta name="author" content="qq:744347612">
	<link href="<%=request.getContextPath()%>/img/aoligeiico.jpg" rel="icon" type="image/x-ico">
	<meta name="description" content="aoligei"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
</head>
<body>
<!-- <div class="adcenter"><script src="http://www.cssmoban.com/include/new/ggad2_728x90.js"></script></div> -->
<div ></div>
	<header>
		<div class="logo">
			<%-- <a href="index.html"><img src="<%=request.getContextPath()%>/img/aoligeiico.jpg" title="Aoligei" alt="Aoligei"/></a> --%>
			战胜恐惧的最好办法就是面对恐惧，奥利给。
		</div><!-- end logo -->
		<!-- 手机端 -->
		<!-- <div id="menu_icon"></div> -->
		<nav>
			<ul>
				<c:if test="${sessionScope.usid!=null}">
				<li><a><%=session.getAttribute("uname")%></a></li>
				</c:if>
				<c:if test="${sessionScope.usid==null}">
				<li><a href="login.do" >登录</a></li>
				</c:if>
				<li><a href="#">About</a></li>
				<li><a href="#">The Team</a></li>
				<!-- <li><a href="#">Journal</a></li> -->
				<!-- <li><a href="contact.html">Contact Us</a></li> -->
			</ul>
		</nav><!-- end navigation menu -->

		<!-- <div class="footer clearfix">
			<ul class="social clearfix">
				<li><a href="#" class="fb" data-title="Facebook"></a></li>
				<li><a href="#" class="google" data-title="Google +"></a></li>
				<li><a href="#" class="behance" data-title="Behance"></a></li>
				<li><a href="#" class="twitter" data-title="Twitter"></a></li>
				<li><a href="#" class="dribble" data-title="Dribble"></a></li>
				<li><a href="#" class="rss" data-title="RSS"></a></li>
			</ul>end social

			<div class="rights">
				<p>奥利给动漫.</p>
				<p> 
			</div>end rights
		</div > --><!-- end footer -->
	</header><!-- end header -->

	<section class="main clearfix">
		<div class="work">
			<a href="tribune.do?tid=1">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=2">
				<img src="<%=request.getContextPath()%>/img/2.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>爆肝工程师的异世界狂想曲</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=3">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=4">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=5">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>
		

		<div class="work">
			<a href="tribune.do?tid=6">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=7">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=8">
				<img src="<%=request.getContextPath()%>/img/1.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>男子高中生的日常</h1>
					</div>
				</div>
			</a>
		</div>

		<div class="work">
			<a href="tribune.do?tid=9">
				<img src="<%=request.getContextPath()%>/img/2.jpg" class="media" alt=""/>
				<div class="caption">
					<div class="work_title">
						<h1>爆肝工程师的异世界狂想曲</h1>
					</div>
				</div>
			</a>
		</div>
	</section><!-- end main -->
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/waifu.css">
	<div style="z-index:10000;" class="waifu" id="waifu">
		<div class="waifu-tips" style="opacity: 1;"></div>
		<canvas id="live2d" width="280" height="250" class="live2d"></canvas>
		<div class="waifu-tool">
			<!-- <span class="fui-home"></span>
			<span class="fui-chat"></span> -->
			<span class="fui-eye" <%-- style="background-image:url(<%=request.getContextPath()%>/img/eye.png);" --%>>
			<img  src="<%=request.getContextPath()%>/img/eye.png">
			</span>
			<!-- <span class="fui-user"></span>
			<span class="fui-photo"></span>
			<span class="fui-info-circle"></span>-->
			<span class="fui-cross">
			<img  src="<%=request.getContextPath()%>/img/close.png">
			</span> 
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/js/live2d.js"></script>
	<script src="<%=request.getContextPath()%>/js/waifu-tips.js"></script>
	<script type="text/javascript">initModel()</script>
	
</body>
</html>