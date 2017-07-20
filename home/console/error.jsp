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
<title>Error</title>

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

<!-- Javascript -->
<script type="text/javascript">


</script>

</head>
<body>

<%

final String strMessage = request.getParameter("message");

//out.println(strAToken);

%>

	<div class="container">
		<div class="col-lg-8 col-lg-offset-2 text-center"
			style="padding: 8% 30%;">
			<div class="logo">
				<h1>Error !</h1>
			</div>
			<p class="lead text-muted"><%=strMessage%></p>
			
			<br />
			<div class="col-lg-6  col-lg-offset-3">
				<div class="btn-group btn-group-justified">
					<a href="/more/home/console/home.jsp" class="btn btn-success">Return
						MORE Website</a>
				</div>

			</div>
		</div>


	</div>


</body>
</html>