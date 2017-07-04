<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Map"%>
<%@ page import="more.*"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="java.net.URLEncoder"%>

<%@include file="loginValid.jsp"%>

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
<script type="text/javascript">
function post(path, params, method) {
    method = method || "post"; 

    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for(var key in params) {
        if(params.hasOwnProperty(key)) {
            var hiddenField = document.createElement("input");
            hiddenField.setAttribute("type", "hidden");
            hiddenField.setAttribute("name", key);
            hiddenField.setAttribute("value", params[key]);

            form.appendChild(hiddenField);
         }
    }

    document.body.appendChild(form);
    form.submit();
}
</script>

</head>
<body>

	<%
	    String strEmail = (String) session.getAttribute("Email");
	    String strClientId = (String) session.getAttribute("Client ID");

	    String httpsURL = "https://ser.kong.srm.pw/dashboard/token/authorize";

	    JSONObject jobj = new JSONObject();
	    jobj.put("email", strEmail);
	    jobj.put("clientId", strClientId);

	    HttpsClient httpsClient = new HttpsClient();
	    String strAuthResult = httpsClient.sendPost(httpsURL, jobj.toString());

	    JSONObject jObjAuth = new JSONObject(strAuthResult);
	    int nUserId2 = 0;
	    String strAToken = null;

	    if (null != jObjAuth && jObjAuth.has("accessToken"))
	    {
			strAToken = jObjAuth.getString("accessToken");
	    }

	    if (null != jObjAuth && jObjAuth.has("userId"))
	    {
			nUserId2 = jObjAuth.getInt("userId");
	    }
	    if (null != strAToken && 0 < nUserId2)
	    {

		%>
		<script>
		post('testpost.jsp', {accessToken: '<%=strAToken%>'});
		</script>
		<%
		
	    }
	%>

</body>
</html>