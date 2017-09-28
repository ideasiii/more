<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>

<%@include file="../../console/loginValid.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Backstage Management | MORE</title>

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
<link
	href="/assets/plugins/DataTables-1.10.16/css/dataTables.bootstrap.css"
	rel="stylesheet" />
<!-- END PAGE LEVEL  STYLES -->

<!-- JavaScript -->



<style>
#menu li>a {
	border: 0;
	color: white;
}

.inner {
	background: #8f8f8f;
	color: #fff;
}
</style>
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

			<div class="inner" style="min-height: 1200px;">
				<div class="row">
					<div class="col-lg-12">
						<h1>User Permission</h1>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-lg-12">
						<div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTables-CM">
										<thead class="toolbar" style="background-color: #303030;">
											<tr>
												<th>USER ID</th>
												<th>ACCOUNT</th>
												<th>PERMISSION</th>
												<th>START DATE</th>
												<th>END DATE</th>
												<th>CREATE TIME</th>
												<th>UPDATE TIME</th>
												<th>OPTION</th>
											</tr>
										</thead>

										<tbody>


											<tr class="odd gradeX">
												<td style="vertical-align: middle;">weer</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">rt</td>
												<td class="center" style="vertical-align: middle;">ert</td>
												<td class="center"><a href=""><button
															class="btn btn-primary btn-grad"
															style="margin-right: 10px;" title="Edit">
															<i class="fa fa-gear" aria-hidden="true"></i><span
																class="sr-only">Edit</span>
														</button></a>
													<button class="btn btn-danger btn-grad" title="Delete"
														data-toggle="modal" data-target="#DeleteContent">
														<i class="fa fa-trash-o" aria-hidden="true"></i><span
															class="sr-only">Delete</span>
													</button></td>
											</tr>
											<tr class="odd gradeX">
												<td style="vertical-align: middle;">weer</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">df</td>
												<td style="vertical-align: middle;">rt</td>
												<td class="center" style="vertical-align: middle;">ert</td>
												<td class="center"><a href=""><button
															class="btn btn-primary btn-grad"
															style="margin-right: 10px;" title="Edit">
															<i class="fa fa-gear" aria-hidden="true"></i><span
																class="sr-only">Edit</span>
														</button></a>
													<button class="btn btn-danger btn-grad" title="Delete"
														data-toggle="modal" data-target="#DeleteContent">
														<i class="fa fa-trash-o" aria-hidden="true"></i><span
															class="sr-only">Delete</span>
													</button></td>
											</tr>

										</tbody>
									</table>
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

	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-3.2.1.js"></script>
	<script src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="/assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script
		src="assets/plugins/DataTables-1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="assets/plugins/DataTables-1.10.16/js/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-CM').DataTable();
		});
	</script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
