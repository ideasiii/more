<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sdk.ideas.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>

<%
    final String strHostUrl = request.getRequestURL().toString();

    /** Web Tracker **/
    More.webTracker(request, "load page", null);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="MORE">
<meta name="description" content="MORE">
<title>SDK ios version | MORE</title>

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
<link rel="stylesheet" href="/assets/css/login.css" />
<link rel="stylesheet" href="/assets/plugins/magic/magic.css" />
<!-- END PAGE LEVEL STYLES -->

<!-- JavaScript -->
<script src="js/validation.js"></script>


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

.dropdown-menu-li:hover a {
	color: #357ebd;
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

.bg-deepgreen {
	background: #90c113;
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
	background: rgba(86, 99, 100, 1);
}

.footer .link_area {
	background: rgba(86, 99, 100, 1);
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
	color: #fff;
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

/* SDK */
.landscape-bg {
	background-size: cover;
	background-attachment: fixed;
	background-repeat: no-repeat;
}

.block-list {
	display: block;
}

#block-list ul {
	list-style: none;
	margin: 0;
	min-height: 0;
	overflow: hidden;
}

#block-list li {
	float: left;
	margin: 10px;
}

#block-list div {
	left: 0;
	width: 220px;
}

.block-list .title {
	font-size: 16px;
	padding: 8px 10px;
	height: 36px;
	vertical-align: middle;
	margin: 0px;
	/*color:#000;*/
}

.block-list .panel-body {
	font-size: 16px;
	height: 120px;
	vertical-align: middle;
	display: inline-block;
	background-color: rgba(255, 255, 255, 0.3)
}

.block-list .panel-content {
	display: block;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	/*	font-weight:bold;*/
	font-size: 18px;
	width: 112px;
	text-decoration: none;
	text-align: center;
	color: #000;
	position: absolute;
	padding: 8px 0px;
	margin-top: 8px;
}

.block-list .panel-content:hover {
	background-color: transparent;
	background-image: radial-gradient(rgba(179, 210, 83, 1),
		rgba(255, 255, 255, 0) 70%);
}

.block-list .text-style2 {
	font-family: "Great Vibes", cursive;
	font-style: italic;
	/*color: #053463;*/
}

.spotlight {
	background-color: transparent;
	background-image: radial-gradient(rgba(110, 110, 110, 0.4),
		rgba(255, 255, 255, 0) 90%);
}

.block-list .spotlight {
	background-color: transparent;
	background-image: radial-gradient(rgba(255, 255, 255, 0.7),
		rgba(255, 255, 255, 0) 70%);
}

.block-list .spotlight2 {
	background-color: rgba(255, 255, 255, 0);
	background-image: linear-gradient(to right, rgba(255, 255, 255, 0),
		rgba(255, 255, 255, 0.7) 50%, rgba(255, 255, 255, 0));
}

.white-text {
	color: white;
}

.bg-blue1 {
	background-color: #3888d7;
}

.blue1 {
	color: #3888d7;
}

.light-blue1 {
	color: #0d3d6d;
}

.block-list .bg-blue2 {
	background-color: #39b3d7;
}

.block-list .blue2 {
	color: #39b3d7;
}

.block-list .light-blue2 {
	color: #5be9ff;
}

.block-list .bg-pink {
	background-color: #ce526b;
}

.block-list .pink {
	color: #d16a7f;
}

.block-list .light-pink {
	color: #f97791;
}

.block-list .bg-yellow {
	background-color: #e2ad5d;
}

.block-list .yellow {
	color: #e2ad5d;
}

.block-list .light-yellow {
	color: #f9e181;
}

.block-list .bg-orange {
	background-color: #dd6452;
}

.block-list .orange {
	color: #dd6452;
}

.block-list .light-orange {
	color: #f9a67f;
}

/* end SDK block */

/* SDK icon size */
.s-14 {
	float: right;
	padding: 14px;
	position: relative;
}

.s-2014 {
	float: right;
	padding: 20px 14px;
	position: relative;
}

.s-2214 {
	float: right;
	padding: 22px 14px;
	position: relative;
}

.s-1814 {
	float: right;
	padding: 18px 14px;
	position: relative;
}

.s-1418 {
	float: right;
	padding: 14px 18px;
	position: relative;
}

.s-1400 {
	float: right;
	padding: 14px 0px;
	position: relative;
}

.s-1424 {
	float: right;
	padding: 14px 24px;
	position: relative;
}

