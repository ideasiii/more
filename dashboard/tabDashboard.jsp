<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="tabAuth.jsp"%>
	
<%
	final String strTicket = sendPostTbaleau(); //Web server POSTS to Tableau Server
	Logs.showTrace("********strTicket: " + strTicket);
	
	if (StringUtility.isValid(strTicket)) {

%>	
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APP Tracker Data Analysis | MORE</title>
<link rel="icon" href="/assets/img/more.png">


<!--  JavaScript -->


</head>
<body>

<%
String paraHost_url = "host_url";
String value = "http%3A%2F%2F124.9.6.34%2F";
%>


	<script type='text/javascript'
		src='http://124.9.6.34/javascripts/api/viz_v1.js'></script>
	<div class='tableauPlaceholder' style='width: 100%; height: 100%;'>
		<object class='tableauViz' width='100%' height='100%'
			style='display: none;'>
			<param name='<%=paraHost_url%>' value='<%=value%>' />
			<param name="ticket" value=<%=strTicket%> /> 
			<param name='site_root' value='' />
			<param name='name' value='edubot_170601_10_0&#47;sheet0' />
			<param name='tabs' value='no' />
			<param name='toolbar' value='no' />
			<param name='showShareOptions' value='false' />
		</object>
	</div>




</body>
</html>

<%

} else {
response.sendRedirect("/more/console/error.jsp");
}

%>