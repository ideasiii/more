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
<title>MORE PROCESS</title>

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
		} else {
			
			if (null != strEmail) {
				Logs.showTrace("*********************************1. strEmail:" + strEmail);
			
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
					String strURL = httpsURL + "?" + httpsClient.UrlEncode("email", strEmail, true) + "&" + httpsClient.UrlEncode("api_key", strAToken, true);
				
					HttpsClient.Response respData = new HttpsClient.Response();
					String strResult = httpsClient.sendGet(strURL, respData);
					int nCode = respData.mnCode; //http return code
					//String strMessage = respData.mstrContent;

					Logs.showTrace("*********************************2.nCode :" + nCode);

					if (400 == nCode) {
						System.out.println("*********************************400");
						JSONObject jObjMessage = new JSONObject(strResult);
						String strMessage = null;
						String strStatus = null;
					
						if (null != jObjMessage && jObjMessage.has("status"))
							strStatus = jObjMessage.getString("status");
					
						if (null != jObjMessage && jObjMessage.has("message")) {
							strMessage = jObjMessage.getString("message");

							System.out.println("*********************************3.strMessage:" + strMessage);

							if (strMessage.contains("conflict email")) {
								// email valid SUCCESS to recover password
								Logs.showTrace("**********email valid SUCCESS to recover password");
					
								//httpsURL = "https://ser.kong.srm.pw/dashboard/user/reset-password";
								httpsURL = "https://ser.kong.srm.pw/dashboard/user/reset-password?email="+strEmail +"&api_key=" + strAToken;

								JSONObject jobjRP = new JSONObject();
								jobjRP = new JSONObject();
						//		jobjRP.put("email", strEmail);
						//		jobjRP.put("api_key", strAToken);

								httpsClient = new HttpsClient();

								String strRPAuthResult = httpsClient.sendPost(httpsURL, jobjRP.toString());
								Logs.showTrace("****AuthResult: " + strRPAuthResult);
								
								if ("" == strRPAuthResult) {
									//			****RESET-PASSWORD SUCCESS**** 
									
												session.setAttribute("reset PW Email", strEmail);
									
													More.webTracker(request, "Recover Password SUCCESS: EMAIL:" + strEmail,
															" ADTOKEN: " + strAToken + " USERID: " + nUserId);
													
													response.sendRedirect("/more/console/resetSuccess.jsp");

												} else {
													// reset-password response code != 200
													String strRPstatus = null;
													String strRPmessage = null;

													JSONObject jObjRPAuth = new JSONObject(strRPAuthResult);
													
													if (null != jObjRPAuth && jObjRPAuth.has("message")) {
														strRPmessage = jObjRPAuth.getString("message");
													}
													if (null != jObjRPAuth && jObjRPAuth.has("status")) {
														strRPstatus = jObjRPAuth.getString("status");
														if (strRPstatus.contains("error"))
														{
															More.webTracker(request,
																	"Recover Password failed, Email: " + strEmail, "STATUS: " + strRPstatus +" MESSAGE: " + strRPmessage);
															Logs.showTrace("****reset failed******Email: " + strEmail + "message: " + strRPmessage + " status: " +  strRPstatus);
															%>
															<script>
																post('error.jsp', {
																	message : '4'
																});
															</script>
															<%
														} else {
														// response code != 200 && status != error	
															More.webTracker(request,"Recover Password failed", "EMAIL: "+ strEmail);
															Logs.showTrace("****reset failed******Email: " + strEmail);
															%>
															<script>
																post('error.jsp', {
																	message : '4'
																});
															</script>
															<%
														}
													}
													Logs.showTrace("****reset failed******message: " + strRPmessage + " status: " +  strRPstatus);
												}
							} else {
								// non conflict email
								More.webTracker(request,
										"Recover Password failed: non conflict email, MESSAGE: " + strMessage,
										" Email: " + strEmail);
								Logs.showTrace("**********non conflict email, email: " + strEmail + " nCode: " + nCode
										+ " Message: " + strMessage);
		%>
		<script>
			post('error.jsp', {
				message : '4'
			});
		</script>
		<%
			}
						} else {
							// jObjMessage = null
							More.webTracker(request,
									"Recover Password failed: non conflict email, Response Code: " + nCode,
									" Email: " + strEmail);
							Logs.showTrace("**********jObjMessage = null, email: " + strEmail + " nCode: " + nCode);
		%>
		<script>
			post('error.jsp', {
				message : '4'
			});
		</script>
		<%
			}
					} else { // Email check response code != 400

						if (200 == nCode) {

							More.webTracker(request,
									"Recover Password failed: non conflict email, Response Code: " + nCode,
									" Email: " + strEmail);
							//response.sendRedirect("/more/console/signup.jsp");
		%>
		<script>
			post('error.jsp', {
				message : '5'
			});
		</script>
		<%
			} else {
							// Email check response code != 200 && code != 400
							More.webTracker(request, "Recover Password failed. Response Code: " + nCode,
									" Email: " + strEmail);
							Logs.showTrace("**********Email check response code != 200, email: " + strEmail + " nCode: "
									+ nCode);
		%>
		<script>
			post('error.jsp', {
				message : '4'
			});
		</script>
		<%
			}
					}
			
				} else {
					// FAILED to get Admin token
					More.webTracker(request,
							"Recover Password failed: token authorize failed, Email: " + strEmail,
							" TOKEN: " + strAToken + " USERID: " + nUserId);
					Logs.showTrace("**********token authorize failed, email: " + strEmail + " token: "
							+ strAToken + " UserId: " + nUserId);
%>
<script>
post('error.jsp', {
message : '4'
});
</script>
<%
}
			} else {
				// email = null
				More.webTracker(request, "Recover Password failed.", " Email: " + strEmail);
				Logs.showTrace("**********email = null :" + strEmail);
	%>
	<script>
		post('error.jsp', {
			message : '4'
		});
	</script>
	<%
		}
		} //method = post
	%>
</body>
</html>

