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


</head>
<body>

<%

 String strMessage = request.getParameter("message");
 int nErrorCode = response.getStatus();
 String strErrorCode = null;
 String strShowMessage = null;

 //String strStatus = (String) session.getAttribute("Status");
 String strSessMessage = (String) session.getAttribute("Message");

if (200 == nErrorCode){
    strErrorCode = "";
}
else
{
    strErrorCode = Integer.toString(nErrorCode);
}

if (null == strMessage || strMessage.length() == 0)
    strMessage = "Oooops";
else 
	switch (strMessage.charAt(0))
	{
	case '1': 
	    strShowMessage = "User data should be submitted by the POST method instead of GET method.";
		break;
	case '2': 
	    strShowMessage = "User registeration failed.";
		break;
	case '3': 
	    strShowMessage = strSessMessage;
		break;
	case '4': 
	    strShowMessage = "Recover password failed.";
		break;
	case '5': 
	    strShowMessage = "Recover password failed. Your email account does not exist, please sign up to continue.";
		break;
		
	default:
	    strMessage = "Oooops";
	    break;
	}

%>

	<div class="container">
		<div class="col-lg-8 col-lg-offset-2 text-center"
			style="padding: 8% 22%;">
			<div class="logo">
				<h1>Error <span><%=strErrorCode%></span> ! </h1>
			</div>
			
			<p class="lead text-muted"><%=strShowMessage%></p>
			
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
//session.removeAttribute("Status");
session.removeAttribute("Message");
%>

</body>
</html>