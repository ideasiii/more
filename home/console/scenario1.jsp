<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>


<%
    final String strHostUrl = request.getRequestURL().toString();
    /** Web Tracker **/
    More.webTracker(request, "load page", null);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE</title>


<!-- GLOBAL STYLES -->
<link rel="stylesheet" href="/more/css/more_style.css" />
<link rel="stylesheet" href="/more/css/bootstrap_2.css" />
<link rel="stylesheet" href="/more/css/main_2.css" />
<link rel="stylesheet" href="/more/css/theme.css" />
<link rel="stylesheet" href="/more/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="/more/css/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="/more/css/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- JavaScript -->


</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="menu.jsp"%>


		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro"
					style="min-height: 900px; background-color: #f0f0f0;">


					<div class="container-text-l scenario-title">
						<h2 style="font-weight: bold;">
							<span style="font-size: 72px;">Edubot</span>
						</h2>
						<h3 class="scenario-subtitle">
							<p>We provide 15 scenarios</p>
							<p>for building application faster</p>
						</h3>
					</div>

					<!-- Scenarios List -->
					<ul class="scenario-list">
						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/10_wakeupjpg.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">早晨喚醒</h2>

									<div class="content">
										<span class="font">養成孩童自動按時起床習慣</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>


						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/3_conversation.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">父母對話</h2>

									<div class="content">
										<span class="font">小朋友可隨時透過機器人遠端與父母聯繫</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>

								</div>

							</div>
						</li>


						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/5_storytelling.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">學習探索-說故事</h2>

									<div class="content">
										<span class="font">陪伴小孩度過父母忙碌時間</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/4_question.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">問題解決Q&A</h2>

									<div class="content">
										<span class="font">解答小孩心中10萬個為什麼</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/6_learning.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">智慧學習</h2>

									<div class="content">
										<span class="font">互動式教學</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/9_sleeping.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">睡眠安撫</h2>

									<div class="content">
										<span class="font">夜燈模式搭配輕柔音樂來輔助孩童睡眠</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/8_playblocks.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">智能積木</h2>

									<div class="content">
										<span class="font">幫助孩子邏輯訓練</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/7_picturebook.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">讀取繪本</h2>

									<div class="content">
										<span class="font">根據小朋友的選擇讀取繪本並互動回答問題</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/1_accompany.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">聊天陪伴</h2>

									<div class="content">
										<span class="font">讓孩子與機器人互動閒聊</span> <a href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

						<li class="scenario-list-li">
							<div
								style="background-image: url('/assets/img/2_comfort.jpg'); background-repeat: no-repeat; width: 295px; height: 300px;">

								<div class="silk-bottom"
									style="width: 295px; height: 300px; z-index: 100; padding: 5px 30px;">
									<h2 class="title font">情緒安撫</h2>

									<div class="content">
										<span class="font">透過互動察覺小朋友心情並以適合的反應及音樂安撫情緒</span> <a
											href="#"
											class="btn btn-primary btn-xs btn-flat btn-rect btn-style">View
											Resources</a>
									</div>
								</div>

							</div>
						</li>

					</ul>



				</div>
			</div>
		</div>
		<!--END PAGE CONTENT -->



	</div>

	<!--END MAIN WRAPPER -->

	<!--FOOTER -->
	<footer class="footer">
	<div class="link_area">
		<dl class="link_group">
			<dd class="link">
				<a href="">Document</a>
			</dd>
		</dl>
		<dl class="link_group">
			<dd class="link">
				<a href="">Privacy Policy</a>
			</dd>
		</dl>
		<dl class="link_group">
			<dd class="link">
				<a href="">Contact Us</a>
			</dd>
		</dl>
		<div class="copyright_area">Copyright ©</div>
	</div>
	</footer>
	<!--END FOOTER -->

	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->


</body>
</html>
<%
    more = null;
%>