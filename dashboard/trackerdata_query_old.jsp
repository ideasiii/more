<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient"%>
<%@ page import="com.mongodb.DB"%>
<%@ page import="com.mongodb.DBCollection"%>
<%@ page import="com.mongodb.BasicDBObject"%>
<%@ page import="com.mongodb.DBObject"%>
<%@ page import="com.mongodb.DBCursor"%>
<%@ page import="com.mongodb.BasicDBList"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.regex.Pattern"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="sdk.ideas.More"%>

<%@include file="tracker_common.jsp"%>
<%
request.setCharacterEncoding("UTF-8");


SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date current = new Date();

final String strID = request.getParameter(Common.APP_ID);
 String strSD = request.getParameter(Common.START_DATE);
 String strED = request.getParameter(Common.END_DATE);
 
 if (null == strSD || (null != strSD && 0 >= strSD.length()))
 {
     strSD = dateFormat.format(current);
 }
 
 if (null == strED || (null != strED && 0 >= strED.length()))
 {
     strED = dateFormat.format(current);
 }

%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>APP Tracker Data Query | MORE</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/assets/css/main_2.css" />
<link rel="stylesheet"
	href="/assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="/assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->

<link href="/assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="/assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="/assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="/assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="/assets/plugins/colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="/assets/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="/assets/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="/assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="/assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="/assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->

