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
<%@ page import="more.*"%>

<%@include file="../../home/console/loginValid.jsp"%>
<%@include file="tracker_common.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");

			/** Web Tracker **/
			More.webTracker(request, "load page", null);

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date current = new Date();

			String strID = request.getParameter(Common.APP_ID);
			String strSD = request.getParameter(Common.START_DATE);
			String strED = request.getParameter(Common.END_DATE);

			if (null == strSD || (null != strSD && 0 >= strSD.length())) {
				strSD = dateFormat.format(current);
			}

			if (null == strED || (null != strED && 0 >= strED.length())) {
				strED = dateFormat.format(current);
			}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>APP Tracker Data Query | MORE</title>
<link rel="icon" href="/assets/img/more.png">

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

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
<link href="/more/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="/more/css/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="/more/css/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="/more/css/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="/more/css/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="/more/css/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="/more/css/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="/more/css/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="/more/css/plugins/switch/static/stylesheets/bootstrap-switch.css" />
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
		var reDate = new RegExp(
				/^[0-9]{4}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$/);
		var parts = form.start_date.value.split('-');
		var sd = new Date(parts[0], parts[1] - 1, parts[2]);
		parts = form.end_date.value.split('-');
		var ed = new Date(parts[0], parts[1] - 1, parts[2]);
		var app = form.app_id.value

		if (Trim(app) == '')
			errMsg += "Please enter an app ID !!\n";
		else {
			if (re.test(Trim(app))) {
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
			else {
				if (sd > ed)
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



</head>

<body>


	<%@include file="../home/console/menu.jsp"%>


	<!--PAGE CONTENT -->
	<div id="content">
		<div class="query-inner" style="padding: 0;">
			<div id="intro"
				style="padding: 50px 0px; min-height: 900px; background-color: #8f8f8f;">

				<div class="row" style="margin: 5% 10%;">
					<div class="col-lg-12" style="padding: 0px 1.7%;">


						<div class="body">
							<div class="row">
								<div class="col-lg-12">
									<div class="option-box form-inline"
										style="padding: 15px 5px; background: #303030;">
										<form action="trackerdata_query.jsp" role="form"
											name="formQueryTrackerData" id="formQueryTrackerData">

											<div class="form-group">
												<div class="col-lg-4 form-inline" style="width: 340px;">
													<label class="col-lg-4">App ID</label> <input
														class="form-control" <%if (null != strID) {%>
														value="<%=strID%>" <%}%> name="<%=Common.APP_ID%>" />
												</div>
											</div>

											<div class="form-group" style="margin-left: 12%;">
												<div class="col-lg-4 form-inline" style="width: 170px;">
													<label class="col-lg-4" for="dp3">Start Date</label> <input
														type="text" class="form-control"
														name="<%=Common.START_DATE%>"
														data-date-format="yyyy-mm-dd" value="<%=strSD%>" id="dp3" />
												</div>
											</div>

											<div class="form-group" style="margin-left: 0px;">
												<div class="col-lg-4 form-inline" style="width: 170px;">
													<label class="col-lg-4" for="dp4">End Date</label> <input
														type="text" class="form-control"
														name="<%=Common.END_DATE%>" data-date-format="yyyy-mm-dd"
														value="<%=strED%>" id="dp4" />
												</div>
											</div>

										</form>

										<button type="button"
											class="btn btn-primary btn-circle btn-xl" title="Query"
											onClick="checkInputData('formQueryTrackerData')">
											<span class="sr-only">Query </span> <i class="icon-search"></i>
										</button>
									</div>

									<div class="white-box">
										<%
										    if (null != strID) {

														MongoClient mongoClient = new MongoClient();
														DB db = mongoClient.getDB("access");
														if (null != db) {
															DBCollection collection = db.getCollection("mobile");

															{
																BasicDBObject dataQuery = new BasicDBObject();
																dataQuery.put("ID", new BasicDBObject("$regex", strID).append("$options", "i"));
																dataQuery.put("create_date",
																		new BasicDBObject("$gte", strSD).append("$lte", strED + " 23:59:59"));
																//out.println(strSD+strED);

																DBCursor cursor = collection.find(dataQuery);
																while (cursor.hasNext()) {
																	JSONObject jsonobj = new JSONObject(cursor.next().toString());
																	jsonobj.remove("_id");
										%>

										<p><%=jsonobj.toString()%></p>

										<%
										    }
															}
														}
														mongoClient.close();
													}
										%>
									</div>



								</div>
							</div>
						</div>


					</div>
				</div>




			</div>
		</div>
	</div>
	<!--END PAGE CONTENT -->


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
	<script>
		//<![CDATA[
		(function() {
			$("body")
					.append(
							"<img id='goTopButton' style='display: none; z-index: 5; cursor: pointer;' title='Back to Top'/>");
			var img = "/assets/img/go-top3.png", locatioin = 2 / 3, right = 160, opacity = 0.4, speed = 500, $button = $("#goTopButton"), $body = $(document), $win = $(window);
			$button.attr("src", img);
			$button.on({
				mouseover : function() {
					$button.css("opacity", 1);
				},
				mouseout : function() {
					$button.css("opacity", opacity);
				},
				click : function() {
					$("html, body").animate({
						scrollTop : 0
					}, speed);
				}
			});
			window.goTopMove = function() {
				var scrollH = $body.scrollTop(), winH = $win.height(), css = {
					"top" : winH * locatioin + "px",
					"position" : "fixed",
					"right" : right,
					"opacity" : opacity
				};
				if (scrollH > 20) {
					$button.css(css);
					$button.fadeIn("slow");
				} else {
					$button.fadeOut("slow");
				}
			};
			$win.on({
				scroll : function() {
					goTopMove();
				},
				resize : function() {
					goTopMove();
				}
			});
		})();
		//]]>
	</script>
	<!--END PAGE LEVEL SCRIPT-->
	
			<%@include file="../home/console/footer.jsp"%>
			
</body>
</html>
<%
    more = null;
%>

