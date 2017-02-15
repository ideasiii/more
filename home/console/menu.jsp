<%
		     String strEmail = (String) session.getAttribute("Email");
		    final Integer groupLevel = (Integer) session.getAttribute("Group Level");

		    boolean bLogined = false;
		    boolean bManager = false;

		    More more = new More();

		    if (null != strEmail)
				bLogined = true;

		    if (null != groupLevel && groupLevel == 1)
				bManager = true;
		%>
		<!-- HEADER SECTION -->
		<div id="top">

			<nav class="navbar navbar-inverse navbar-fixed-top"
				style="background-color: rgba(86, 99, 100, 0.89);">

				<!-- LOGO SECTION -->
				<header>
					<div class="header-angle navbar-brand">
						<a href="/more/home/console/home.jsp" class="navbar-brand"> <img class="logo"
							height="80" src="/assets/img/more_logo_white_board_sm.png" alt="" />
						</a>
					</div>
					<!-- END LOGO SECTION -->

					<!-- LOGIN SECTION  -->
					<div class="super-header gradient-blue">
						<ul class="super-header-ul">

							<%
							    if (bLogined == true)
							    {
							%>
							<li class="super-header-li"><a class="super-header-a"
								href="/more/home/console/logout.jsp">Logout</a></li>
							<%
							    if (bManager == true)
									{
							%>
							<li class="super-header-li"><a class="super-header-a"
								href="/more/more_manager/manager/mainpage.jsp"><i
									class="icon-gear fa-inverse"></i></a></li>
							<%
							    }
							    }
							    else
							    {
							%>
							<li class="super-header-li"><a class="super-header-a"
								href="/more/home/console/login.jsp">Login</a></li>
							<li class="super-header-li"><a class="super-header-a"
								href="/more/home/console/signup.jsp">Sign Up</a></li>
							<%
							    }
							%>
						</ul>
					</div>
					<!-- END LOGIN SECTION  -->

					<!-- MENU SECTION  -->
					<div class="menu gradient-gray">
						<div class="row">
							<div class="col-sm-9" style="text-align: center; float: right;">
								<ul class="menu-header">
									<li class="menu-header-li"><a href=""
										class="menu-header-a"> PLATFORM </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a href="">MORE MDM</a></li>
											<li class="dropdown-menu-li"><a href="">MORE API</a></li>
										</ul></li>

									<li class="menu-header-li"><a href=""
										class="menu-header-a"> DASHBOARD </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a href="/more/Dashboard/trackerdata_query.jsp">Traker Data</a></li>
											<li class="dropdown-menu-li"><a href="">ANALYSIS</a></li>
											<li class="dropdown-menu-li"><a href="">ASFDGFHVGH</a></li>
										</ul></li>

									<li class="menu-header-li"><a href=""
										class="menu-header-a"> RESOURCES </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li" id="3level-sdk"><a href="/more/home/console/moreSDKandroid.jsp">MORE
													SDK</a>
												</li>
											<li class="dropdown-menu-li"><a href="">ASFGHJMK</a></li>
											<li class="dropdown-menu-li"><a href="">ASFDGFHVGH</a></li>
											<li class="dropdown-menu-li"><a href="">QWERYU</a></li>
											<li class="dropdown-menu-li"><a href="">ASFGHJMK</a></li>
											<li class="dropdown-menu-li"><a href="">ASFDGFHVGH</a></li>
										</ul></li>

									<li class="menu-header-li"><a href=""
										class="menu-header-a"> DEVELOPER </a>
										<ul class="dropdown-menu-container">
											<li class="dropdown-menu-li"><a href="">QWERYU</a></li>
										</ul></li>

								</ul>
							</div>
						</div>
					</div>
					<!-- END MENU SECTION  -->
				</header>
			</nav>
		</div>
		<!-- END HEADER SECTION -->