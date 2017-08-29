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
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>Contact Us | MORE</title>
<link rel="icon" href="/assets/img/more.png">

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
	<div id="wrap" style="display: table; width: 100%; height: 100%;">

		<%@include file="menu.jsp"%>

		<!--PAGE CONTENT -->
		<div id="content" style="display: table-row; height: auto;">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro" class="landscape-bg"
					style="background-image: url('/assets/img/white-letter.jpeg'); background-size: 100% 100%;
    background-repeat: no-repeat; min-height: 100%;">

				
						<div class="container">
							<div class="row container-text-c">
							
							<div class="text-center" style="height:500px;">
									<h1 style="margin-top: 22%;font-weight: bold;">Get in touch with us</h1>
									
									<h2 style="margin-top: 8%;font-weight: bold;">serapi@iii.org.tw</h2>
								</div>
							
							
							</div>
						</div>
				

				</div>
			</div>
		</div>
		<!--END PAGE CONTENT -->


	</div>
	<!--END MAIN WRAPPER -->

	<%@include file="footer.jsp"%>

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
