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
<title>TRACKER DATA QUERY</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- GLOBAL STYLES -->
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap_2.css" />
<link rel="stylesheet" href="assets/css/main_2.css" />
<link rel="stylesheet" href="assets/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="assets/plugins/Font-Awesome/css/font-awesome_2.css" />
<link rel="stylesheet"
	href="assets/plugins/font-awesome-4.6.2/css/font-awesome_3.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->

<link href="assets/css/jquery-ui.css" rel="stylesheet" />
<link rel="stylesheet"
	href="assets/plugins/uniform/themes/default/css/uniform.default.css" />
<link rel="stylesheet"
	href="assets/plugins/inputlimiter/jquery.inputlimiter.1.0.css" />
<link rel="stylesheet" href="assets/plugins/chosen/chosen.min.css" />
<link rel="stylesheet"
	href="assets/plugins/colorpicker/css/colorpicker.css" />
<link rel="stylesheet"
	href="assets/plugins/tagsinput/jquery.tagsinput.css" />
<link rel="stylesheet"
	href="assets/plugins/daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet"
	href="assets/plugins/datepicker/css/datepicker.css" />
<link rel="stylesheet"
	href="assets/plugins/timepicker/css/bootstrap-timepicker.min.css" />
<link rel="stylesheet"
	href="assets/plugins/switch/static/stylesheets/bootstrap-switch.css" />

<!-- END PAGE LEVEL  STYLES -->

</head>

<body class="padTop53">

	<div id="wrap">
		<!-- HEADER SECTION -->
		<div id="top">

			<nav class="navbar navbar-inverse navbar-fixed-top "
				style="padding-top: 7px;">

				<!-- LOGO SECTION -->
				<!--  
	   <header class="navbar-header">
		<div>
			<a href="group_management.jsp" class="navbar-brand"> <img
				height="55" style="padding-bottom: 7px; margin-left: 35px;"
				src="assets/img/mdm_logo_web67t4.png" alt="" />
			</a>
		</div>
	   </header>  
	-->
				<!-- END LOGO SECTION -->

				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown"><button class="btn btn-success btn-sm"
							data-toggle="dropdown">
							<span class="label"> <i class="fa fa-download fa-2x"></i></span>&nbsp;

						</button></li>
				</ul>

			</nav>
		</div>

		<!-- END HEADER SECTION -->

		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
						<div class="box" style="padding: 20px;">
							<%
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
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--END PAGE CONTENT -->

	<!-- GLOBAL SCRIPTS -->
	<script src="assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->


	<!-- PAGE LEVEL SCRIPT-->
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/plugins/uniform/jquery.uniform.min.js"></script>
	<script
		src="assets/plugins/inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="assets/plugins/chosen/chosen.jquery.min.js"></script>
	<script src="assets/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
	<script src="assets/plugins/tagsinput/jquery.tagsinput.min.js"></script>
	<script src="assets/plugins/validVal/js/jquery.validVal.min.js"></script>
	<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="assets/plugins/daterangepicker/moment.min.js"></script>
	<script src="assets/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/plugins/timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="assets/plugins/switch/static/js/bootstrap-switch.min.js"></script>
	<script
		src="assets/plugins/jquery.dualListbox-1.3/jquery.dualListBox-1.3.min.js"></script>
	<script src="assets/plugins/autosize/jquery.autosize.min.js"></script>
	<script src="assets/plugins/jasny/js/bootstrap-inputmask.js"></script>
	<script src="assets/js/formsInit.js"></script>
	<script>
		$(function() {
			formInit();
		});
	</script>

	<!--END PAGE LEVEL SCRIPT-->

</body>
</html>
