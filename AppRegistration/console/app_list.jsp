<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>



<%
    final String strHostUrl = request.getRequestURL().toString();
    /** Web Tracker **/
    More.webTracker(request, "load page", null);
%>

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

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="/more/css/bootstrap-fileupload.min.css" />
<!-- END PAGE LEVEL  STYLES -->


<!--  JavaScript -->



</head>

<body class="padTop53 body-font">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="../../home/console/menu.jsp"%>

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
						<div class="modal-body" style="padding: 20px 80px 0px 80px;">

							<dl
								style="display: inline-block; width: 420px; vertical-align: top;">
								<dd style="display: block;">
									<img class="app-icon" src="/assets/img/Apps-Android-icon.png"
										style="float: left; margin: 10px 50px 10px 10px">
								</dd>

								<dd>
									<h4 class="app-title">Test App 2</h4>
									<label> <i class="icon-apple icon-large"
										style="margin-right: 5px;"></i></label> <label> 運動</label>
								</dd>
							</dl>

							<dl
								style="display: inline-block; width: 130px; margin-bottom: 0px;">
								<dd class="form-group">
									<span style="font-weight: bold; margin-right: 5px;">APP
										ID: </span>
								</dd>
								<dd class="form-group">
									<span style="font-weight: bold; margin-right: 5px;">Organization:
									</span>
								</dd>
								<dd class="form-group">
									<span style="font-weight: bold; margin-right: 5px;">Support
										E-mail: </span>
								</dd>
								<dd class="form-group">
									<span style="font-weight: bold; margin-right: 5px;">Phone:
									</span>
								</dd>
							</dl>

							<dl
								style="display: inline-block; width: 280px; margin-bottom: 0px;">

								<dd class="form-group">
									<span style="color: #737373;"> 1490859308059</span>
								</dd>
								<dd class="form-group">
									<span style="color: #737373;"> testname</span>
								</dd>
								<dd class="form-group">
									<span style="color: #737373;"> testname123456789@ttt.tt</span>
								</dd>
								<dd class="form-group">
									<span style="color: #737373;"> 001122334455</span>
								</dd>
							</dl>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-line btn-danger"
								data-toggle="modal" data-target="#DeleteAppInfo">Delete</button>
								 
							<button type="button" class="btn btn-line btn-primary"
								data-toggle="modal" data-target="#EditAppInfo">
								<i class="icon-pencil"></i> Edit
							</button>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="EditAppInfo" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="padding-top: 100px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Edit - 1490859308059</h4>
						</div>
						<div class="modal-body">
							<form role="form" action=".jsp" method="post"
								enctype="multipart/form-data" name="formEditAppInfo"
								id="formEditAppInfo">

								<div class="fileupload fileupload-new"
									data-provides="fileupload" style="margin-left: 20px;">

									<div class="fileupload-new thumbnail"
										style="width: 60px; height: 60px; border: 0; margin-bottom: 5px;">
										<img src="/assets/img/Apps-Android-icon.png" alt="" />
									</div>
									<div class="fileupload-preview fileupload-exists thumbnail"
										style="width: 60px; height: 60px; padding: 0; border: 0; margin-bottom: 10px;"></div>
									<div style="display: inline-block;">

										<div style="margin-left: 25px;">
											<label class="control-label">App Icon</label>
										</div>
										<input name="" id="inputIcon" style="margin-left: 20px;"
											type="file" onChange="validateAppIcon(this.value)" />
									</div>
								</div>

								<dl
									style="display: inline-block; width: 210px; margin: 0px 25px 10px 25px;">
									<dd class="form-group">
										<label>App Name</label> <input name="" class="form-control"
											maxlength="10" />
									</dd>

									<dd class="form-group">
										<label>Type</label> <select name="" class="form-control">
											<option value="android">android</option>
											<option value="ios">ios</option>
										</select>
									</dd>

									<dd class="form-group">
										<label>Category</label> <select name="" class="form-control"
											style="height: 34px;">
											<option value="工具">工具</option>
											<option value="天氣">天氣</option>
											<option value="生活品味">生活品味</option>
											<option value="生產應用">生產應用</option>
											<option value="交通運輸">交通運輸</option>
											<option value="社交">社交</option>
											<option value="音樂與音效">音樂與音效</option>
											<option value="個人化">個人化</option>
											<option value="娛樂">娛樂</option>
											<option value="旅遊與地方資訊">旅遊與地方資訊</option>
											<option value="財經">財經</option>
											<option value="健康塑身">健康塑身</option>
											<option value="動態桌布">動態桌布</option>
											<option value="商業">商業</option>
											<option value="教育">教育</option>
											<option value="通訊">通訊</option>
											<option value="媒體與影片">媒體與影片</option>
											<option value="程式庫與試用程式">程式庫與試用程式</option>
											<option value="新聞與雜誌">新聞與雜誌</option>
											<option value="運動">運動</option>
											<option value="圖書與參考資源">圖書與參考資源</option>
											<option value="漫畫">漫畫</option>
											<option value="購物">購物</option>
											<option value="醫療">醫療</option>
											<option value="攝影">攝影</option>
											<option value="遊戲">遊戲</option>
											<option value="家庭">家庭</option>
										</select>
									</dd>
								</dl>

								<dl
									style="display: inline-block; width: 210px; margin: 0px 25px 10px 25px;">
									<dd class="form-group">
										<label>Organization</label> <input name=""
											class="form-control" maxlength="8" />
									</dd>
									<dd class="form-group">
										<label>Support E-mail</label> <input name=""
											class="form-control" />
									</dd>
									<dd class="form-group">
										<label>Phone</label> <input name="" class="form-control"
											maxlength="20" />
									</dd>
								</dl>

							</form>
							<div style="text-align: right;">
								<button type="button" class="btn btn-primary" onclick="">Save
									Changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="DeleteAppInfo" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="padding-top: 200px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Delete Confirm</h4>
						</div>
						<form action=".jsp" method="post" name="formDeleteAppInfo"
							id="formDeleteAppInfo">
							
							<div class="modal-body">
								<span> You have selected to delete "<span
									id="DeleteAppName"></span>". <br>If this was the action
									that you wanted to do, please confirm your choice, or cancel
									and return to the page.
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<input type="submit" class="btn btn-danger" value="Delete">
							</div>
						</form>
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

							<div style="margin-left: 12%; margin-bottom: 30px;">
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
											<div style="height: 25px;"></div>
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
											<div style="height: 25px;"></div>
										</div>
									</div>
								</li>

								<li class="app-list-li">
									<div class="panel-body">
										<img class="app-icon" src="/assets/img/mdm_logo_web67t4.png"
											alt="" />
										<div class="panel-content">

											<h4 class="app-title">Test App 3</h4>

											<ul class="app-info silk">
												<li class="app-info-li"><i
													class="icon-android icon-large" style="margin-right: 5px;"></i></li>
												<li class="app-info-li">新聞與雜誌</li>
												<li class="app-info-li">APP ID: 1490859308059</li>
											</ul>
											<div style="height: 25px;"></div>
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
											<div style="height: 25px;"></div>
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
											<div style="height: 25px;"></div>
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
											<div style="height: 25px;"></div>
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
											<div style="height: 25px;"></div>
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

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>