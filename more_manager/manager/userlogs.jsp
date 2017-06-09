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
<%
    request.setCharacterEncoding("UTF-8");

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date current = new Date();

			String strSD = request.getParameter(MoreManager.Common.START_DATE);
			String strED = request.getParameter(MoreManager.Common.END_DATE);

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Logs | MORE Backstage Management</title>

<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->

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
<link href="/assets/plugins/flot/examples/examples.css" rel="stylesheet" />
<link rel="stylesheet" href="/assets/plugins/timeline/timeline.css" />
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

<!-- JavaScript -->
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
		var reDate = new RegExp(
				/^[0-9]{4}[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])$/);
		var parts = form.start_date.value.split('-');
		var sd = new Date(parts[0], parts[1] - 1, parts[2]);
		parts = form.end_date.value.split('-');
		var ed = new Date(parts[0], parts[1] - 1, parts[2]);

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
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js'></script>


<style>
#menu li>a {
	border: 0;
	color: white;
}

.inner {
	background: #8f8f8f;
	color: #fff;
}

.option-box {
	height: 95px;
	background-color: #303030;
	border-radius: 5px;
	text-align: center;
	padding: 5px;
}

.white-box {
	padding: 30px;
	margin-top: 50px;
	border-radius: 5px;
	color: #000;
	background-color: #fff;
}

#backtotop {
	display: scroll;
	position: fixed;
	bottom: 5px;
	right: 5px;
}
</style>


<!--
<a id="backtotop" href="#" title="Back to Top"><img src="http://public.blu.livefilestore.com/y1pZlI1EIljTEO1GZhDHoKYQfxFtz81NjVSM19u5avSPPIrjwN1uHCiWULYXgNUGfaZdqsnIuoTa3NQJXq2Az5HTA/backtotop.gif" alt="Back to Top" border="0" width="17px" height="75px" /></a>
-->
</head>
<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="padTop53 ">

	<!-- MAIN WRAPPER -->
	<div id="wrap" style="background: #454545; padding: 0;">


		<!-- HEADER & MENU SECTION -->
		<%@include file="menu.jsp"%>


		<!--PAGE CONTENT -->
		<div id="content" style="float: left; width: calc(100% - 220px);">

			<div class="inner" style="min-height: 1000px;">
				<div class="row">
					<div class="col-lg-12">
						<h1>User Logs</h1>
					</div>
				</div>
				<hr />

				<div class="form-inline option-box">

					<form action="userlogs.jsp" role="form" name="formQueryUserLogs"
						id="formQueryUserLogs">

						<div class="form-group">
							<div class="col-lg-3 form-inline" style="width: 320px;">
								<label class="col-lg-4" for="dp3">Start Date</label> <input
									name="<%=MoreManager.Common.START_DATE%>" type="text"
									class="form-control" data-date-format="yyyy-mm-dd"
									value="<%=strSD%>" id="dp3" />
							</div>
						</div>

						<div class="form-group" style="margin-left: 100px;">
							<div class="col-lg-3 form-inline" style="width: 320px;">
								<label class="col-lg-4" for="dp4"> End Date </label> <input
									name="<%=MoreManager.Common.END_DATE%>" type="text"
									class="form-control" data-date-format="yyyy-mm-dd"
									value="<%=strED%>" id="dp4" />
							</div>
						</div>

					</form>
					<button type="button" class="btn btn-primary btn-circle btn-xl"
						title="Query" onClick="checkInputData('formQueryUserLogs')">
						<span class="sr-only">Query </span> <i class="icon-search"></i>
					</button>
				</div>

				<div class="box white-box">
					<table class="table table-bordered"
						style="border: 2px #dddddd solid; display: block;word-break:break-all">
						<thead>
							<tr>
								<th style="width: 30%; vertical-align: middle;">Host</th>
								<th style="width: 12.5%; vertical-align: middle;">Client</th>
								<th style="width: 12.5%; vertical-align: middle;">Action</th>
								<th style="width: 15%; vertical-align: middle;">Create Time</th>
								<th style="width: 30%; vertical-align: middle;">Event</th>
							</tr>
						</thead>
						<tbody>

							<%
							    MongoClient mongoClient = new MongoClient();
										DB db = mongoClient.getDB("website");
										if (null != db) {
											DBCollection collection = db.getCollection("more");

											BasicDBObject dataQuery = new BasicDBObject();
											dataQuery.put("create_date", new BasicDBObject("$gte", strSD).append("$lte", strED + " 23:59:59"));
											//out.println(strSD + strED);

											DBCursor cursor = collection.find(dataQuery);
											cursor.sort(new BasicDBObject("create_date",1));
											
											while (cursor.hasNext()) {
												JSONObject jsonobj = new JSONObject(cursor.next().toString());
												jsonobj.remove("_id");
							%>
							<tr>
								<td><%=jsonobj.getString("host")%></td>
								<td><%=jsonobj.getString("client")%></td>
								<td><%=jsonobj.getString("action")%></td>
								<td><%=jsonobj.getString("create_date")%></td>
								<td><%=jsonobj.getString("event")%></td>
							</tr>
							<%
							    } //while
										}
										mongoClient.close();
							%>
						</tbody>
					</table>
				</div>


			</div>
		</div>
		<!--END PAGE CONTENT -->
	</div>


	<!--END MAIN WRAPPER -->

	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
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
			var img = "/assets/img/go-top3.png", locatioin = 2 / 3, right = 20, opacity = 0.4, speed = 500, $button = $("#goTopButton"), $body = $(document), $win = $(window);
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
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
