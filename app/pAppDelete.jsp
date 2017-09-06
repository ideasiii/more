<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="more.*"%>     
    
    
<%@include file="../../console/loginValid.jsp"%>    
    
<%
    final String strHostUrl = request.getRequestURL().toString();
    /** Web Tracker **/
    More.webTracker(request, "load progress page", null);
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE PROGRESS</title>

</head>
<body>

<%
	String strEmail = (String) session.getAttribute("Email");
	final String strAppId = request.getParameter("DeleteAppId");

	 
		if (!StringUtility.isValid(strEmail) || !StringUtility.isValid(strAppId)) {
			response.sendRedirect("home.jsp");
			return;
		}
		
		More more = new More();
		more.mDeleteApp(request, strAppId);  
		More.webTracker(request, "Delete APP", "APP ID: " + strAppId + " Member Email: " + strEmail);
		more = null;
		
		
		if (StringUtility.isValid(strAppId))
		{
	    response.sendRedirect("app_list.jsp");
		}
		else
		{
		    response.sendRedirect("error.jsp");
		}
%>


</body>
</html>