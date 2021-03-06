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
<title>SDK ios version | MORE</title>
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
		    int nCount = more.mQuerySdk(request, listSdk);
		%>

		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner" style="min-height: 100%; padding: 0;">
				<div id="intro" class="landscape-bg"
					style="background-image: url('/assets/img/tech2_1920.jpg'); min-height: 100%;">
					<div class="spotlight" style="min-height: 1000px;">
						<div id="block-list" class="panel-body"
							style="padding: 100px 10.5%;">

							<a href="moreSDKandroid.jsp"
								class="connect-bar counte border-green bg-deepgreen white-text"
								style="text-decoration: none;"> <i
								class="icon-android fa-inverse icon-large"
								style="margin-right: 5px;"></i> Android
							</a>


							<div class="white-text" style="margin-left: 50px;">
								<h1>SDK for IOS</h1>
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
										    if (sdkData.sdk_os.trim().equals("android"))
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


								<!--		<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Ads
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-tag fa-inverse icon-4x light-blue1 s-14"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Facebook
											Login
										</p>
									</div>

									<div class="panel-body">
										<i
											class="icon-facebook-sign fa-inverse icon-4x light-blue1 s-14"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Tencent
											Login
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-qq fa-inverse icon-3x light-blue1 s-2014"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Camera
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i
											class="fa-camera-retro fa-inverse icon-3x light-blue1 s-2014"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Screen
											Lock Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="icon-lock fa-inverse icon-4x light-blue1 s-1418"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Battery
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-battery-3 fa-inverse icon-3x light-blue1 s-2008"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Location
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-map-marker fa-inverse icon-4x light-blue1 s-1424"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Storage
											Space Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-hdd-o fa-inverse icon-4x light-blue1 s-14"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i>
											Application List
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-th-list fa-inverse icon-3x light-blue1 s-2214"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Content
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-file-text fa-inverse icon-3x light-blue1 s-2214"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i>
											Application Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-cog fa-inverse icon-4x light-blue1 s-14"></i> <a
											href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Mute
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-volume-off fa-inverse icon-4x light-blue1 s-1424"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Record
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="icon-signin fa-inverse icon-4x light-blue1 s-14"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Restore
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="icon-exchange fa-inverse icon-3x light-blue1 s-1814"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>

								<li>
									<div>
										<p class="title bg-blue1">
											<i class="icon-circle fa-inverse light-blue1"></i> Wi-Fi
											Controller
										</p>
									</div>

									<div class="panel-body">
										<i class="fa-wifi fa-inverse icon-4x light-blue1 s-1400"></i>

										<a href="" class="panel-content spotlight">Document</a> <a
											href="" class="panel-content spotlight"
											style="margin-top: 45px;">Download</a>
									</div>
								</li>  

 -->

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

