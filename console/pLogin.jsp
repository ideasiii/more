<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="more.*"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>

<%
	/** Web Tracker **/
	More.webTracker(request, "load page", null);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE PROGRESS</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/more/css/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/more/css/countdown.css" />

<!-- Javascript -->
<script src="js/validation.js"></script>
<script type="text/javascript">
	function jumpSignUpPage() {
		alert("The E-mail account is invalid, please sign up to continue. \n");
		location.replace("signup.jsp");
	}

	function jumpLoginPage() {
		alert("Error: wrong email or password. \n");
		location.replace("login.jsp");
	}

	function jumpLoginPageUnverified() {
		alert("User is not verified, please contact us. \n");
		location.replace("login.jsp");
	}
</script>

</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String rMethod = request.getMethod();
		/** Web Tracker **/
		More.webTracker(request, "request method", rMethod);

		if (null != rMethod && !rMethod.equals("POST")) {
	%>
	<script>
		post('error.jsp', {
			message : '1'
		});
	</script>
	<%
		} else {

			//	  final String strEmail = request.getParameter("inputEmail");
			//		final String strPassword = request.getParameter("inputPassword");

			String strTokenEncoded = request.getParameter("loginToken");
			//	Logs.showTrace("******************encoded : " + strTokenEncoded);

			//if (null != strTokenEncoded) 

			Base64.Decoder decoder = Base64.getDecoder();
			byte[] decodedByte = decoder.decode(strTokenEncoded);
			final String strLoginToken = new String(decodedByte);

			String[] parts = strLoginToken.split("\r\n");
			final String strEmail = parts[0];
			final String strPassword = parts[1];

			Logs.showTrace("******************email : " + strEmail);

			boolean bAuthResult = false;

			/** MD5 hash **/
			More more = new More();
			String hash = more.calcMD5(strPassword);
			String strHashedPassword = more.calcMD5("$1$MoREKey" + hash);

			String httpsURL = "https://ser.kong.srm.pw/dashboard/token/client-id";

			JSONObject jobj = new JSONObject();
			jobj.put("email", strEmail);
			jobj.put("hashedPassword", strHashedPassword);

			HttpsClient httpsClient = new HttpsClient();
			String strResult = httpsClient.sendPost(httpsURL, jobj.toString());

			JSONObject jObjLoginInput = new JSONObject(strResult.trim());

			int nUserId = 0;
			int nUserId2 = 0;
			String strAToken = null;
			String strClientId = null;
			String strStatus = null;
			String strMessage = null;

			if (null != jObjLoginInput && jObjLoginInput.has("userId")) {
				nUserId = jObjLoginInput.getInt("userId");
			}
			if (null != jObjLoginInput && jObjLoginInput.has("clientId")) {
				strClientId = jObjLoginInput.getString("clientId");
			}

			if (0 < nUserId) {
				httpsURL = "https://ser.kong.srm.pw/dashboard/token/authorize";

				jobj = new JSONObject();
				jobj.put("email", strEmail);
				jobj.put("clientId", strClientId);

				httpsClient = new HttpsClient();
				String strAuthResult = httpsClient.sendPost(httpsURL, jobj.toString());

				JSONObject jObjAuth = new JSONObject(strAuthResult);

				if (null != jObjAuth && jObjAuth.has("accessToken")) {
					strAToken = jObjAuth.getString("accessToken");
				}

				if (null != jObjAuth && jObjAuth.has("userId")) {
					nUserId2 = jObjAuth.getInt("userId");
				}
				if (null != strAToken && 0 < nUserId2) {
					bAuthResult = true;
					More.webTracker(request, "login success User ID: " + nUserId2,
							"Email: " + strEmail + "; Access Token: " + strAToken);
					System.out.println("******************login success User ID: " + nUserId2 + ", Email: "
							+ strEmail + "; Access Token: " + strAToken);

					//		Cookie cEmail = new Cookie("email", strEmail);
					//		response.addCookie(cEmail);

					More.mMemberData memberData = new More.mMemberData();
					int nCount = more.mQueryMember(request, strEmail, memberData);
					more = null;

					//System.out.println("*********************************1. nCount:" + nCount);

					if (0 == nCount) {

						httpsURL = "https://ser.kong.srm.pw/dashboard/user";

						httpsClient = new HttpsClient();
						String strURL = httpsURL + "?api_key=" + strAToken;

						HttpsClient.Response respData = new HttpsClient.Response();
						strResult = httpsClient.sendGet(strURL, respData);
						int nCode = respData.mnCode;
						String strRespData = respData.mstrContent;
						String strAgreementVersion = null;

						if (200 == nCode) {
							JSONObject jObjMessage = new JSONObject(strResult);

							if (null != jObjMessage && jObjMessage.has("agreementVersion")) {
								strAgreementVersion = jObjMessage.getString("agreementVersion");
							}
						} else {
							strAgreementVersion = "error";
						}

						more = new More();
						int nAddResult = more.mMemberAdd(request, nUserId2, strEmail, strAgreementVersion);
						nCount = more.mQueryMember(request, strEmail, memberData);
						more = null;
					}

					//System.out.println("*********************************2. nCount:" + nCount);

					Integer groupLevel = new Integer(memberData.member_level);

					if (0 < nCount) {
						session.setAttribute("Email", strEmail);
						session.setAttribute("Group Level", groupLevel);
						session.setAttribute("Client ID", strClientId);
						session.setAttribute("Token", strAToken);
					}

				} else {

					if (null != jObjAuth && jObjAuth.has("status") && jObjAuth.has("message")) {
						strStatus = jObjAuth.getString("status");
						strMessage = jObjAuth.getString("message");
					}

					More.webTracker(request, "Login authorize failed : " + strStatus,
							strMessage + " Email: " + strEmail);

					Cookie cEmail = new Cookie("email", URLEncoder.encode(strEmail, "UTF-8"));
					Cookie cStatus = new Cookie("status", URLEncoder.encode(strStatus, "UTF-8"));
					Cookie cMessage = new Cookie("message", URLEncoder.encode(strMessage, "UTF-8"));
					response.addCookie(cEmail);
					response.addCookie(cStatus);
					response.addCookie(cMessage);

					if (null != strMessage && strMessage.equals("User is not verified.")) {
	%>
	<script type="text/javascript">
		setTimeout('jumpLoginPageUnverified()', 1);
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		setTimeout('jumpLoginPage()', 1);
	</script>
	<%
		}

				}
			} else {

				strStatus = jObjLoginInput.getString("status");
				strMessage = jObjLoginInput.getString("message");

				More.webTracker(request, "Login failed : " + strStatus, strMessage + " Email: " + strEmail);

				Cookie cEmail = new Cookie("email", URLEncoder.encode(strEmail, "UTF-8"));
				Cookie cStatus = new Cookie("status", URLEncoder.encode(strStatus, "UTF-8"));
				Cookie cMessage = new Cookie("message", URLEncoder.encode(strMessage, "UTF-8"));
				response.addCookie(cEmail);
				response.addCookie(cEmail);
				response.addCookie(cStatus);
				response.addCookie(cMessage);
	%>
	<script type="text/javascript">
		setTimeout('jumpLoginPage()', 1);
	</script>
	<%
		}

			if (bAuthResult == true) {

				response.sendRedirect("/more/console/home.jsp");
			}
		}
	%>
</body>
</html>