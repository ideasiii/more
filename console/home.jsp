<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="more.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>

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
<title>MORE | Multi-Object Robotification Enabler</title>
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


		<!--PAGE CONTENT -->
		<img width="100%" src="/assets/img/bg-col-xl-shape-thin.jpg" alt="" />

		<div id="content">
			<div class="inner" style="min-height: 700px; padding: 0;">
				<div id="intro" class="full-height-outer bg-grey full-height-s">
					<div class="silk-white">
						<div class="container">
							<div class="row container-text-r">

								<h2 style="font-weight: bold; padding-right: 20px;">
									<span style="color: #001075; font-size:38px;">M</span><span>ulti-</span><span
										style="color: #001075; font-size:38px;">O</span>bject <span
										style="color: #001075; font-size:38px;">R</span>obotification <span
										style="color: #001075; font-size:38px;">E</span>nabler 
								</h2>
								<h3 style="font-weight: bold;" class="vline-right-orange">
									<p>智能裝置連網服務 BIOT設計&開發工具</p>
									<p>多元數據使用者需求趨勢分析</p>
									<p>打造專屬 Bot+IOT解決方案</p>
								</h3>

							</div>
						</div>
					</div>
					<div class="photoframe">
						<img src="/assets/img/sample1.png" class="photo">
					</div>

				</div>

				<div id="" class="full-height-outer bg-white">

					<div class="silk-grey-l">
						
							
<img id="Image-Maps-Com-image-maps-2017-05-02-223807" style="width:100%; height:auto;" src="/assets/img/flowchat.png" border="0" width="1900" height="1001" orgWidth="1900" orgHeight="1001" usemap="#image-maps-2017-05-02-223807" alt="" />
<map name="image-maps-2017-05-02-223807" id="ImageMapsCom-image-maps-2017-05-02-223807">
<area shape="rect" coords="1898,999,1900,1001" alt="Image Map" style="outline:none;" title="Image Map" href="http://www.image-maps.com/index.php?aff=mapped_users_0" />
<area id="step1" alt="Step1" title="step1" href="scenario1.jsp" shape="poly" coords="256,386,300,378,335,382,357,390,382,399,399,414,414,426,433,449,446,473,454,498,458,527,455,563,446,591,436,612,419,637,394,657,370,672,341,684,301,690,271,687,244,678,217,667,188,644,168,618,151,582,142,540,144,508,153,473,182,429,204,410,230,397" style="outline:none;" target="_self"     />
<area id="step2" alt="Step2" title="step2" href="testpost.jsp" shape="poly" coords="941,419,851,437,774,488,723,565,705,655,723,745,774,822,851,873,941,891,1031,873,1108,822,1159,745,1177,655,1159,565,1108,488,1032,437" style="outline:none;" target="_self"     />
<area id="step3" alt="Step3" title="step3" href="testpost.jsp" shape="poly" coords="1388,105,1337,115,1294,144,1265,187,1255,238,1265,289,1294,332,1337,361,1388,371,1439,361,1482,332,1511,289,1521,238,1511,187,1482,144,1441,115" style="outline:none;" target="_self"     />
<area id="step4" alt="Step4" title="step4" href="/more/Dashboard/tracker_analysis.jsp" shape="poly" coords="1645,529,1583,541,1531,576,1496,628,1484,690,1496,752,1531,804,1583,839,1645,851,1707,839,1759,804,1794,752,1806,690,1794,628,1759,576,1707,541" style="outline:none;" target="_self"     />
</map>

							
					
					</div>
				</div>

				<div id="" class="full-height-outer bg-white full-height-m">
					<div class="silk-grey-l">
						<div class="container">
							<div class="row container-text-l">

								<h2 style="font-weight: bold; padding-right: 20px;">Resources</h2>
								<h3 style="font-weight: bold;" class="vline-left-green">
									<p>將多項服務與應用包裝成多個獨立的模組</p>
									<p>提供給APP開發人員加入到APP專案裡</p>
									<p>透過API呼叫即可執行多種應用與服務</p>
								</h3>

							</div>
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
	<script src="/assets/plugins/flot/jquery.flot.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="/assets/plugins/flot/jquery.flot.stack.js"></script>

	<script src="/assets/js/jquery.rwdImageMaps.js"></script>
	<script>
    $(document).ready(function(e) {
       $('img[usemap]').rwdImageMaps();
    });
	</script>
	<!-- <script src="/assets/js/for_index.js"></script> -->
	<!-- END PAGE LEVEL SCRIPTS -->

</body>
</html>
<%
    more = null;
%>