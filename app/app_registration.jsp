<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>

<%@include file="../../console/loginValid.jsp"%>

<%
	final String strHostUrl = request.getRequestURL().toString();
	/** Web Tracker **/
	More.webTracker(request, "load page", null);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>APP Registration | MORE</title>
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
<link rel="stylesheet" href="/more/css/bootstrap-fileupload.min.css" />
<!-- END PAGE LEVEL  STYLES -->

<!--  JavaScript -->
<script src="js/appValid.js"></script>
<script type="text/javascript">
	function showCheckBox1(formName) {
		var form = document.getElementById(formName);
		var formname = form.name;
		
		if (formname == "formAppRegistration") {
			document.getElementById("checkD").style.display = "none";	
			document.getElementById("checkA").style.display = "block";	
		}
	}
	
</script>

</head>

<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap">

		<%@include file="../../console/menu.jsp"%>


		<!-- HEADER SECTION -->

		<div class="col-lg-12">
			<div class="modal fade" id="Agree" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 850px;">
					<div class="modal-content">
						<div class="modal-header" style="background-color: #f8f8f8;">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title">Privacy Policy</h4>
						</div>


						<!--	<div class="modal-body" style="padding: 20px 80px 0px 80px;">-->

						<div class=""
							style="padding: 0px 22px;; background-color: #f8f8f8; border-radius: 5px;">
							<section style="overflow-y: scroll;">
							<div style="padding-left: 15px; text-align: left;">
								<br />
								<p style="text-align: justify; color: gray;">
									<b>Notification and Letter of Consent for Collection,
										Processing and Use of Personal Information<br /> <span
										style="color: #b94a48;">(Version: P-V4-DSI)</span>
									</b> <br /> <br /> According to the R.O.C. Personal Information
									Protection Act and the internal policy/regulations of Institute
									for Information Industry (hereinafter referred to as “III”),
									III is obligated to make the following notification known to
									you before you provide personal information to III. Please read
									it carefully. <br /> <br />1. Purposes and Categories of
									Personal Information to be Collected For the purpose of
									carrying out III’s business, activity or project, the purpose
									of providing service, internal administrative management or
									reporting to the competent authority, the purpose complying
									with the Endowment, or the purpose of sending III’s or industry
									relevant information, III needs you to provide these categories
									of personal information: name, contact information (such as
									phone number, title, e-mail address, residential or office
									address), ID card number, or other information which may be
									used to identify you directly or indirectly. <br /> <br />
									Note: You may choose, at any time in the future, not to receive
									any promotional information from III by clicking the link
									provided in the promotional message. <br /> <br /> 2. Time
									Period, Area, Target and Way of the Use of Personal Information
									Unless the purposes of use relating to international businesses
									or activities, your personal information will be used solely by
									III in a reasonable way in the territory of the Republic of
									China to the extent necessary to implement the purposes of
									collection until the purposes of collection prescribed above is
									fulfilled. <br /> <br /> 3. Your Rights with regard to
									Personal Information Provided You may exercise the following
									rights in pursuant to the rules of the activities/project or by
									submitting your inquiry/request on our website
									(http://www.iii.org.tw/) at “Application for Exercising Rights
									with Regard to Personal Information” page: <br /> (1) any
									inquiry and request for a review of the personal information;<br />
									(2) any request to make duplications of the personal
									information;<br /> (3) any request to supplement or correct
									the personal information;<br /> (4) any request to discontinue
									collection, processing or use of the personal information; <br />
									(5) any request to delete the personal information.<br /> <br />
									4. The Influence on Your Rights and Interests while You Choose
									not to Provide Your Personal Information<br /> If you provide
									incorrect personal information or choose not to provide your
									personal information to III, III may not be able to provide you
									with services relating to the purposes prescribed above. <br />
									<br /> 5. You understand that this document complies with the
									R.O.C. Personal Information Protection Act and relating
									regulations, and you agree that III keeps this document for
									further checking. <br /> <br />

								</p>

							</div>
							</section>
						</div>



						<!--	</div>-->


						<div class="modal-footer"
							style="margin: 0; text-align: center; background-color: #f8f8f8;">
							<button type="button" class="btn btn-line btn-primary" data-dismiss="modal"
								 onclick="showCheckBox1('formAppRegistration')">I have read and understood the
								above notification</button>
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
						<div class="panel-body"
							style="padding: 130px 0px; width: 800px; margin: 0px auto;">

							<div class="white-text">
								<h1>Register a New App</h1>
								<br>
							</div>

							<div class="appRegistration">

								<div class="panel-body" style="padding-top: 30px;">
									<form action="pAppRegister.jsp" role="form" method="post"
										enctype="multipart/form-data" name="formAppRegistration"
										id="formAppRegistration">
										<input name="agree_no" id="agree_no" value="P-V4-DSI"
											type="hidden">

										<dl
											style="display: inline-block; width: 50%; margin: 10px 0px 5px 30px;">

											<dd class="fileupload fileupload-new"
												style="margin-bottom: 15px;" data-provides="fileupload">

												<div class="fileupload-new thumbnail"
													style="width: 60px; height: 60px; border: 0; margin-bottom: 5px;">
													<img src="/assets/img/Apps-Android-icon.png" alt="" />
												</div>
												<div class="fileupload-preview fileupload-exists thumbnail"
													style="width: 60px; height: 60px; padding: 0; border: 0; margin-bottom: 10px;"></div>

												<div
													style="margin-left: 10px; display: inline-block; text-align: left;">
													<label class="control-label" style="margin-left: 5px;">App
														Icon</label> <input name="inputIcon" id="inputIcon" type="file"
														maxlength="100" onChange="validateAppIcon(this.value)" />
												</div>

											</dd>


											<dd class="form-group">
												<div class="col-lg-4 panel-content">
													<label class="col-lg-4">Application Name</label> <input
														class="form-control" name="app_name" maxlength="20"
														style="width: 280px;" />
												</div>
											</dd>


											<dd class="form-group">
												<div class="col-lg-4 panel-content">
													<label class="col-lg-4">Type</label> <select name="app_os"
														class="form-control" style="width: 280px;">
														<option value="android">android</option>
														<option value="ios">ios</option>
													</select>
												</div>
											</dd>
											<dd class="form-group">
												<div class="col-lg-4 panel-content">
													<label class="col-lg-4">Categories</label> <select
														name="app_category" style="width: 280px;"
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
											</dd>

										</dl>



										<dl
											style="display: inline-block; width: 40%; margin: 0px 5px 5px 0px;">
											<dd class="form-group">
												<div class="col-lg-4 panel-content">
													<label class="col-lg-4">Organization</label> <input
														class="form-control" name="user_name" maxlength="20"
														style="width: 280px;" />
												</div>
											</dd>
											<dd class="form-group">
												<div class="col-lg-4 panel-content">
													<label class="col-lg-4">Support E-mail</label> <input
														class="form-control" name="user_email" maxlength="50"
														style="width: 280px;" />
												</div>
											</dd>
											<dd class="form-group">
												<div class="col-lg-4 panel-content">
													<label class="col-lg-4">Phone</label> <input
														class="form-control" name="user_phone" maxlength="20"
														style="width: 280px;" />
												</div>
											</dd>
										</dl>

										<div class="checkbox" id="checkD" style="padding: 0 15%;">
											<input type="checkbox" id="ch0" disabled="disabled" />
											<p>
												<strong class="text">I agreed that III
													may collect, process and use my personal information for
													the purposes of collection prescribed by the </strong> <a id="agree"
													data-target="#Agree" data-toggle="modal"
													style="font-weight: bold; color: #871111; text-decoration: underline; cursor: pointer;">Agreement.
												</a>
											</p>
										</div>
										<div class="checkbox" id="checkA" style="padding: 0 15%;display: none;">
											<input type="checkbox" id="ch1" />
											<p>
												<strong class="text" for="ch1">I agreed that III
													may collect, process and use my personal information for
													the purposes of collection prescribed by the </strong> <a id="agree"
													data-target="#Agree" data-toggle="modal"
													style="font-weight: bold; color: #000; text-decoration: underline; cursor: pointer;">Agreement.
												</a>
											</p>
										</div>

									</form>
									<br>
									<div class="subm-footer">
										<button type="button" class="btn btn-primary subm-btn"
											onclick="checkAppRegiData('formAppRegistration')">Register</button>
									</div>


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

	<%@include file="../../console/footer.jsp"%>


	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-3.2.1.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="/assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
<%
	more = null;
%>