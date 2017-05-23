<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<%@ page import="java.sql.*"%>    
<%@ page import="more.*"%>    
    
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





%>

</body>
</html>