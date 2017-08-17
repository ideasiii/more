<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="more.*"%>

<%
    /** Web Tracker **/
    More.webTracker(request, "load page", null);

    session.invalidate();
    response.sendRedirect("home.jsp");
%>