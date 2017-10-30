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
	  final String strEmail = request.getParameter("inputAccount");
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
		}else{
			
		if (null != strEmail) {
			System.out.println("*********************************1. strEmail:" + strEmail);
			
			String httpsURL = "https://ser.kong.srm.pw/dashboard/user/check";
			
			HttpsClient httpsClient = new HttpsClient();
			String strURL = httpsURL + "?" + httpsClient.UrlEncode("email", strEmail, true);

			HttpsClient.Response respData = new HttpsClient.Response();
			String strResult = httpsClient.sendGet(strURL, respData);
			int nCode = respData.mnCode; //http return code
			//String strMessage = respData.mstrContent;

			System.out.println("*********************************3.nCode :" + nCode );
			
		//	if (200 == nCode) {
		//		System.out.println("*********************************200");
				JSONObject jObjMessage = new JSONObject(strResult);
				String strMessage = null;
				String strStatus = null;

				if (null != jObjMessage && jObjMessage.has("status")) 
					strStatus = jObjMessage.getString("status");
				
				if (null != jObjMessage && jObjMessage.has("message")) {
					strMessage = jObjMessage.getString("message");
					
					System.out.println("*********************************3.strMessage:" + strMessage);
					
					if (strMessage == "conflict email") {
					
						System.out.println("*********************************");
						
						
						
						More.webTracker(request, "test", null);
						
						
						
						
						
						
						
					} else { // non conflict email
					
						More.webTracker(request, "Recover Password failed: non conflict email", " Email: " + strEmail);
						response.sendRedirect("/more/console/signup.jsp");
						
					}
				} // jObjMessage
				
				
				
			//	} // Email check response code != 200
				
		} // email 
			
		} //post
		
		
		
		
		
		
		
		
		
	%>
</body>
</html>

