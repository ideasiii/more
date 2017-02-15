<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="sdk.ideas.More"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>

<%
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

<!-- END PAGE LEVEL  STYLES -->

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
	background: rgba(86, 99, 100, 1);
	/*display: table-row;*/
	height:20%;
}

.footer .link_area {
	background:  rgba(86, 99, 100, 1);
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
</style>
</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="menu.jsp"%>


		<!--PAGE CONTENT -->
		<img width="100%" src="/assets/img/bg-col-xl-shape-thin.jpg" alt="" />

		<div id="content">
			<div class="inner" style="min-height: 700px; padding: 0;">
				<div id="intro" class="full-height-outer bg-grey full-height-s">
					<div class="silk-white">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">
									<span style="color: #001075;">MORE</span> Platform
								</h2>
								<h3 style="font-weight: bold;" class="vline-right-orange">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

							</div>
						</div>
					</div>
					<div class="photoframe">
						<img src="/assets/img/sample1.png" class="photo">
					</div>

				</div>

				<div id="" class="full-height-outer bg-white full-height-m">

					<div class="silk-grey">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">Dashboard</h2>
								<h3 style="font-weight: bold;" class="vline-right-green">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

							</div>
						</div>
					</div>
				</div>

				<div id="" class="full-height-outer bg-green full-height-m">
					<div class="silk-white-green">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">Resources</h2>
								<h3 style="font-weight: bold;" class="vline-right-blue">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

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

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/flot/jquery.flot.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.stack.js"></script>
	<script src="/assets/js/for_index.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
<%
    more = null;
%>