<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	session.invalidate();
	Map<String, String[]> parameters = request.getParameterMap();
	for (String parameter : parameters.keySet())
	{
		String strValue = new String(parameters.get(parameter)[0].getBytes("ISO-8859-1"), "UTF-8");
		out.println("KEY:" + parameter + " VALUE:" + parameters.get(parameter)[0]);
		System.out.println("KEY:" + parameter + " VALUE:" + parameters.get(parameter)[0]);
	}
%>
