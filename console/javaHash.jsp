<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@page import="sdk.ideas.HttpsClient"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="more.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    /** MD5 hash **/
    More more = new More();
    String hash = more.calcMD5("testlogin");
    String strHashedPassword = more.calcMD5("$1$MoREKey" + hash);
    
	    
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>



</head>
<body>

	<%=strHashedPassword%>
	

</body>
</html>