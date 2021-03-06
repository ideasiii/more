<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@page import="java.util.UUID"%>

<%
	final String strHostUrl = request.getRequestURL().toString();
	if (response.containsHeader("SET-COOKIE")) {
		String sessionid = request.getSession().getId();
		response.setHeader("SET-COOKIE", "JSESSIONID=" + sessionid + ";secure;HttpOnly");
	}

	/** Web Tracker **/
	More.webTracker(request, "load page", null);

	String uuid = UUID.randomUUID().toString().replaceAll("-", "");
	request.getSession().setAttribute("randTxt", uuid);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>Login | MORE</title>
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

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="/more/css/login.css" />
<link rel="stylesheet" href="/more/css/plugins/magic/magic.css" />
<!-- END PAGE LEVEL STYLES -->

<!-- JavaScript -->
<script src="js/validation.js"></script>


</head>

<body class="padTop53" style="height: 100%;">

	<!-- MAIN WRAPPER -->
	<div id="wrap" style="display: table; width: 100%; height: 100%;">

		<%@include file="menu.jsp"%>


		<!--PAGE CONTENT -->
		<div id="content" style="display: table-row; height: auto;">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro" class="bg-white full-height-s full-height-outer">
					<div class="silk-grey">
						<div class="container">
							<div class="row container-text-c">

								<div class="text-center">
									<h2 style="font-weight: bold;">Login to MORE</h2>
								</div>
								<div class="tab-content" style="border: 0; padding: 0;">

									<div id="login" class="tab-pane active">
										<form method="post" id="formLogin" name="formLogin"
											class="form-signin">
											<input type="hidden" name="randSession"
												value="<%=request.getSession().getAttribute("randTxt")%>" />
											<h4 class="text-center">Enter Your E-mail and Password</h4>
											<input id="inputEmail" name="inputEmail" type="text" required="required"
												placeholder="E-mail Account" class="form-control" /> <input
												id="inputPassword" name="inputPassword" type="password" required="required"
												placeholder="Password" class="form-control" />
											<button
												class="btn text-muted text-center btn-warning btn-grad"
												type="button" onclick="checkLoginData('formLogin')">Login</button>
										</form>
									</div>

									<div id="forgot" class="tab-pane">
										<form action="pForgotPass.jsp" method="post" id="formForgot" name="formForgot"
											class="form-signin">
											<input type="hidden" name="randSession"
												value="<%=request.getSession().getAttribute("randTxt")%>" />
											<h4 class="text-center">Enter Your E-mail Account</h4>
											<input  id="inputAccount" name="inputAccount" type="email" required="required"
												placeholder="Your E-mail" class="form-control" /> <br />
											<button
												class="btn text-muted text-center btn-success btn-grad"
												type="submit">Recover Password</button>
										</form>
										<br>
									</div>

								</div>
								<div class="text-center">
									<ul class="list-inline">
										<li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
										<li><a class="text-muted" href="#forgot"
											data-toggle="tab">Forgot Password</a></li>
									</ul>
								</div>


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
	<script src="/assets/plugins/jquery-3.2.1.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/flot/jquery.flot.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.stack.js"></script>
	<script src="/assets/js/for_index.js"></script>
	<script src="/assets/js/login.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
<%
	more = null;
%>
