<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>

<%
    final String strHostUrl = request.getRequestURL().toString();
    /** Web Tracker **/
    More.webTracker(request, "load page", null);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>MORE HOME</title>

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
<script src="js/validation.js"></script>

</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="menu.jsp"%>


		<!--PAGE CONTENT -->
		<img width="100%" src="/assets/img/bg-col-xl-shape-thin.jpg" alt="" />

		<div id="content">
			<div class="inner" style="min-height: 700px; padding: 0;">
				<div id="intro" class="full-height-outer bg-grey full-height-s">
					<div class="silk-white">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">
									<span style="color: #001075;">MORE</span> Platform
								</h2>
								<h3 style="font-weight: bold;" class="vline-right-orange">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

							</div>
						</div>
					</div>
					<div class="photoframe">
						<img src="/assets/img/sample1.png" class="photo">
					</div>

				</div>

				<div id="" class="full-height-outer bg-white full-height-m">

					<div class="silk-grey">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">Dashboard</h2>
								<h3 style="font-weight: bold;" class="vline-right-green">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

							</div>
						</div>
					</div>
				</div>

				<div id="" class="full-height-outer bg-green full-height-m">
					<div class="silk-white-green">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">Resources</h2>
								<h3 style="font-weight: bold;" class="vline-right-blue">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

							</div>
						</div>
					</div>
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

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/flot/jquery.flot.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.stack.js"></script>
	<script src="/assets/js/for_index.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
<%
    more = null;
%>