.s-2008 {
	float: right;
	padding: 20px 8px;
	position: relative;
}

/* end SDK icon list */

/* connect bar */
.connect-bar {
	position: absolute;
	right: -71px;
	width: 180px;
	text-align: center;
	top: 235px;
	text-transform: uppercase;
	font-style: normal;
	padding: 5px;
}

.connect-bar:hover {
	color: white;
	padding-bottom: 25px;
	margin-bottom: -7px;
}

.counte {
	transform: rotate(-90deg);
	padding-bottom: 13px;
}

.border-blue {
	border-radius: 6px 6px 0px 0px;
	box-shadow: 0 0 0 3px #66afff inset, 0 0 0 5px rgba(100, 173, 255, 0.5)
		inset;
	z-index: 100;
	overflow: hidden;
}

.border-green {
	border-radius: 6px 6px 0px 0px;
	box-shadow: 0 0 0 3px #b2e532, 0 0 0 5px rgba(222, 247, 153, 0.5);
	z-index: 100;
	overflow: hidden;
}

.border-grey {
	border-radius: 6px 6px 0px 0px;
	box-shadow: 0 0 0 3px #adadad, 0 0 0 5px rgba(255, 255, 255, 0.8);
	z-index: 100;
	overflow: hidden;
}

/* end connect bar */
</style>
</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="menu.jsp"%>
		<%
		    ArrayList<More.SdkData> listSdk = new ArrayList<More.SdkData>();
		    int nCount = more.querySdk(request, listSdk);
		%>

		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro" class="landscape-bg"
					style="background-image: url('/assets/img/tech2_1920.jpg'); min-height: 100%;">
					<div class="spotlight" style="min-height: 1000px;">
						<div id="block-list" class="panel-body"
							style="padding: 100px 10.5%;">

							<a href="moreSDKandroid.jsp"
								class="connect-bar counte border-green bg-deepgreen white-text"
								style="text-decoration: none;"> <i
								class="icon-android fa-inverse icon-large"
								style="margin-right: 5px;"></i> Android
							</a>

							<!-- SDK Android List -->
							<ul class="block-list">

								<%
								    if (0 < nCount)
								    {
										Iterator<More.SdkData> it = null;
										it = listSdk.iterator();
										More.SdkData sdkData = null;
										while (it.hasNext())
										{
										    sdkData = it.next();
										    if (sdkData.sdk_os.trim().equals("android"))
											continue;
								%>
								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i>
											<%=sdkData.sdk_name%>
										</p>
									</div>

									<div class="panel-body">
										<i class="<%=sdkData.sdk_icon%>"></i> <a
											href="<%=sdkData.sdk_doc%>"
											class="panel-content spotlight text-style2">Document</a> <a
											href="<%=sdkData.sdk_file%>" class="panel-content spotlight text-style2"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<%
								    }

								    }
								%>


								<!--		<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Ads
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-tag fa-inverse icon-4x light-blue1 s-14"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Facebook
											Login
										</p>
									</div>

									<div class="panel-body">
										<i
											class="icon-facebook-sign fa-inverse icon-4x light-blue1 s-14"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Tencent
											Login
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-qq fa-inverse icon-3x light-blue1 s-2014"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Camera
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i
											class="fa-camera-retro fa-inverse icon-3x light-blue1 s-2014"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Screen
											Lock Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="icon-lock fa-inverse icon-4x light-blue1 s-1418"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Battery
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-battery-3 fa-inverse icon-3x light-blue1 s-2008"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Location
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-map-marker fa-inverse icon-4x light-blue1 s-1424"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Storage
											Space Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-hdd-o fa-inverse icon-4x light-blue1 s-14"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i>
											Application List
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-th-list fa-inverse icon-3x light-blue1 s-2214"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Content
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-file-text fa-inverse icon-3x light-blue1 s-2214"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i>
											Application Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-cog fa-inverse icon-4x light-blue1 s-14"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Mute
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-volume-off fa-inverse icon-4x light-blue1 s-1424"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Record
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="icon-signin fa-inverse icon-4x light-blue1 s-14"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Restore
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="icon-exchange fa-inverse icon-3x light-blue1 s-1814"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Wi-Fi
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-wifi fa-inverse icon-4x light-blue1 s-1400"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>  

 -->

							</ul>
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

	<!-- PAGE LEVEL SCRIPTS -->


	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
<%
    more = null;
%>

