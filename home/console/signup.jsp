<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>

<%
    final String strHostUrl = request.getRequestURL().toString();

			/** Web Tracker **/
			More.webTracker(request, "load page", null);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>SignUp | MORE</title>
<link rel="icon" href="/assets/img/more.png">

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

<!-- PAGE LEVEL STYLES -->
<link
	href="/more/css/plugins/jquery-steps-master/demo/css/jquery.steps2.css"
	rel="stylesheet" />
<!-- END PAGE LEVEL STYLES -->

<!-- JavaScript -->
<script src="js/validation.js"></script>
<script type="text/javascript">
	function showBtnV(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;

		if (formname == "formSignUp") {
			document.getElementById("btnA").style.display = "none";
			document.getElementById("btnV").style.display = "block";
		}
	}
</script>

<script language="javascript">
	var contentEditWin = null;
	var w = window.screen.width;
	var h = window.screen.height;
	var width = 0;
	var height = 0;
	var left = 0;

	function addCanned(email) {
		var email = document.getElementById("inputEmail").value;
		var url = "pVerification.jsp?inputEmail=" + email;
		var errMsg = '';
		reg = /^[^\s]+@[^\s]+\.[^\s]{2,3}$/;

		if (Trim(email) == '') {
			errMsg += "Please enter a valid E-mail !!\n";

		} else {

			if (!reg.test(Trim(email))) {
				errMsg += "Wrong E-mail format !!\n";
			}
		}

		//alert(email);
		//alert(url);
		
		if (errMsg == '') {
			contentEditWin = window.open(url,'_blank','toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,left=0, top=0, width=10000, height=10000, visible=none','');
			//contentEditWin = window.open(url, 'run', locate);
			checkChildWin();

			return true;
		}
		alert(errMsg);
		return false;
	}

	function checkChildWin() {
		if (null != contentEditWin && contentEditWin.closed) {
			contentEditWin = null;
			//window.location.reload()
			var errMsg = '';
			var email = getCookie("email");
			var respCode = getCookie("error")
			var message = getCookie("message")
		//	alert(email);
		//	alert(respCode);
			
			if (respCode == '200') {
				document.getElementById("btnA").style.display = "block";
				document.getElementById("btnV").style.display = "none";
			} else {

				if (respCode == '400') {
					errMsg += message ;

					alert(errMsg);
				}
			}
			document.cookie = "email=";
			document.cookie = "error=";
			document.cookie = "message=";
			//email = getCookie("email");
		//	alert(email);
			return;
		}
		setTimeout("checkChildWin()", 10)
	}


	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ') {
				c = c.substring(1);
			}
			if (c.indexOf(name) == 0) {
				return c.substring(name.length, c.length);
			}
		}
		return "";
	}
</script>


</head>

