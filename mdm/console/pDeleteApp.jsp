
<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="more.*"%>
<%
    request.setCharacterEncoding("UTF-8");

			final String strEmail = request.getParameter(Mdm.Common.USER_EMAIL);
			final String strGroupId = request.getParameter(Mdm.Common.GROUP_ID);
			final String strAPKFileName = request.getParameter(Mdm.Common.APK_FILE_NAME);

			Mdm mdm = new Mdm();
			
			if (!mdm.conTypeDB(0))
			{
			    response.sendRedirect("error.html"); //insert error page 
			    return;
			}
			
	int nResult = mdm.deleteApp(strGroupId, strAPKFileName);
	 mdm.deleteApp(strGroupId, strAPKFileName);
	 
			String strResult = null;
			
			mdm.closeTypeDB(0);
			mdm = null;
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>MDM PROGRESS</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />


<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="assets/css/countdown.css" />

<!-- JavaScript -->
<script src="js/formverify.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div class="row">
		<div class="col-lg-12 title">
			<h2>Loading</h2>
			<p>Please Wait...</p>
			<img src="assets/img/loading.gif" width="600px;">
		</div>
	</div>

	<form action="group_management.jsp" method="post"
		name="FormHome" id="FormHome">
		<input name="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
			value="<%=strEmail%>" />
	</form>
	<%
	if (nResult == Mdm.MDM_DB_ERR_SUCCESS) {
	%>
	<script>
		formSubmit('FormHome');
	</script>
	<%
	}
	%>
</body>
</html>
