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
		    More.webTracker(request, "Validate token", "token: " + strTokenValid);
		    bLoginedValid = true;

		    Cookie cCode = new Cookie("status", String.valueOf(nCode));
		    response.addCookie(cCode);
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
			More.webTracker(request, "Token verification failed : " + strStatus + nCode, strMessage + " Token: " + strTokenValid);

			Cookie cCode = new Cookie("status", String.valueOf(nCode));
			Cookie cErrorMessage = new Cookie("message", strMessage);
			response.addCookie(cCode);
			response.addCookie(cErrorMessage);

			if (!pageName.contains("login.jsp"))
			{
			    response.sendRedirect("/more/home/console/login.jsp");
			}

		    }
		    else
		    {

			if (400 == nCode)
			{
			    More.webTracker(request, "Token verification failed : " + strStatus + nCode, strMessage + " Token: " + strTokenValid);

			    Cookie cCode = new Cookie("status", String.valueOf(nCode));
			    Cookie cErrorMessage = new Cookie("message", strMessage);
			    response.addCookie(cCode);
			    response.addCookie(cErrorMessage);

			    if (!pageName.contains("login.jsp"))
			    {
				response.sendRedirect("/more/home/console/login.jsp");
			    }

			}
			else
			{

			    More.webTracker(request, "Token verification error: " + strStatus + nCode, strMessage + " Token: " + strTokenValid);
			    if (!pageName.contains("login.jsp"))
			    {
				response.sendRedirect("/more/home/console/login.jsp");
			    }

			}
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
