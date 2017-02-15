<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sdk.ideas.Common"%>
<%@ page import="sdk.ideas.More"%>
<%@ page import="sdk.ideas.StringUtility"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="sdk.ideas.Logs"%>
<%
    final String strToken = request.getParameter(Common.USER_TOKEN);
    More more = new More();
    boolean bLogined = false;

    if (null != strToken && !strToken.trim().equals("null") && StringUtility.isValid(strToken))
    {
		bLogined = true;
    }

    final String strHostUrl = request.getRequestURL().toString();
    final String uri = request.getRequestURI();
    final String pageName = uri.substring(uri.lastIndexOf("/") + 1);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>MORE HOME</title>

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="/assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="/assets/css/main_2.css" />
<link rel="stylesheet" href="/assets/css/theme.css" />
<link rel="stylesheet" href="/assets/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="/assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="/assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

 <!-- PAGE LEVEL STYLES -->
    <link href="/assets/css/layout2.css" rel="stylesheet" />
       <link href="/assets/plugins/flot/examples/examples.css" rel="stylesheet" />
       <link rel="stylesheet" href="/assets/plugins/timeline/timeline.css" />
    <!-- END PAGE LEVEL  STYLES -->

<!-- JavaScript -->




<style>

/* header dropdown */
.dropdown .admin_section {
	width: 55px;
	height: 35px;
	text-align: center;
	vertical-align: middle;
	padding-top: 5px;
	border: 1px solid transparent;
	border-radius: 4px;
}

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

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<!-- HEADER SECTION -->
		<div id="top">

			<nav class="navbar navbar-inverse navbar-fixed-top"
				style="padding-top: 7px;">

				<a data-original-title="Show/Hide Menu" data-placement="bottom"
					data-tooltip="tooltip"
					class="accordion-toggle btn btn-primary btn-sm visible-xs"
					data-toggle="collapse" href="#menu" id="menu-toggle"> <i
					class="icon-align-justify"></i>
				</a>

				<!-- LOGO SECTION -->
				<header class="navbar-header">
					<div>
						<a href="group_management.jsp" class="navbar-brand"> <img
							height="55" style="padding-bottom: 7px;"
							src="/assets/img/more.png" alt="" />
						</a>
					</div>
				</header>
				<!-- END LOGO SECTION -->

				<ul class="nav navbar-top-links navbar-right"
					style="padding-top: 5px;">

					<!-- ADMIN LOGIN SECTION -->

					<li class="dropdown" style="color: #428bca;"><a
						class="dropdown-toggle admin_section" data-toggle="dropdown"
						href="#" style="color: #ffffff; background-color: #428bca;"> <i
							class="icon-user"></i>&nbsp; <i class="icon-chevron-down"></i>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a href="#"><i class="icon-user"></i> User Profile </a>
							</li>
							<li><a href="#"><i class="icon-gear"></i> Settings </a></li>
							<li class="divider"></li>
							<li><a href="login.html"><i class="icon-signout"></i>
									Logout </a></li>
						</ul></li>
					<!--END ADMIN LOGIN SECTION -->
				</ul>

			</nav>
		</div>
		<!-- END HEADER SECTION -->

		<!-- MENU SECTION -->
		<div id="left">
			<div class="media user-media well-small" style="margin-top: 12px;">
			</div>

			<ul id="menu" class="collapse">


				<li class="panel active"><a href="index.html"> <i
						class="icon-home"></i> HOME


				</a></li>



				<li class="panel "><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle"
					data-target="#component-nav"> <i class="icon-tasks"> </i> MORE
						SDK <span class="pull-right"> <i class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-default">10</span>&nbsp;
				</a>
					<ul class="collapse" id="component-nav">

						<li class=""><a href="button.html"><i
								class="icon-angle-right"></i> Buttons </a></li>
						<li class=""><a href="icon.html"><i
								class="icon-angle-right"></i> Icons </a></li>
						<li class=""><a href="progress.html"><i
								class="icon-angle-right"></i> Progress </a></li>
						<li class=""><a href="tabs_panels.html"><i
								class="icon-angle-right"></i> Tabs & Panels </a></li>
						<li class=""><a href="notifications.html"><i
								class="icon-angle-right"></i> Notification </a></li>
						<li class=""><a href="more_notifications.html"><i
								class="icon-angle-right"></i> More Notification </a></li>
						<li class=""><a href="modals.html"><i
								class="icon-angle-right"></i> Modals </a></li>
						<li class=""><a href="wizard.html"><i
								class="icon-angle-right"></i> Wizard </a></li>
						<li class=""><a href="sliders.html"><i
								class="icon-angle-right"></i> Sliders </a></li>
						<li class=""><a href="typography.html"><i
								class="icon-angle-right"></i> Typography </a></li>
					</ul></li>
				<li class="panel "><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle collapsed"
					data-target="#form-nav"> <i class="icon-pencil"></i> MORE API <span
						class="pull-right"> <i class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-success">5</span>&nbsp;
				</a>
					<ul class="collapse" id="form-nav">
						<li class=""><a href="forms_general.html"><i
								class="icon-angle-right"></i> General </a></li>
						<li class=""><a href="forms_advance.html"><i
								class="icon-angle-right"></i> Advance </a></li>
						<li class=""><a href="forms_validation.html"><i
								class="icon-angle-right"></i> Validation </a></li>
						<li class=""><a href="forms_fileupload.html"><i
								class="icon-angle-right"></i> FileUpload </a></li>
						<li class=""><a href="forms_editors.html"><i
								class="icon-angle-right"></i> WYSIWYG / Editor </a></li>
					</ul></li>

				<li class="panel"><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle"
					data-target="#pagesr-nav"> <i class="icon-table"></i> MORE MDM

						<span class="pull-right"> <i class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-info">6</span>&nbsp;
				</a>
					<ul class="collapse" id="pagesr-nav">
						<li><a href="pages_calendar.html"><i
								class="icon-angle-right"></i> Calendar </a></li>
						<li><a href="pages_timeline.html"><i
								class="icon-angle-right"></i> Timeline </a></li>
						<li><a href="pages_social.html"><i
								class="icon-angle-right"></i> Social </a></li>
						<li><a href="pages_pricing.html"><i
								class="icon-angle-right"></i> Pricing </a></li>
						<li><a href="pages_offline.html"><i
								class="icon-angle-right"></i> Offline </a></li>
						<li><a href="pages_uc.html"><i class="icon-angle-right"></i>
								Under Construction </a></li>
					</ul></li>
				<li class="panel"><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle"
					data-target="#chart-nav"> <i class="icon-bar-chart"></i>
						DASHBOARD <span class="pull-right"> <i
							class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-danger">4</span>&nbsp;
				</a>
					<ul class="collapse" id="chart-nav">



						<li><a href="charts_line.html"><i
								class="icon-angle-right"></i> Line Charts </a></li>
						<li><a href="charts_bar.html"><i class="icon-angle-right"></i>
								Bar Charts</a></li>
						<li><a href="charts_pie.html"><i class="icon-angle-right"></i>
								Pie Charts </a></li>
						<li><a href="charts_other.html"><i
								class="icon-angle-right"></i> other Charts </a></li>
					</ul></li>

				<li class="panel"><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle"
					data-target="#DDL-nav"> <i class=" icon-sitemap"></i> ABOUT <span
						class="pull-right"> <i class="icon-angle-left"></i>
					</span>
				</a>
					<ul class="collapse" id="DDL-nav">
						<li><a href="#" data-parent="#DDL-nav" data-toggle="collapse"
							class="accordion-toggle" data-target="#DDL1-nav"> <i
								class="icon-sitemap"></i>&nbsp; Demo Link 1 <span
								class="pull-right" style="margin-right: 20px;"> <i
									class="icon-angle-left"></i>
							</span>


						</a>
							<ul class="collapse" id="DDL1-nav">
								<li><a href="#"><i class="icon-angle-right"></i> Demo
										Link 1 </a></li>
								<li><a href="#"><i class="icon-angle-right"></i> Demo
										Link 2 </a></li>
								<li><a href="#"><i class="icon-angle-right"></i> Demo
										Link 3 </a></li>

							</ul></li>
						<li><a href="#"><i class="icon-angle-right"></i> Demo
								Link 2 </a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Demo
								Link 3 </a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Demo
								Link 4 </a></li>
					</ul></li>



				<li><a href="gallery.html"><i class="icon-film"></i> Image
						Gallery </a></li>
				<li><a href="tables.html"><i class="icon-table"></i> Data
						Tables </a></li>
				<li><a href="maps.html"><i class="icon-map-marker"></i>
						Maps </a></li>

				<li><a href="login.html"><i class="icon-signin"></i> Login
						Page </a></li>

			</ul>

		</div>
		<!--END MENU SECTION -->

		<!--PAGE CONTENT -->
		<div id="content">

			<div class="inner" style="min-height: 700px;">
				<div class="row">
					<div class="col-lg-12">
						<h1>Admin Dashboard</h1>
					</div>
				</div>
				<hr />






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
	
 <!-- PAGE LEVEL SCRIPTS -->
    <script src="/assets/plugins/flot/jquery.flot.js"></script>
    <script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
    <script src="/assets/plugins/flot/jquery.flot.time.js"></script>
     <script  src="/assets/plugins/flot/jquery.flot.stack.js"></script>
    <script src="/assets/js/for_index.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>