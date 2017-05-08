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


					<div class="row container-text-l">
						<h2 style="font-weight: bold; padding-right: 20px;">
							<span style="font-size: 72px;">Edubot</span>
						</h2>
						<h3 style="color: #8c8c8c; font-weight: bold; font-size: 38px;">
							<p>We provide 15 scenarios</p>
							<p>for building application faster</p>
						</h3>
					</div>

					<!-- Scenarios List -->
					<ul class="scenario-list">
						<li class="scenario-list-li">
							<div class="panel-body">
								<img class="" src="/assets/img/sample1.png" alt="" />


							</div>
						</li>


						<li class="scenario-list-li">
							<div class="panel-body">
								<img class="" src="/assets/img/sample1.png" alt="" />


							</div>
						</li>


						<li class="scenario-list-li">
							<div class="panel-body">
								<img class="" src="/assets/img/sample1.png" alt="" />


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