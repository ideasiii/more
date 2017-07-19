<%@ page import="more.*"%>
<%@ page import="sdk.ideas.HttpsClient.*"%>
<%@ page import="sdk.ideas.HttpsClient"%>
<%@ page import="org.json.JSONObject"%>
<%
    String strEmailValid = (String) session.getAttribute("Email");
    String strTokenValid = (String) session.getAttribute("Token");
    boolean bLoginedValid = false;

    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
    //System.out.println(pageName);

    if (null != strEmailValid && null != strTokenValid)
    {
		String httpsURL = "https://ser.kong.srm.pw/dashboard/user/check";

		HttpsClient httpsClient = new HttpsClient();
		String strURL = httpsURL + "?" + httpsClient.UrlEncode("token", strTokenValid, true);

		Response respData = new Response();
		String strResult = httpsClient.sendGet(strURL, respData);
		int nCode = respData.mnCode;
		//String strMessage = respData.mstrContent;

		if (200 == nCode)
		{

		    bLoginedValid = true;

		}
		else
		{
		    JSONObject jObjMessage = new JSONObject(strResult);
		    String strMessage = null;
		    String strStatus = null;
		    if (null != jObjMessage && jObjMessage.has("message"))
		    {
			strMessage = jObjMessage.getString("message");
		    }
		    if (null != jObjMessage && jObjMessage.has("status"))
		    {
			strStatus = jObjMessage.getString("status");
		    }
		    
		    if (401 == nCode)
		    {

		    }

		}

    }
    else
    {

		if (!pageName.contains("login.jsp"))
		{
		    response.sendRedirect("/more/home/console/login.jsp");
		}
    }
%>
