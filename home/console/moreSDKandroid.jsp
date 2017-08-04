<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>
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
<title>SDK android version | MORE</title>
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

<!-- JavaScript -->
<script src="js/validation.js"></script>


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

							<a href="moreSDKios.jsp"
								class="connect-bar counte border-grey bg-grey white-text"
								style="text-decoration: none;"> <i
								class="icon-apple icon-large" style="margin-right: 5px;"></i>
								IOS
							</a>

							<div class="white-text" style="margin-left: 50px;width:500px;">
								<h1>SDK for ANDROID</h1>
								<br>
							</div>

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
										    if (sdkData.sdk_os.trim().equals("ios"))
											continue;
								%>
								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle light-blue1"></i>
											<%=sdkData.sdk_name%>
										</p>
									</div>

									<div class="panel-body">
										<i class="<%=sdkData.sdk_icon%>"></i> <a
											href="<%=sdkData.sdk_doc%>" class="panel-content spotlight">Document</a>
										<a href="<%=sdkData.sdk_file%>"
											class="panel-content spotlight" style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<%
								    }

								    }
								%>

							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--END PAGE CONTENT -->



	</div>
	<!--END MAIN WRAPPER -->

	<%@include file="footer.jsp"%>

	<!-- GLOBAL SCRIPTS -->
	<script src="/assets/plugins/jquery-3.2.1.js"></script>
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

