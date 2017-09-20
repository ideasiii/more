<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="more.*"%>
<%@ page import="org.json.JSONObject"%>

<%
    request.setCharacterEncoding("UTF-8");
			String rMethod = request.getMethod();
			/** Web Tracker **/
			More.webTracker(request, "request method", rMethod);

			if (null != rMethod && rMethod.equals("GET")) {
				response.sendRedirect("/more/console/error.jsp");
				
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

			//String httpsURL = "https://ser.kong.srm.pw/dashboard/user";

			String httpsURL = "http://54.199.198.94/test/testpost.jsp";
			
			JSONObject jObj = new JSONObject();
			jObj.put("email", strEmail);
			jObj.put("password", strHashedPassword);
			jObj.put("groupId", 1);
			jObj.put("displayName", strName);
			jObj.put("company", strCompany);
			jObj.put("phone", strPhone);
			jObj.put("purpose", strPurpose);
			jObj.put("agreementVersion", strAgreeV);

			
			byte[] b = jObj.toString().getBytes("ISO-8859-1");  
			String strResult = new String(b,"UTF-8");
			
			HttpsClient httpsClient = new HttpsClient();
			 strResult = httpsClient.sendPost(httpsURL,"data="+strResult);
//String strResult = httpsClient.sendPost(httpsURL,"{\"email\":\"strirrng@tt.tt\",\"password\":\"66352f5047b22615fae384a4a7555b84\",\"groupId\":1,\"displayName\":\"ssss\",\"company\":\"測試\",\"phone\":\"123\",\"purpose\":\"string\",\"agreementVersion\":\"string\"}");
			
More.webTracker(request, "******************************", strResult);
		

			JSONObject jObjUserId = new JSONObject(strResult);
			int nUserId = 0;
			if (null != jObjUserId && jObjUserId.has("userId")) {
				nUserId = jObjUserId.getInt("userId");

			}

			if (nUserId > 0)
				More.webTracker(request, "User registeration success:  Email: " + strEmail + " UserId: " + String.valueOf(nUserId),
						jObj.toString());
			else {
				More.webTracker(request, "User registeration failed, error: no response from server ", strResult);
			}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE PROGRESS</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/assets/css/countdown.css" />

<!-- Javascript -->
<script src="js/validation.js"></script>

</head>

<body>

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
	    if (nUserId > 0) {
	%>
	<script>
		formSubmit('FormHome');
	</script>
	<%
	    }
	    else
	    {
			out.println(strResult);
	    }
	%>
</body>
</html>