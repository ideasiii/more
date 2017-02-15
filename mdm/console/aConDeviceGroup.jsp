<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="mdmjava.*"%>


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
<link rel="stylesheet" href="assets/css/main_2.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- JavaScript -->
<script src="js/controller_list.js"></script>
<script>
	function showBtnReturn(formName,conId, dAct) {
		var form = document.getElementById(formName);
		var formname = form.name;

		if (formname == "formLoader") {
			document.get.ElementById("formMessage").style.display = "none";
			document.getElementById("formLoader").style.display = "block";
		}
		if (formname == "formMessage") {
			document.getElementById("formLoader").style.display = "none";
			document.getElementById("formMessage").style.display = "block";
		}
		
		showConName(conId, dAct);
	}
</script>
<script>
	function showConName(conId, dAct) {
		var conName = '';
		switch (conId){
		case '1': conName = 'Camera';
		break;
		case '2': conName = 'Screen Lock';
		break;
		case '3': conName = 'Mute';
		break;
		}
		document.getElementById("controlId").innerHTML = conName;
		document.getElementById("dAction").innerHTML = dAct;
	}
	
	function sleep(formName, conId, dAct)
	{
		window.setTimeout(function(){showBtnReturn(formName, conId, dAct);},3000);
	}
</script>


</head>
<body>

	<form name="formLoader" id="formLoader">
		<div class="row">
			<div class="col-lg-12" style="text-align: center;">
				<img src="assets/img/loader1.gif" width="600px;">
			</div>
		</div>
	</form>

	<form name="formMessage" id="formMessage" style="display:none;">
		<div class="row" style="margin: 10%;">
			<div class="col-lg-12"
				style="text-align: center; padding-left: 30%; padding-right: 30%;">
				<div class="box">
					<header>
						<h5>
							<i class="fa fa-info-circle fa-1x" aria-hidden="true"></i>
							Message
						</h5>
						<div class="toolbar">
							<div class="btn-group"></div>
						</div>
					</header>
					<div class="body">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default title" style="padding: 15px;">

									<span id="controlId"></span><span> is </span><span id="dAction"></span>.
									<p>Please click the button below to return.</p>
									<br>
									<button type="button" class="btn btn-primary"
										onClick="formSubmit('FormHome')">Device Management</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
	<%
	    request.setCharacterEncoding("UTF-8");

				final String strGroupId = request.getParameter(Common.GROUP_ID);
				final String strControlId = request.getParameter("control_id");
				final String strAction = request.getParameter("action");
				final String strInput = request.getParameter(Common.INPUT);
				final String strCmmdFrom = request.getParameter("cmmd_from");

				Mdm mdm = new Mdm();

				if (!mdm.conTypeDB(0)) {
					response.sendRedirect("error.html"); //insert error page 
					return;
				}

				Mdm.DeviceData deviceData = null;

				ArrayList<Mdm.DeviceData> listDevice = new ArrayList<Mdm.DeviceData>();
				int nDCount = mdm.queryDevice(strGroupId, listDevice);
				int nResult = Mdm.MDM_DB_ERR_FAIL;

				if (0 < nDCount) {
					String strJobSeq = Mdm.generateShortUuid();

					for (int i = 0; i < listDevice.size(); ++i) {
						deviceData = listDevice.get(i);
						nResult = mdm.insertControllerJob(strControlId, strJobSeq, strCmmdFrom, deviceData.mac_address);
						if (Mdm.MDM_DB_ERR_SUCCESS != nResult) {
							break;
						}
					}

					if (nResult == Mdm.MDM_DB_ERR_SUCCESS) {

						nResult = mdm.insertActionDevice(strJobSeq, strControlId, strAction, strInput);
					}

				}

				mdm.closeTypeDB(0);
				mdm = null;
	%>
	
  
	<script>
		showBtnReturn('formLoader');
	</script>

	<%
	if (nResult == Mdm.MDM_DB_ERR_SUCCESS) {    
	%>
	<script type="text/javascript">sleep('formMessage','<%=strControlId%>','<%=strAction%>');</script>
	
	<%
	   
	    
	    } else {
	%>
	<script>
		formSubmit('Error');
	</script>
	<%
	    }
	%>

	<form action="device_management.jsp" method="post" name="FormHome"
		id="FormHome">
		<input name="<%=Common.GROUP_ID%>" type="hidden"
			value="<%=strGroupId%>" />
	</form>
	<form action="error.jsp" method="post" name="Error" id="Error">
	</form>

</body>
</html>


