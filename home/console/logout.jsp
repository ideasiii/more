<%@ page contentType="text/html; charset=utf-8" language="java" %>

<%
	session.invalidate(); 
    response.sendRedirect("home.jsp");
%>