<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="more.*"%>
<%
    request.setCharacterEncoding("UTF-8");

			final String strEmail = request.getParameter(Mdm.Common.USER_EMAIL);
			final String strGroupId = request.getParameter(Mdm.Common.GROUP_ID);

			Mdm mdm = new Mdm();
			
			if (!mdm.conTypeDB(request, 0))
			{
			    response.sendRedirect("error.html"); //insert error page 
			    return;
			}
			
	int nResult = mdm.deleteGroup(request, strGroupId);
	 mdm.deleteGroup(request, strGroupId);
			String strResult = null;
			
			mdm.closeTypeDB(request, 0);
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


