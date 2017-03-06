<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="more.*"%>


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
	<div class="col-lg-12 title" >
		<h2>Loading</h2>
		<p>Please Wait...</p>
		<img  src="assets/img/loading.gif" width="600px;">
	</div>
</div>

</body>

<%
    request.setCharacterEncoding("UTF-8");

			final String strEmail = request.getParameter(Mdm.Common.USER_EMAIL);
			final String strName = request.getParameter(Mdm.Common.GROUP_NAME);
			final String strAccount = request.getParameter(Mdm.Common.ACCOUNT);
			final String strPassword = request.getParameter(Mdm.Common.PASSWORD);
			final String strMaximum = request.getParameter(Mdm.Common.MAXIMUM);
			final String strPermission = request.getParameter(Mdm.Common.PERMISSION);
			String strUserId = null;
	
			if (null != strPermission && strPermission.trim().equals("android"))
				strUserId = request.getParameter("userId_Android");

			Mdm mdm = new Mdm();

			if (!mdm.conDB(request))
			{
				response.sendRedirect("error.html"); //insert error page 
				return;
			}
			
			if (!mdm.conTypeDB(0))
			{
			    response.sendRedirect("error.html"); //insert error page 
			    return;
			}
			
			int nResult = mdm.insertpGroupAdd(strName, strAccount, strPassword, strMaximum, strUserId);
			
			mdm.closeTypeDB(0);
			mdm.closeDB();
			mdm = null;
%>

<!-- Form -->
<form action="group_management.jsp" method="post" name="FormHome"
	id="FormHome">
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
</html>