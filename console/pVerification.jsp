<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="more.*"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>MORE PROCESS</title>

<!-- Javascript -->
<script src="js/validation.js"></script>
</head>
<body>

	<%
		/** Web Tracker **/
		More.webTracker(request, "load progress page", null);

		String strOutput = "";
		request.setCharacterEncoding("UTF-8");

		final String strEmail = request.getParameter("inputEmail");

		if (null != strEmail) {

			String httpsURL = "https://ser.kong.srm.pw/dashboard/token/authorize";

			String strAdEmail = "iiimoreapi@gmail.com";
			String strAdClientId = "30v3ipcocin86onnb4gli0l2bf";
			String strAToken = null;
			int nUserId = 0;

			JSONObject jobj = new JSONObject();
			jobj.put("email", strAdEmail);
			jobj.put("clientId", strAdClientId);

			HttpsClient httpsClient = new HttpsClient();
			String strAuthResult = httpsClient.sendPost(httpsURL, jobj.toString());

			JSONObject jObjAuth = new JSONObject(strAuthResult);

			if (null != jObjAuth && jObjAuth.has("accessToken")) {
				strAToken = jObjAuth.getString("accessToken");
			}
			if (null != jObjAuth && jObjAuth.has("userId")) {
				nUserId = jObjAuth.getInt("userId");
			}

			if (null != strAToken && 0 < nUserId) {
				// Got admin token 
				Logs.showTrace("**********Token: " + strAToken + " UserID: " + nUserId);

				httpsURL = "https://ser.kong.srm.pw/dashboard/user/check";

				httpsClient = new HttpsClient();
				String strURL = httpsURL + "?" + httpsClient.UrlEncode("email", strEmail, true) + "&"
						+ httpsClient.UrlEncode("api_key", strAToken, true);

				HttpsClient.Response respData = new HttpsClient.Response();
				String strResult = httpsClient.sendGet(strURL, respData);
				int nCode = respData.mnCode;
				//String strMessage = respData.mstrContent;

				if (200 == nCode) {
					//****VERIFY EMAIL SUCCESS**** 
					More.webTracker(request, "Email verification successs", "Email: " + strEmail);
					Cookie cEmail = new Cookie("email", strEmail);
					Cookie cCode = new Cookie("error", String.valueOf(nCode));
					response.addCookie(cEmail);
					response.addCookie(cCode);

				} else {
					JSONObject jObjMessage = new JSONObject(strResult);
					String strMessage = null;

					if (null != jObjMessage && jObjMessage.has("message")) {
						strMessage = jObjMessage.getString("message");
					}

					if (400 == nCode) {
						More.webTracker(request, "Email verification failed : " + nCode,
								strMessage + " Email: " + strEmail);
						Cookie cEmail = new Cookie("email", strEmail);
						Cookie cCode = new Cookie("error", String.valueOf(nCode));
						Cookie cMessage = new Cookie("message", strMessage);
						response.addCookie(cEmail);
						response.addCookie(cCode);
						response.addCookie(cMessage);
	%>
	<script>
		post('error.jsp', {
			message : '6'
		});
	</script>
	<%
		} else {
						More.webTracker(request, "Email verification error: " + nCode,
								strMessage + " Email: " + strEmail);
	%>
	<script>
		post('error.jsp', {
			message : '6'
		});
	</script>
	<%
		}
				}

			} else {
				// FAILED to get Admin token
				More.webTracker(request, "Verify email failed: token authorize failed, Email: " + strEmail,
						" TOKEN: " + strAToken + " USERID: " + nUserId);
				Logs.showTrace("**********token authorize failed, email: " + strEmail + " token: " + strAToken
						+ " UserId: " + nUserId);
	%>
	<script>
		post('error.jsp', {
			message : '6'
		});
	</script>
	<%
		}
		} else {
			// input email = null
			More.webTracker(request, "Verify email failed.", " Email: " + strEmail);
			Logs.showTrace("**********email = null :" + strEmail);
	%>
	<script>
		post('error.jsp', {
			message : '6'
		});
	</script>
	<%
		}

		//   strOutput += ("get host:" + strURL + "</br>");
		//   strOutput += ("result: " + strResult + "</br>");;
		//   strOutput += ("code: " + nCode + "</br>");
	%>

	<%=strOutput%>

	<script>
		window.close();
	</script>
</body>
</html>