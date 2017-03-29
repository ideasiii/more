<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>

<%@include file="../../home/console/loginValid.jsp"%>
<%@include file="tracker_common.jsp"%>
<%

    /** Web Tracker **/
			More.webTracker(request, "load page", null);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APP Tracker Data Analysis | MORE</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet" href="/more/css/more_style.css" />
<link rel="stylesheet" href="/more/css/bootstrap_2.css" />
<link rel="stylesheet" href="/more/css/main_2.css" />
<link rel="stylesheet" href="/more/css/theme.css" />
<link rel="stylesheet" href="/more/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="/more/css/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="/more/css/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->


<!--  JavaScript -->
<script type="text/javascript">
	function Trim(x) {
		return x.replace(/^\s+|\s+$/gm, '');
	}

	function formSubmit(formName) {
		var form = document.getElementById(formName);
		form.submit();
	}

	function checkAppID(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;
		var errMsg = '';
		var re = /\D/;
		var app = form.app_id.value

		if (Trim(app) == '')
			errMsg += "Please enter an app ID !!\n";
		else {
			if (re.test(Trim(app))) {
				errMsg += "App ID must contain only numeric characters !!\n";
			}
		}

		if (errMsg == '') {
			form.submit();
			return true;
		}

		alert(errMsg);
		return false;
	}
</script>



</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="../home/console/menu.jsp"%>


		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro" class="landscape-bg"
					style="background-image: url('/assets/img/tech2_1920.jpg'); min-height: 100%;">
					<div class="spotlight" style="min-height: 800px;">
						<div class="panel-body" style="padding: 200px 25.5%;">

							<div class="appIDQuery">

								<div>
									<p class="panel-title bg-blue1">
										<i class="icon-circle light-blue1"></i> Analyze App Tracker
										Data
									</p>
								</div>

								<div class="panel-body">

									<form action="tracker_dashboard.jsp" role="form"
										name="formAppIDInput" id="formAppIDInput">
										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label class="col-lg-4">Enter Your App ID</label> <input
													class="form-control" name="app_id" />
											</div>
										</div>
										<button type="button" class="btn btn-primary"
											onClick="checkAppID('formAppIDInput')">Confirm</button>

									</form>
								</div>
							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
		<!--END PAGE CONTENT -->

	</div>
	<!--END MAIN WRAPPER -->

	<!--FOOTER -->
	<footer class="footer">
	<div class="link_area">
		<dl class="link_group">
			<dd class="link">
				<a href="">Document</a>
			</dd>
		</dl>
		<dl class="link_group">
			<dd class="link">
				<a href="">Privacy Policy</a>
			</dd>
		</dl>
		<dl class="link_group">
			<dd class="link">
				<a href="">Contact Us</a>
			</dd>
		</dl>
		<div class="copyright_area">Copyright ©</div>
	</div>
	</footer>
	<!--END FOOTER -->


	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

</body>
</html>