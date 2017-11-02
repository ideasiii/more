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
<title>Message</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet" href="/more/css/more_style.css" />
<link rel="stylesheet" href="/more/css/bootstrap_2.css" />
<link rel="stylesheet"
	href="/more/css/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="/more/css/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="/more/css/error.css" />
<!--END PAGE LEVEL STYLES -->


</head>
<body>

<%
String strEmail = (String) session.getAttribute("reset PW Email");
%>

	<div class="container">
		<div class="col-lg-8 col-lg-offset-2 text-center"
			style="padding: 8% 22%;">
			<div class="logo">
				<h2>Password Reset</h2>
			</div>
			
			<span class="lead text-muted">We have sent an email to <%=strEmail%>.</span>
			<p class="lead text-muted">Please check your email to reset your password.</p>
			
			<br />
			<div class="col-lg-6  col-lg-offset-3">
				<div class="btn-group btn-group-justified" style="padding: 0 15%;">
					<a href="/more/console/home.jsp" class="btn btn-success">Return
						MORE Website</a>
				</div>

			</div>
		</div>


	</div>
<%
//session.removeAttribute("reset PW Email");
%>

</body>
</html>