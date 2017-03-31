<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>

<%@include file="../../home/console/loginValid.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APP Registration | MORE</title>

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
						<div class="panel-body" style="padding: 130px 27.5%;">

							<div class="white-text">
								<h1>Register a New App</h1>
								<br>
							</div>

							<div class="appRegistration">

								<div class="panel-body">
									<form action="applications.jsp" role="form"
										name="formAppRegistration" id="formAppRegistration">

										<div class="fileupload fileupload-new panel-upload"
											data-provides="fileupload">

											<div class="fileupload-new thumbnail"
												style="width: 60px; height: 60px; border: 0; margin-bottom: 5px;">
												<img src="/assets/img/Apps-Android-icon.png" alt="" />
											</div>
											<div class="fileupload-preview fileupload-exists thumbnail"
												style="width: 60px; height: 60px; padding: 0; border: 0; margin-bottom: 10px;"></div>
											<div style="display: inline-block;">

												<div class="panel-upload-title">
													<label class="control-label">App
														Icon</label>
											</div>
												<input name="" id="inputIcon" style="margin-left: 20px;"
													type="file" onChange="validateAppIcon(this.value)" />
											</div>
										</div>

										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label class="col-lg-4">Application Name</label> <input
													class="form-control" name="" />
											</div>
										</div>


										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label>Type</label> <select name=""
													class="form-control">
													<option value="android">android</option>
													<option value="ios">ios</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label>Categories</label> <select name=""
													class="form-control">
													<option>工具</option>
													<option>天氣</option>
													<option>生活品味</option>
													<option>生產應用</option>
													<option>交通運輸</option>
													<option>社交</option>
													<option>音樂與音效</option>
													<option>個人化</option>
													<option>娛樂</option>
													<option>旅遊與地方資訊</option>
													<option>財經</option>
													<option>健康塑身</option>
													<option>動態桌布</option>
													<option>商業</option>
													<option>教育</option>
													<option>通訊</option>
													<option>媒體與影片</option>
													<option>程式庫與試用程式</option>
													<option>新聞與雜誌</option>
													<option>運動</option>
													<option>圖書與參考資源</option>
													<option>漫畫</option>
													<option>購物</option>
													<option>醫療</option>
													<option>攝影</option>
													<option>遊戲</option>
													<option>家庭</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label class="col-lg-4">Organization</label> <input
													class="form-control" name="app_id" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label class="col-lg-4">Support E-mail</label> <input
													class="form-control" name="app_id" />
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-4 panel-content">
												<label class="col-lg-4">Phone</label> <input
													class="form-control" name="app_id" />
											</div>
										</div>
										<div class="subm-footer">
											<button type="button" class="btn btn-primary subm-btn">Register</button>
										</div>
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

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>