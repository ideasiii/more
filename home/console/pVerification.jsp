<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="sdk.ideas.More"%>
<%@ page import="sdk.ideas.HttpsClient"%>
<%@ page import="sdk.ideas.HttpsClient.*"%>
<%@ page import="org.json.JSONObject"%>

<%
    /** Web Tracker **/
    More.webTracker(request, "load progress page", null);

    String strOutput = "";
    request.setCharacterEncoding("UTF-8");

    final String strEmail = request.getParameter("inputEmail");

    String httpsURL = "https://ser.kong.srm.pw/dashboard/user/check";

    HttpsClient httpsClient = new HttpsClient();
    String strURL = httpsURL + "?" + httpsClient.UrlEncode("email", strEmail, true);

    Response respData = new Response();
    String strResult = httpsClient.sendGet(strURL, respData);
    int nCode = respData.mnCode;
    //String strMessage = respData.mstrContent;
    
    
    if (200 == nCode)
    {
		More.webTracker(request, "Email verification successs", "Email: " + strEmail);
		
		Cookie cEmail = new Cookie("email", strEmail);
		Cookie cCode = new Cookie("error", String.valueOf(nCode));
		response.addCookie(cEmail);
		response.addCookie(cCode);
    }
    else
    {
		JSONObject jObjMessage = new JSONObject(strResult);
	    String strMessage = null;
	    if (null != jObjMessage && jObjMessage.has("message")) {
		strMessage = jObjMessage.getString("message");
	    }
	
		if (400 == nCode)
		{
		    
		    More.webTracker(request, "Email verification failed : " + nCode, strMessage + " Email: " + strEmail);
		    
			Cookie cEmail = new Cookie("email", strEmail);
			Cookie cCode = new Cookie("error", String.valueOf(nCode));
			Cookie cMessage = new Cookie("message", strMessage);
			response.addCookie(cEmail);
			response.addCookie(cCode);
			response.addCookie(cMessage);
		}
		else
		{
		    More.webTracker(request, "Email verification error: " + nCode , strMessage + " Email: " + strEmail);
		}
    }


 //   strOutput += ("get host:" + strURL + "</br>");
 //   strOutput += ("result: " + strResult + "</br>");;
 //   strOutput += ("code: " + nCode + "</br>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
  	<%=strOutput%>

<script>
		window.close();
</script>
</body>
</html>