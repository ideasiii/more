<%@ page contentType="text/html; charset=utf-8" language="java"
	pageEncoding="UTF-8" session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="more.*"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE PROCESS</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/assets/css/countdown.css" />

<!-- Javascript -->
<script src="js/validation.js"></script>

</head>

<body>

	<%
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

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
		}

		final String strEmail = request.getParameter("inputEmail");
		final String strPassword = request.getParameter("inputPassword");
		final String strName = request.getParameter("inputName");
		final String strCompany = request.getParameter("inputCompany");
		final String strPhone = request.getParameter("inputPhone");
		final String strPurpose = request.getParameter("inputPurpose");
		final String strAgreeV = request.getParameter("agreeVersion");

		/** MD5 hash **/
		More more = new More();
		String hash = more.calcMD5(strPassword);
		String strHashedPassword = more.calcMD5("$1$MoREKey" + hash);

		more = null;
		/**	More more = new More();
		
			String strToken = more.generateToken(strEmail, false);
			int nResult = more.memberAdd(request, strEmail, strPassword, strName, strCompany, strPhone, strToken);
			more = null;
		**/

		String httpsURL = "https://ser.kong.srm.pw/dashboard/token/authorize";

		String strAdEmail = "iiimoreapi@gmail.com";
		String strAdClientId = "30v3ipcocin86onnb4gli0l2bf";
		String strAToken = null;
		int nAUserId = 0;

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
			nAUserId = jObjAuth.getInt("userId");
		}
		
		if (null != strAToken && 0 < nAUserId) {
			// Got admin token 
			Logs.showTrace("**********Token: " + strAToken + " UserID: " + nAUserId);
		
		 httpsURL = "https://ser.kong.srm.pw/dashboard/user?" + httpsClient.UrlEncode("api_key", strAToken, true);
		/*		
					JSONObject jObj = new JSONObject();
					jObj.put("email", strEmail);
					jObj.put("password", strHashedPassword);
					jObj.put("groupId", 1);
					jObj.put("displayName", strName);
					jObj.put("company", "中文");
					jObj.put("phone", strPhone);
					jObj.put("purpose", strPurpose);
					jObj.put("agreementVersion", strAgreeV);
					jObj.put("中文", strAgreeV);
		*/ 
		String strResult = "{" + "\"email\": \"" + strEmail + "\"," + "\"password\": \"" + strHashedPassword + "\","
				+ "\"groupId\": 1," + "\"displayName\": \"" + strName + "\"," + "\"company\": \"" + strCompany
				+ "\"," + "\"phone\": \"" + strPhone + "\"," + "\"purpose\": \"" + strPurpose + "\","
				+ "\"agreementVersion\": \"" + strAgreeV + "\"}";

		// String strResult = new String(jObj.toString().getBytes("ISO-8859-1"), "UTF-8");

		HttpJsonClient httpJsonClient = new HttpJsonClient();
		HttpJsonClient.JsonResponse resp = httpJsonClient.post(httpsURL, strResult);
		System.out.printf("***noError: %s, failMessage = %s, code = %d, body = %s", resp.noError ? "true" : "false",
				resp.failMessage, resp.code, resp.body);

		//HttpsClient httpsClient = new HttpsClient(); 
		//	 strResult = httpsClient.sendPost(httpsURL,strResult);
		//String strResult = httpsClient.sendPost(httpsURL,"{\"email\":\"strirrng@tt.tt\",\"password\":\"66352f5047b22615fae384a4a7555b84\",\"groupId\":1,\"displayName\":\"ssss\",\"company\":\"測試\",\"phone\":\"123\",\"purpose\":\"string\",\"agreementVersion\":\"string\"}");
	%>

	<div class="row">
		<div class="col-lg-12 title">
			<h2>Loading</h2>
			<p>Please Wait...</p>
			<img src="/assets/img/loading.gif" width="600px;">
		</div>
	</div>

	<form action="home.jsp" method="post" name="FormHome" id="FormHome">

	</form>

	<%
		int nUserId = 0;
		if (resp.code == 200) {

			JSONObject jObjUserId = new JSONObject(resp.body);
			if (null != jObjUserId && jObjUserId.has("userId")) {
				nUserId = jObjUserId.getInt("userId");

				if (nUserId > 0) {
					//More.webTracker(request, "User registeration success:  Email: " + strEmail + " UserId: " + String.valueOf(nUserId),
					//	jObj.toString());
					More.webTracker(request, "User registeration success:  Email: " + strEmail + " UserId: "
							+ String.valueOf(nUserId), strResult);
	%>
	<script>
		formSubmit('FormHome');
	</script>
	<%
		} else {
					//	User ID is invalid 
					More.webTracker(request, "User registeration failed, error: " + resp.failMessage, strResult);
					Logs.showTrace("***User registeration failed, error: " + resp.failMessage);
	%>
	<script>
		post('error.jsp', {
			message : '2'
		});
	</script>
	<%
		}
			} else {
				// jObjUserId 
				More.webTracker(request, "User registeration failed, error: " + resp.code,
						"fail message: " + resp.failMessage);
				Logs.showTrace("***User registeration failed, error: " + resp.failMessage);
	%>
	<script>
		post('error.jsp', {
			message : '2'
		});
	</script>
	<%
		}
		} else {
			// User registeration response code != 200
			More.webTracker(request, "User registeration failed, error: " + resp.code,
					"fail message: " + resp.failMessage);
			Logs.showTrace("***User registeration failed, error: " + resp.failMessage);
		}
		
		} else {
			// FAILED to get Admin token
			More.webTracker(request, "User registeration failed: token authorize failed, Email: " + strEmail,
					" TOKEN: " + strAToken + " USERID: " + nAUserId);
			Logs.showTrace("**********token authorize failed, email: " + strEmail + " token: " + strAToken
					+ " UserId: " + nAUserId);
%>
<script>
	post('error.jsp', {
		message : '2'
	});
</script>
<%
	}
	%>

</body>
</html>