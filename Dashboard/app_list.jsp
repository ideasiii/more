<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>

<%@include file="../../home/console/loginValid.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Applications | MORE</title>

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



</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="../home/console/menu.jsp"%>

		<!-- HEADER SECTION -->

		<div class="col-lg-12">
			<div class="modal fade" id="AppInfo" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Application Info</h4>
						</div>
						<div class="modal-body">


							<div class="form-group">
								<label>Login Account</label> <input name="GroupEditAccount"
									id="GroupEditAccount" class="form-control" />
								<p class="help-block">(Must be less than 20 letters in
									alphanumeric format.)</p>
							</div>
							<div class="form-group">
								<label>Password</label> <input name="GroupEditPassword"
									id="GroupEditPassword" class="form-control" />
								<p class="help-block">(Must be less than 20 letters in
									alphanumeric format.)</p>
							</div>
							<div class="form-group">
								<label>Max Number of Devices</label> <select
									name="GroupEditMaximum" id="GroupEditMaximum"
									class="form-control">
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="15">15</option>
									<option value="20">20</option>
									<option value="25">25</option>
									<option value="30">30</option>
									<option value="35">35</option>
									<option value="40">40</option>
									<option value="45">45</option>
									<option value="50">50</option>
								</select>
							</div>


						</div>

					</div>
				</div>
			</div>
		</div>






		<!-- END HEADER SECTION -->

		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro" class="landscape-bg"
					style="background-image: url('/assets/img/tech2_1920.jpg'); min-height: 100%;">
					<div class="spotlight" style="min-height: 800px;">
						<div id="app-list" class="panel-body" style="padding: 100px 4.8%;">

							<div style="margin-left: 12%; margin-bottom: 40px;">
								<h1 class="white-text">Your Applications</h1>
							</div>

							<!-- APP List -->
							<ul class="app-list app-list-ul">
								<li class="app-list-li">
									<div class="panel-body">
										<a data-toggle="modal" data-target="#AppInfo" href=><img
											class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" /></a>
										<div class="panel-content">

											<h4 class="app-title">Test App 1</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-apple icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">新聞與雜誌</li>
												<li class="app-info-li">APP ID: 1490859308059</li>

											</ul>

										</div>
									</div>
								</li>

								<li class="app-list-li">
									<div class="panel-body">
										<a data-toggle="modal" data-target="#AppInfo" href=><img
											class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" /></a>
										<div class="panel-content">

											<h4 class="app-title">Test App 2</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-apple icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">運動</li>
												<li class="app-info-li">APP ID: 1490859308059</li>

											</ul>

										</div>
									</div>
								</li>

								<li class="app-list-li">
									<div class="panel-body">
										<img class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" />
										<div class="panel-content">

											<h4 class="app-title">Test App 3</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-android icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">新聞與雜誌</li>
												<li class="app-info-li">APP ID: 1490859308059</li>
											</ul>

										</div>
									</div>
								</li>

								<li class="app-list-li">
									<div class="panel-body">
										<img class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" />
										<div class="panel-content">

											<h4 class="app-title">Test App 4</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-android icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">工具</li>
												<li class="app-info-li">APP ID: 1490859308059</li>

											</ul>

										</div>
									</div>
								</li>

								<li class="app-list-li">
									<div class="panel-body">
										<img class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" />
										<div class="panel-content">

											<h4 class="app-title">Test App 5</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-android icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">工具</li>
												<li class="app-info-li">APP ID: 1490859308059</li>

											</ul>

										</div>
									</div>
								</li>
								<li class="app-list-li">
									<div class="panel-body">
										<img class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" />
										<div class="panel-content">

											<h4 class="app-title">Test App 6</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-android icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">工具</li>
												<li class="app-info-li">APP ID: 1490859308059</li>

											</ul>

										</div>
									</div>
								</li>
								<li class="app-list-li">
									<div class="panel-body">
										<img class="app-icon" src="/assets/img/Apps-Android-icon.png"
											alt="" />
										<div class="panel-content">

											<h4 class="app-title">Test App 7</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-android icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">工具</li>
												<li class="app-info-li">APP ID: 1490859308059</li>

											</ul>

										</div>
									</div>
								</li>

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


</body>
</html>