<body class="padTop53">


	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="menu.jsp"%>
		<%--
		    String strAccountV = "";

					ArrayList<String> listEmailAccount = new ArrayList<String>();
					int nACount = more.queryMemberAccountList(request, listEmailAccount);

					for (int i = 0; i < listEmailAccount.size(); ++i) {
						strAccountV = strAccountV + listEmailAccount.get(i);
						if (i != (listEmailAccount.size() - 1)) {
							strAccountV += ',';
						}
					}
		--%>

		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="padding: 0;">
				<div id="intro" class="silk-grey full-height-s full-height-outer"
					>

					<div class="container">
						<div class="row container-text-c" style="padding: 0.6rem 8rem;">

							<div class="text-center" style="padding: 2rem 0;">
								<h2 style="font-weight: bold;">Sign Up For MORE Account</h2>
							</div>

							<form name="formSignUp" id="formSignUp" method="post">
					<!--			<input name="accountList" id="accountList"
									value="<%--=strAccountV--%>" type="hidden"> -->
								<input name="agreeVersion" id="agreeVersion"
									value="P-X-X" type="hidden">
									
								<div id="wizard">
									<h2>Agreement</h2>
									<section style="overflow-y: scroll;">
									<div style="padding-left: 15px; text-align: left;">
										<p style="text-align: justify; color: gray;">
											<b>Notification and Letter of Consent for Collection,
												Processing and Use of Personal Information<br /> <span
												style="color: #b94a48;">(Version: P-X-X)</span>
											</b> <br /> <br /> According to the R.O.C. Personal
											Information Protection Act and the internal
											policy/regulations of Institute for Information Industry
											(hereinafter referred to as “III”), III is obligated to make
											the following notification known to you before you provide
											personal information to III. Please read it carefully. <br />
											<br />1. Purposes and Categories of Personal Information to
											be Collected For the purpose of carrying out III’s business,
											activity or project, the purpose of providing service,
											internal administrative management or reporting to the
											competent authority, the purpose complying with the
											Endowment, or the purpose of sending III’s or industry
											relevant information, III needs you to provide these
											categories of personal information: name, contact information
											(such as phone number, title, e-mail address, residential or
											office address), ID card number, or other information which
											may be used to identify you directly or indirectly. <br /> <br />
											Note: You may choose, at any time in the future, not to
											receive any promotional information from III by clicking the
											link provided in the promotional message. <br /> <br /> 2.
											Time Period, Area, Target and Way of the Use of Personal
											Information Unless the purposes of use relating to
											international businesses or activities, your personal
											information will be used solely by III in a reasonable way in
											the territory of the Republic of China to the extent
											necessary to implement the purposes of collection until the
											purposes of collection prescribed above is fulfilled. <br />
											<br /> 3. Your Rights with regard to Personal Information
											Provided You may exercise the following rights in pursuant to
											the rules of the activities/project or by submitting your
											inquiry/request on our website (http://www.iii.org.tw/) at
											“Application for Exercising Rights with Regard to Personal
											Information” page: <br /> (1) any inquiry and request for a
											review of the personal information;<br /> (2) any request to
											make duplications of the personal information;<br /> (3) any
											request to supplement or correct the personal information;<br />
											(4) any request to discontinue collection, processing or use
											of the personal information; <br /> (5) any request to
											delete the personal information.<br /> <br /> 4. The
											Influence on Your Rights and Interests while You Choose not
											to Provide Your Personal Information<br /> If you provide
											incorrect personal information or choose not to provide your
											personal information to III, III may not be able to provide
											you with services relating to the purposes prescribed above.
											<br /> <br /> 5. You understand that this document complies
											with the R.O.C. Personal Information Protection Act and
											relating regulations, and you agree that III keeps this
											document for further checking. <br /> <br />

										</p>

										<div class="checkbox">
											<input type="checkbox" id="ch1" /> <label
												class="text-danger" for="ch1">I have read and
												understood the above notification.</label>
										</div>
										<div class="checkbox">
											<input type="checkbox" id="ch2" /> <label
												class="text-danger" for="ch2">I agreed that III may
												collect, process and use my personal information for the
												purposes of collection prescribed above.</label>
										</div>

									</div>
									</section>

									<h2>Personal</h2>
									<section style="width: 100%; padding: 25px 10rem;">

									<div class="form-group">
										<label>Name</label> <input type="text" name="inputName"
											id="inputName" class="form-control" />
									</div>
									<div class="form-group">
										<label>Organization</label> <input type="text"
											name="inputCompany" class="form-control" />
									</div>
									<div class="form-group">
										<label>Phone</label> <input type="text" name="inputPhone"
											class="form-control" />
									</div>
									<div class="form-group">
										<label>Purpose</label> <input type="text" name="inputPurpose"
											class="form-control" />
										<p class="help-block"></p>
									</div>
									</section>

									<h2>Login</h2>
									<section style="width: 100%; padding: 25px 8rem;">

									<div class="form-group">
										<label style="margin-left: 5.5rem;">E-mail Account</label>
										<button id="btnV" type="button"
											class="btn btn-xs btn-grad btn-default" style="float: right;"
											onclick="addCanned()">Verification</button>
										<button id="btnA" type="button" class="btn btn-xs btn-success"
											style="display: none; float: right;">Available</button>

										<input type="text" name="inputEmail" id="inputEmail"
											class="form-control" onchange="showBtnV('formSignUp')" />



										<p class="help-block" style="color: #b94a48;">Notification:
											E-mail account cannot be changed.</p>
									</div>
									<div class="form-group">
										<label>Password</label> <input type="password"
											name="inputPassword" class="form-control" />
										<p class="help-block">(Must be less than 20 letters in
											alphanumeric format.)</p>
									</div>
									<div class="form-group">
										<label>Retype Password</label> <input type="password"
											name="inputPassword2" class="form-control" /> <br>
									</div>
							<!--  		<div class="form-group">
										<label>Agreement Version</label> <input type="text"
											name="inputAgreeV" class="form-control" />
										<p class="help-block"></p>
									</div>
							-->

									</section>
								</div>
							</form>



						</div>
					</div>

				</div>
			</div>
		</div>
		<!--END PAGE CONTENT -->



	</div>
	<!--END MAIN WRAPPER -->

	<%@include file="footer.jsp"%>
	

	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/flot/jquery.flot.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.stack.js"></script>
	<script
		src="/assets/plugins/jquery-steps-master/lib/jquery.cookie-1.3.1.js"></script>
	<script
		src="/assets/plugins/jquery-steps-master/build/jquery.steps2.js"></script>
	<script src="/assets/js/WizardInit.js"></script>
	<SCRIPT type="text/javascript">
		showBtnV();
	</SCRIPT>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>

<%
    more = null;
%>