<!--  JavaScript -->
<script type="text/javascript">
	function Trim(x) {
		return x.replace(/^\s+|\s+$/gm, '');
	}

	function formSubmit(formName) {
		var form = document.getElementById(formName);
		form.submit();
	}

	function checkInputData(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;
		var errMsg = '';
		var re = /\D/;
		var reDate = new RegExp(/^[0-9]{4}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$/);
		var parts = form.start_date.value.split('-');
		var sd = new Date(parts[0],parts[1]-1,parts[2]);
		parts = form.end_date.value.split('-');
		var ed = new Date(parts[0],parts[1]-1,parts[2]);

		if (Trim(form.app_id.value) == '')
			errMsg += "Please enter an app ID !!\n";
		else {
			if (re.test(Trim(form.app_id.value))) {
				errMsg += "App ID must contain only numeric characters !!\n";
			}
		}

		if (Trim(form.end_date.value) != '') {
			if (!reDate.test(form.end_date.value))
				errMsg += "Wrong date format !!\n";
		}
		
		if (Trim(form.start_date.value) != '') {
			if (!reDate.test(form.start_date.value))
				errMsg += "Wrong date format !!\n";
					else{
						if(sd > ed)
					errMsg += "End date must be after start date !!\n";
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

<style>

/* logo section */
.header-angle {
	position: relative;
	left: 30px;
	right: 80px;
}

.logo {
	/*margin-left: 30%;*/
	padding: 7px;
	position: relative;
	z-index: 9;
}
/* end logo section */

/* login admin section */
.super-header {
	/* position: relative;*/
	z-index: 1;
	background-color: #428bca;
	padding: 0 1em;
	/* overflow: hidden;*/
	text-align: right; label { color : #fff;
	font-size: 0.9em;
	padding: 0.4em;
	line-height: 1.1;
}

}
.super-header .super-header-ul {
	text-align: right;
	margin-bottom: 0;
}

.super-header .super-header-li {
	color: #fff;
	display: inline-block; //
	vertical-align: middle;
	/*padding-right: 10px;*/
	&:
	first-child
	{
	padding-right
	:
	1.7em;
}

}
.super-header .super-header-a {
	color: #fff;
	display: inline-block;
	font-size: 1.1em;
	font-style: normal;
	text-decoration: none;
	line-height: 1.1;
	padding: 0.4em 1.3em;
	position: relative;
	&:
	hover
	{
	background-color
	:
	transparent;
}

&
:before {
	/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#000000+0,000000+100&1+0,0+99 */
	content: '';
	background: -moz-linear-gradient(-45deg, rgba(61, 70, 71, 0.3) 0%,
		rgba(61, 70, 71, 0) 99%, rgba(61, 70, 71, 0) 100%);
	background: -webkit-linear-gradient(-45deg, rgba(61, 70, 71, 0.3) 0%,
		rgba(61, 70, 71, 0) 99%, rgba(61, 70, 71, 0) 100%);
	background: linear-gradient(135deg, rgba(61, 70, 71, 0.3) 0%,
		rgba(61, 70, 71, 0) 99%, rgba(61, 70, 71, 0) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3d4647',
		endColorstr='#003d4647', GradientType=1);
	display: block;
	position: absolute;
	width: 400px;
	height: 300px;
	transform: rotate(-30deg);
	top: 0;
	left: -140px;
	z-index: -1;
}

}
/* end login admin section */

/* menu section */
.menu {
	margin-bottom: 0;
	min-height: auto;
	border: 0px solid transparent;
}

.menu-header {
	float: none;
	width: 100%;
	padding-left: 100px;
	display: inline-block;
	position: relative;
	z-index: 1;
	vertical-align: baseline;
	margin-bottom: -4px;
	/*	padding-top: 4px;*/
	height: auto;
	line-height: 2;
}

.menu-header .menu-header-li {
	width: 25%;
	padding-top: 1rem;
	padding-bottom: 1rem;
	float: left;
	position: relative;
	display: inline-block;
}

.menu-header .menu-header-li .menu-header-a {
	color: white;
	text-transform: uppercase;
	text-decoration: none;
	display: inline-block;
	font-style: normal;
	font-size: 1em;
	letter-spacing: 0.05em;
	position: relative;
	/*	margin-right: -1px;*/
	width: 100%;
}

.menu-header .menu-header-li:hover .dropdown-menu-container {
	color: #46b8da;
	display: block;
}

.menu-header .menu-header-li .menu-header-a:hover {
	color: #9fd256; /*#46b8da;*/
	display: block;
	font-weight: bold;
	background-color: rgba(86, 99, 100, 1);
	background-image: radial-gradient(#000, rgba(86, 99, 100, 1) 70%);
	display: block;
}

.gradient-blue {
	background-color: white;
	background-image: linear-gradient(to left, #428bca 45%, white 90%);
}

.gradient-gray {
	background-color: transparent;
	background-image: linear-gradient(to left, rgba(86, 99, 100, 0.89) 70%,
		white 90%);
}
/* end menu section */

/* menu dropdown */
.dropdown-menu-container {
	position: absolute;
	display: none; /*test*/
	/*	visibility: hidden;*/
	/*	opacity: 0;*/
	/*	pointer-events: none;*/
	border-radius: 0;
	background-color: rgba(86, 99, 100, 0.85);
	margin-top: -1px !important;
	width: 100%;
	border-left: none;
	border-right: none;
	border-bottom: none;
	min-width: initial;
	top: 100%;
	left: 0;
	z-index: 1000;
	/*	float: left; */
	padding: 0;
	margin: 2px 0 0;
	list-style: none;
	font-size: 14px;
	text-align: center;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	background-clip: padding-box;
}

.dropdown-menu-li {
	padding: 12px 0px; //
	text-align: center;
	white-space: normal;
	clear: both;
	position: relative;
	margin-right: -1px;
	cursor: pointer;
}

.dropdown-menu-li a {
	text-decoration: none;
	text-transform: uppercase;
	color: #fff;
	font-weight: normal;
	line-height: 1.42857;
	font-family: "texgyreadventor", sans-serif;
	font-style: normal;
	font-size: 1em;
	/*letter-spacing: 0.05em;*/
}

.dropdown-menu-li:hover {
	background-color: rgba(86, 99, 100, 0);
	background-image: radial-gradient(white, rgba(86, 99, 100, 0) 65%);
}

.dropdown-menu-li:focus, .dropdown-menu-li:active, .dropdown-menu-li.active
	{
	background-color: rgba(86, 99, 100, 0);
	background-image: rgba(86, 99, 100, 0);
}

.dropdown-menu-li:hover a {
	color: #357ebd;
	font-weight: bold;
	text-decoration: none;
}

#3level-sdk {
	padding: 12px 0px; //
	text-align: center;
	white-space: normal;
	clear: both;
	position: relative;
	margin-right: -1px;
	cursor: pointer;
	display: inline-block;
}

#3level-sdk:hover .sub-menu-container {
	color: #46b8da;
	display: block;
}

.sub-menu-container {
	position: absolute;
	display: none; /*test*/
	border-radius: 0;
	background-color: rgba(86, 99, 100, 0.85);
	margin-top: -1px !important;
	width: 100%;
	border-left: none;
	border-right: none;
	border-bottom: none;
	min-width: initial;
	top: 100%;
	left: 0;
	z-index: 1000;
	/*	float: left; */
	padding: 0;
	margin: 2px 0 0;
	list-style: none;
	font-size: 14px;
	text-align: center;
	box-shadow: 0 6px 12px rgba(0, 0, 0, 0.175);
	background-clip: padding-box;
}

.sub-menu-li {
	padding: 12px 0px; //
	text-align: center;
	white-space: normal;
	clear: both;
	position: relative;
	margin-right: -1px;
	cursor: pointer;
	display: inline-block;
}

.sub-menu-li a {
	text-decoration: none;
	text-transform: uppercase;
	color: #fff;
	font-weight: normal;
	line-height: 1.42857;
	font-family: "texgyreadventor", sans-serif;
	font-style: normal;
	font-size: 1em;
	/*letter-spacing: 0.05em;*/
}

.sub-menu-li:hover {
	background-color: rgba(86, 99, 100, 0);
	background-image: rgba(86, 99, 100, 0);
}

.sub-menu-li:hover a {
	color: black;
	font-weight: bold;
	text-decoration: none;
}
/* end menu dropdown */

/* text background */
.container {
	margin-right: auto;
	margin-left: auto;
	padding-left: 5px;
	padding-right: 5px;
}

.silk-white {
	background-color: rgba(255, 255, 255, 0.50);
	background-image: radial-gradient(circle at top right, white 10%, #546263 90%);
}

.silk-white-green {
	background-color: rgba(255, 255, 255, 0.50);
	background-image: radial-gradient(circle at top right, white 10%, #9fd256 90%);
}

.silk-grey {
	background-color: rgba(255, 255, 255, 0.50);
	background-image: radial-gradient(circle at top left, #546263 10%, white 90%);
}

.container-text-r {
	padding: 6rem 8rem;
	/*	padding-left:10rem;*/
	text-align: right;
}

.container-text-c {
	padding: 6rem 8rem;
	/*	padding-left:10rem;*/
	text-align: center;
}

.container-text-l {
	padding: 6rem 8rem;
	/*	padding-left:10rem;*/
	text-align: left;
}

@media ( min-width : 768px) {
	.full-height-s {
		padding-top: 80px;
		min-height: 500px;
	}
	.full-height-m {
		padding: 150px 0px;
		min-height: 500px;
	}
}

@media ( min-width : 992px) {
	.full-height-s {
		padding: 175px 0px;
		min-height: 500px;
	}
	.full-height-m {
		padding: 182px 0px;
		min-height: 500px;
	}
}

@media ( min-width : 1248px) {
	.full-height-s {
		padding: 80px 0px;
		min-height: 500px;
	}
	.full-height-m {
		padding: 190px 0px;
		min-height: 500px;
	}
}

@media ( min-width : 1360px) {
	.full-height-s {
		padding: 80px 0px;
		min-height: 455px;
	}
	.full-height-m {
		padding: 190px 0px;
		min-height: 500px;
	}
}

@media ( min-width : 1420px) {
	.full-height-s {
		padding: 130px 0px;
		min-height: 500px;
	}
	.full-height-m {
		padding: 200px 0px;
		min-height: 500px;
	}
}

@media ( min-width : 1650px) {
	.full-height-s {
		padding: 175px 0px;
		min-height: 500px;
	}
	.full-height-m {
		padding: 315px 0px;
		min-height: 500px;
	}
}

.full-height-outer {
	position: relative;
	overflow: hidden;
}

.bg-grey {
	background: #546263;
}

.bg-white {
	background: #fff;
}

.bg-blue {
	background: #357ebd;
}

.bg-green {
	background: #9fd256;
}

.bg-orange {
	background: #F08800;
}

.bg-purple {
	background: #a264e7;
}

.vline-right-orange {
	border-right: 10px solid #F08800;
	padding-right: 10px;
}

.vline-right-green {
	border-right: 10px solid #9fd256;
	padding-right: 10px;
}

.vline-right-blue {
	border-right: 10px solid #428bca;
	padding-right: 10px;
}

.photo {
	border-radius: 5px;
	visibility: hidden;
	z-index: 1005;
}

@media ( min-width : 992px) {
	.photoframe {
		position: absolute;
		top: 110px;
		right: 65%;
		z-index: 1000;
		background-color: #F08800;
		text-align: center;
		border: 5px solid #F08800;
	}
	.photo {
		border-radius: 5px;
		visibility: visible;
		z-index: 1005;
	}
}

/* end text background */

/* footer */
.footer {
	width: 100%;
	background: #E0E0E0;
}

.footer .link_area {
	background: #F0F0F0;
	text-align: right;
	padding: 30px 0;
}

.footer .link_area .link_group {
	display: inline-block;
	vertical-align: top;
	margin: 10px 25px;
}

.footer .link_area .link_group .link {
	text-align: left;
	line-height: 1em;
}

.footer .link_area .link_group .link a {
	color: #000;
}

.footer .link_area .link_group .link a:hover {
	text-decoration: underline;
}

.footer .copyright_area {
	text-align: right;
	margin-right: 20px;
	height: 40px;
	line-height: 60px;
	color: #9D9D9D;
}
/* end footer */
</style>

</head>

<body>

<%@include file="menu.jsp"%>

	<div class="row" style="margin: 10%;">
		<div class="col-lg-12" style="padding-left: 25%; padding-right: 25%;">
			<div class="box">
				<header>
					<h5>
						<i class="fa fa-search fa-1x" aria-hidden="true"></i> Raw Data
						Query
					</h5>
					<div class="toolbar">
						<div class="btn-group"></div>
					</div>
				</header>
				<div class="body">
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default title"
								style="padding: 30px; padding-left: 15%; padding-right: 15%;">
								<form action="trackerdata_result_old.jsp" role="form"
									name="formQueryTrackerData" id="formQueryTrackerData">

									<div class="form-group">
										<label>App ID</label> <input class="form-control"
											name="<%=Common.APP_ID%>" />
										<p class="help-block" style="color: #b94a48;">Notification:
											Group name cannot be changed.</p>
									</div>

									<div class="form-group">
										<dl>
											<dd style="text-align: left;">
												<label for="dp3">Start Date</label>
												<div>
													<input type="text" class="form-control"
														name="<%=Common.START_DATE%>"
														data-date-format="yyyy-mm-dd" id="dp3" />
												</div>
											</dd>
										</dl>

										<dl>
											<dd style="text-align: left;">
												<label for="dp4">End Date</label>
												<div>
													<input type="text" class="form-control"
														name="<%=Common.END_DATE%>" data-date-format="yyyy-mm-dd"
														id="dp4" />
												</div>
											</dd>
										</dl>
									</div>
								</form>
								<br>
								<div style="text-align: center;">

									<button type="button" class="btn btn-primary" title="Query"
										onClick="checkInputData('formQueryTrackerData')">
										<span class="sr-only">Query </span>Query
									</button>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>





	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->


	<!-- PAGE LEVEL SCRIPT-->
	<script src="/assets/js/jquery-ui.min.js"></script>
	<script src="/assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script
		src="/assets/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="/assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="/assets/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
	<script src="/assets/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script src="/assets/plugins/validVal/js/jquery.validVal.min.js"></script>
	<script src="/assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="/assets/plugins/daterangepicker/moment.min.js"></script>
	<script src="/assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="/assets/plugins/timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="/assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
	<script
		src="/assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>
	<script src="/assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="/assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
	<script src="/assets/js/formsInit.js"></script>
	<script>
		$(function() {
			formInit();
		});
	</script>

	<!--END PAGE LEVEL SCRIPT-->

</body>
</html>
<%
    more = null;
%>

