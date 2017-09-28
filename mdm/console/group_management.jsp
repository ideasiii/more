<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@page import=" java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="more.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>


<%@include file="../../home/console/loginValid.jsp"%>
<%
    final String strHostUrl = request.getRequestURL().toString();

			/** Web Tracker **/
			More.webTracker(request, "load page", null);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Group Management | MDM</title>


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
<link href="/more/css/plugins/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet" href="/more/css/bootstrap-fileupload.min.css" />
<!-- END PAGE LEVEL  STYLES -->

<!-- JavaScript -->
<script src="js/formverify.js"></script>
<script type="text/javascript">

</script>

</head>


<body class="padTop53">

	<!-- MAIN WRAPPER -->
	<div id="wrap" style="display: table; width: 100%; height: 100%;">

		<%@include file="../../home/console/menu.jsp"%>

		<%
		    final String strContextPath = request.getContextPath();
					//strEmail = "juliettechien@iii.org.tw";//request.getParameter(Mdm.Common.USER_EMAIL);
					String strGroupId = request.getParameter(Mdm.Common.GROUP_ID);
					String strShowContent = request.getParameter("SHOW_CONTENT");
					String strShowApp = request.getParameter("SHOW_APP");
					String strShowGN = request.getParameter(Mdm.Common.GROUP_NAME);
					String strAccountV = "";

					ArrayList<String> listPermissionName = new ArrayList<String>();

					ArrayList<Mdm.PermissionData> listPermission = new ArrayList<Mdm.PermissionData>();
					Mdm.PermissionData permissionData = null;
					String strUserId_Android = null;

					Iterator<Mdm.PermissionData> itPD = null;
					
					/********** group info **************/
					Iterator<Mdm.GroupData> itGD = null;
					Mdm.GroupData groupData = null;
					ArrayList<Mdm.GroupData> listGroup = new ArrayList<Mdm.GroupData>();

					/********** app manager info **************/
					Iterator<Mdm.AppData> itAD = null;
					Mdm.AppData appData = null;
					String strAppIconPath = null;
					ArrayList<Mdm.AppData> listApp = new ArrayList<Mdm.AppData>();

					/********** content manager info **************/
					Iterator<Mdm.ContentData> itCD = null;
					Mdm.ContentData contentData = null;
					ArrayList<Mdm.ContentData> listContent = new ArrayList<Mdm.ContentData>();
					

					Mdm mdm = new Mdm();

					if (!mdm.conDB(request)) {
						response.sendRedirect("error.html"); //insert error page 
						return;
					}

					int nCount = mdm.queryPermission(request, strEmail, listPermission);
					//nCount = 0;
					if (0 < nCount) {

						itPD = listPermission.iterator();

						while (itPD.hasNext()) {
							permissionData = itPD.next();
							listPermissionName.add(permissionData.permission);

							if (permissionData.permission.trim().equals("android")) {
								strUserId_Android = permissionData.user_id;

								if (!mdm.conTypeDB(request, 0)) {
									response.sendRedirect("error.html"); //insert error page 
									return;
								}

								/********** group dropdown select**************/

								int nGCount = mdm.queryGroup(request, permissionData.user_id, listGroup);
								//out.println(nGCount);

								if (0 < nGCount) {

									More.webTracker(request, "queryGroup success ", "GroupCount: " + nGCount);
								} else {
									More.webTracker(request, "queryGroup failed ", "GroupCount: " + nGCount);
								}

								/********** group list table**************/

								/**	Iterator<Mdm.GroupData> itGD2 = null;
											Mdm.GroupData groupData2 = null;
								
											ArrayList<Mdm.GroupData> listGroup2 = new ArrayList<Mdm.GroupData>();
											int nGCount2 = mdm.queryGroup(request, permissionData.user_id, listGroup);
								
											itGD2 = listGroup2.iterator();*/

								/********** App Manager **************/

								int nACount = mdm.queryApp(request, strGroupId, listApp);
								//out.println(nACount);

								if (0 < nACount) {

									More.webTracker(request, "queryApp success ", "AppCount: " + nACount);
								} else {
									More.webTracker(request, "queryApp failed ",
											"AppCount: " + nACount + " groupID: " + strGroupId);
								}

								/********** Content Manager **************/

								int nCCount = mdm.queryContent(request, strGroupId, listContent);

								
		%>

		<!-- HEADER SECTION -->


		<div class="col-lg-12">
			<div class="modal fade" id="AddGroup" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H3">Create Group</h4>
						</div>
						<div class="modal-body">
							<form role="form" action="pGroupAdd.jsp" name="formAddGroup"
								id="formAddGroup">
								<input name="accountList" id="accountList"
									value="<%=strAccountV%>" type="hidden"> <input
									name="<%=Mdm.Common.USER_EMAIL%>"
									id="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
									value="<%=strEmail%>" /> <input name="userId_Android"
									id="userId_Android" type="hidden"
									value="<%=strUserId_Android%>">
								<div class="form-group">
									<label>Group Name</label> <input class="form-control"
										name="<%=Mdm.Common.GROUP_NAME%>"
										placeholder="Enter your group name" />
									<p class="help-block" style="color: #b94a48;">Notification:
										Group name cannot be changed.</p>
								</div>
								<div class="form-group">
									<label>Login Account</label> <input class="form-control"
										name="<%=Mdm.Common.ACCOUNT%>"
										onchange="showBtnV('formAddGroup')" />
									<button id="btnV" type="button"
										class="btn btn-xs btn-grad btn-default"
										style="margin-top: 10px;"
										onclick="checkAccountListData('formAddGroup')">Verification</button>
									<button id="btnA" type="button" class="btn btn-xs btn-success"
										style="display: none; margin-top: 10px;">Available</button>
									<p class="help-block">(Must be less than 20 letters in
										alphanumeric format.)</p>
								</div>
								<div class="form-group">
									<label>Password</label> <input class="form-control"
										name="<%=Mdm.Common.PASSWORD%>" />
									<p class="help-block">(Must be less than 20 letters in
										alphanumeric format.)</p>
								</div>
								<div class="form-group">
									<label>Max Number of Devices</label> <select
										name="<%=Mdm.Common.MAXIMUM%>" class="form-control">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
									</select>
								</div>

								<div class="form-group">
									<label>Device Type </label> <select
										name="<%=Mdm.Common.PERMISSION%>"
										id="<%=Mdm.Common.PERMISSION%>" class="form-control">
										<%
										    for (int i = 0; i < listPermissionName.size(); ++i) {
																	out.println("<option>" + listPermissionName.get(i) + "</option>");
																}
										%>
									</select>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								onClick="checkGroupAddData('formAddGroup')">Create</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="EditGroup" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H3">
								Edit - <span id="GroupEditName"></span>
							</h4>
						</div>
						<div class="modal-body">
							<form role="form" action="pGroupEdit.jsp" name="formEditGroup"
								id="formEditGroup">
								<input name="accountList" id="accountList"
									value="<%=strAccountV%>" type="hidden"> <input
									name="<%=Mdm.Common.USER_EMAIL%>"
									id="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
									value="<%=strEmail%>" /> <input
									name="<%=Mdm.Common.GROUP_ID%>" id="<%=Mdm.Common.GROUP_ID%>"
									type="hidden" value="<%=strGroupId%>" />
								<div class="form-group">
									<label>Login Account</label> <input name="GroupEditAccount"
										id="GroupEditAccount" class="form-control"
										onchange="showBtnV('formEditGroup')" /> <input
										name="originalAccount" id="originalAccount" type="hidden" />
									<button id="btnV2" type="button"
										class="btn btn-xs btn-grad btn-default"
										style="margin-top: 10px;"
										onclick="checkAccountListData('formEditGroup')">Verification</button>
									<button id="btnA2" type="button" class="btn btn-xs btn-success"
										style="display: none; margin-top: 10px;"
										style="margin-top: 10px;">Available</button>
									<p class="help-block">(Must be less than 20 letters in
										alphanumeric format.)</p>
								</div>
								<div class="form-group">
									<label>Password</label> <input name="GroupEditPassword"
										id="GroupEditPassword" class="form-control" />
									<p class="help-block">(Must be less than 20 letters in
										alphanumeric format.)</p>
								</div>
								<div class="form-group">
									<label>Max Number of Devices</label> <select
										name="GroupEditMaximum" id="GroupEditMaximum"
										class="form-control">
										<option value="5">5</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
									</select>
								</div>

							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								onclick="checkGroupEditData('formEditGroup')">Save
								Changes</button>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="col-lg-12">
			<div class="modal fade" id="DeleteGroup" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Delete Confirm</h4>
						</div>
						<form action="pDeleteGroup.jsp" method="post"
							name="formDeleteGroup" id="formDeleteGroup">
							<input name="<%=Mdm.Common.USER_EMAIL%>"
								id="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
								value="<%=strEmail%>" /> <input name="<%=Mdm.Common.GROUP_ID%>"
								id="<%=Mdm.Common.GROUP_ID%>" type="hidden"
								value="<%=strGroupId%>" />
							<div class="modal-body">
								<span>You have selected to delete "<span
									id="GroupDeleteConfirm"></span>".<br> <span
									style="color: #b94a48;">The following procedures delete
										either all data, or contents and applications (including files
										in the Management) in this group.</span> <br>If this was the
									action that you wanted to do, please confirm your choice, or
									cancel and return to the page.
								</span>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<input type="submit" class="btn btn-danger" value="Delete">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="AppManage" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 90%;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="H1">
								Application Management - <span id="AMGroupName"></span>
							</h3>
						</div>
						<div class="modal-body">te velit esse cillum dolore eu
							fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
							proident, sunt in culpa qui officia deserunt mollit anim id est
							laborum.</div>

						<div class="row">
							<div class="col-lg-12">
								<div>
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-bordered table-hover"
												id="dataTables-AM">
												<thead class="toolbar">
													<tr>
														<th>App Name</th>
														<th>Category</th>
														<th>Edition</th>
														<th>Description</th>
														<th>Option</th>
													</tr>
												</thead>
												<tbody>
													<%
														itAD = listApp.iterator();
													    while (itAD.hasNext()) {

																				appData = itAD.next();
																				strAppIconPath = strContextPath + appData.app_icon;
																				//out.println(strAppIconPath);

																				if (null != strGroupId && (strGroupId.trim().equals(appData.group_id.trim()))) {
													%>
													<tr class="odd gradeA">
														<td style="vertical-align: middle;"><img
															src="<%=strAppIconPath%>" vspace="1"
															class="img-responsive"
															style="width: 30px; text-align: center; margin-right: 10px; margin-left: 10px;"
															title="<%=appData.app_name%>"><%=appData.app_name%></td>
														<td class="center" style="vertical-align: middle;"><%=appData.category%></td>
														<td class="center" style="vertical-align: middle;"><%=appData.edition%></td>
														<td class="center" style="vertical-align: middle;"><%=appData.description%></td>
														<td class="center" style="vertical-align: middle;"><button
																onclick="getAppFN('<%=appData.apk_file_name%>','<%=appData.group_id%>','<%=appData.app_name%>')"
																class="btn btn-danger btn-line" title="Delete"
																data-toggle="modal" data-target="#DeleteApp">
																<i class="fa fa-trash-o" aria-hidden="true"></i><span
																	class="sr-only">Delete</span>
															</button></td>
													</tr>
													<%
													    }
																			}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								title="Upload a new app" data-toggle="modal"
								data-target="#UploadApp">
								<i class="fa fa-plus" aria-hidden="true"
									style="margin-right: 5px;"></i><span class="sr-only">Upload
									an new app</span>Upload
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="UploadApp" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="padding-top: 100px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Upload APK</h4>
						</div>
						<div class="modal-body">
							<form role="form" action="pAddApp.jsp" method="post"
								enctype="multipart/form-data" name="formUploadApp"
								id="formUploadApp">
								<input name="<%=Mdm.Common.GROUP_ID%>"
									id="<%=Mdm.Common.GROUP_ID%>" type="hidden" value="" /> <input
									name="userId_Android" type="hidden"
									value="<%=strUserId_Android%>" />

								<div class="col-lg-8" style="float: right;">
									<label class="control-label" style="margin-left: 20px;">App
										Icon</label>
									<div class="fileupload fileupload-new"
										style="text-align: center;" data-provides="fileupload">
										<div class="fileupload-new thumbnail"
											style="width: 60px; height: 60px; border: 0; margin-bottom: 5px;">
											<img src="/assets/img/Apps-Android-icon.png" alt="" />
										</div>
										<div
											class="fileupload-preview fileupload-exists thumbnail form-group"
											style="width: 50px; height: 50px; padding: 0; border: 0; margin-bottom: 10px;"></div>
										<input name="<%=Mdm.Common.APP_ICON%>" id="inputIcon"
											style="margin-left: 20px;" type="file"
											onChange="validateAppIcon(this.value)" />

									</div>
									<br>
									<div class="fileupload fileupload-new">
										<label class="control-label" style="margin-left: 20px;">File
											Input</label> <input name="<%=Mdm.Common.APK_FILE_NAME%>"
											id="inputAPK" type="file" style="margin-left: 20px;"
											onChange="validateAPK(this.value)" />
									</div>
								</div>

								<div class="form-group">
									<label>App Name</label> <input name="<%=Mdm.Common.APP_NAME%>"
										class="form-control" style="width: 40%;" maxlength="10" />
								</div>
								<div class="form-group">
									<label>Edition</label> <input name="<%=Mdm.Common.EDITION%>"
										class="form-control" style="width: 40%;" maxlength="8" />
								</div>
								<div class="form-group">
									<label>Description</label> <input
										name="<%=Mdm.Common.DESCRIPTION%>" class="form-control"
										style="width: 40%;" maxlength="20" />
								</div>
								<div class="form-group">
									<label>Category</label> <select name="<%=Mdm.Common.CATEGORY%>"
										class="form-control" style="width: 40%;" style="height: 34px;">
										<option value="工具">工具</option>
										<option value="天氣">天氣</option>
										<option value="生活品味">生活品味</option>
										<option value="生產應用">生產應用</option>
										<option value="交通運輸">交通運輸</option>
										<option value="社交">社交</option>
										<option value="音樂與音效">音樂與音效</option>
										<option value="個人化">個人化</option>
										<option value="娛樂">娛樂</option>
										<option value="旅遊與地方資訊">旅遊與地方資訊</option>
										<option value="財經">財經</option>
										<option value="健康塑身">健康塑身</option>
										<option value="動態桌布">動態桌布</option>
										<option value="商業">商業</option>
										<option value="教育">教育</option>
										<option value="通訊">通訊</option>
										<option value="媒體與影片">媒體與影片</option>
										<option value="程式庫與試用程式">程式庫與試用程式</option>
										<option value="新聞與雜誌">新聞與雜誌</option>
										<option value="運動">運動</option>
										<option value="圖書與參考資源">圖書與參考資源</option>
										<option value="漫畫">漫畫</option>
										<option value="購物">購物</option>
										<option value="醫療">醫療</option>
										<option value="攝影">攝影</option>
										<option value="遊戲">遊戲</option>
										<option value="家庭">家庭</option>
									</select>
								</div>
							</form>
							<div style="text-align: right;">
								<button type="button" class="btn btn-primary"
									onclick="checkAPKAddData('formUploadApp')">Confirm</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="DeleteApp" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="padding-top: 150px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Delete Confirm</h4>
						</div>
						<form action="pDeleteApp.jsp" method="post" name="formDeleteApp"
							id="formDeleteApp">
							<input name="<%=Mdm.Common.USER_EMAIL%>"
								id="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
								value="<%=strEmail%>" /> <input name="<%=Mdm.Common.GROUP_ID%>"
								id="<%=Mdm.Common.GROUP_ID%>" type="hidden"
								value="<%=strGroupId%>" /> <input
								name="<%=Mdm.Common.APK_FILE_NAME%>"
								id="<%=Mdm.Common.APK_FILE_NAME%>" type="hidden" />
							<div class="modal-body">
								<span> You have selected to delete "<span
									id="DeleteAppName"></span>". <br>If this was the action
									that you wanted to do, please confirm your choice, or cancel
									and return to the page.
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<input type="submit" class="btn btn-danger" value="Delete">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="ContentManage" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 90%;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h3 class="modal-title" id="H1">
								Content Management - <span id="CMGroupName"></span>
							</h3>
						</div>
						<div class="modal-body">te velit esse cillum dolore eu
							fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
							proident, sunt in culpa qui officia deserunt mollit anim id est
							laborum.</div>

						<div class="row">
							<div class="col-lg-12">
								<div>
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover"
												id="dataTables-CM">
												<thead class="toolbar">
													<tr>
														<th>#</th>
														<th>Alias</th>
														<th>Type</th>
														<th>Upload Time</th>
														<th>Option</th>
													</tr>
												</thead>

												<tbody>
													<%
													    int ic = 0;
														itCD = listContent.iterator();
																			while (itCD.hasNext()) {

																				contentData = itCD.next();

																				if (null != strGroupId && (strGroupId.trim().equals(contentData.group_id.trim()))) {
													%>
													<tr class="odd gradeX">
														<td style="vertical-align: middle;"><%=++ic%></td>
														<td style="vertical-align: middle;"><%=contentData.alias%></td>
														<td style="vertical-align: middle;"><%=contentData.content_type%></td>
														<td class="center" style="vertical-align: middle;"><%=contentData.create_time%></td>
														<td class="center"><a
															href="<%="/more" + contentData.file_location%>"
															target="_blank"><button
																	class="btn btn-primary btn-line"
																	style="margin-right: 10px;" title="Preview">
																	<i class="fa fa-eye" aria-hidden="true"></i><span
																		class="sr-only">Preview</span>
																</button></a>
															<button
																onclick="getContentFN('<%=contentData.file_name%>','<%=contentData.group_id%>','<%=contentData.alias%>')"
																class="btn btn-danger btn-line" title="Delete"
																data-toggle="modal" data-target="#DeleteContent">
																<i class="fa fa-trash-o" aria-hidden="true"></i><span
																	class="sr-only">Delete</span>
															</button></td>
													</tr>
													<%
													    }
																			}
													%>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								title="Upload a new file" data-toggle="modal"
								data-target="#UploadContent">
								<i class="fa fa-plus" aria-hidden="true"
									style="margin-right: 5px;"></i><span class="sr-only">Upload
									a new file</span>Upload
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-12">
			<div class="modal fade" id="UploadContent" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="padding-top: 150px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Upload Content</h4>
						</div>
						<div class="modal-body">
							Supported File Formats:
							<p>jpg, gif, bmp, png, doc, docx, ppt, pptx, xls, xlsx, txt,
								pdf.</p>
							<br>
							<form role="form" action="pAddContent.jsp" method="post"
								enctype="multipart/form-data" name="formUploadContent"
								id="formUploadContent">
								<input name="<%=Mdm.Common.GROUP_ID%>"
									id="<%=Mdm.Common.GROUP_ID%>" type="hidden" value="" /> <input
									name="userId_Android" type="hidden"
									value="<%=strUserId_Android%>" />
								<div class="form-group">
									<label>File Alias</label> <input name="<%=Mdm.Common.ALIAS%>"
										id="<%=Mdm.Common.ALIAS%>" class="form-control"
										style="width: 60%;" maxlength="15" />
								</div>
								<div class="form-group">
									<label>File Input</label> <input
										name="<%=Mdm.Common.FILE_NAME%>" id="inputContent" type="file"
										onChange="validateContent(this.value)" />

								</div>
							</form>
							<div style="text-align: right;">
								<button type="button" class="btn btn-primary"
									onclick="checkContentAddData('formUploadContent')">Confirm</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-lg-12">
			<div class="modal fade" id="DeleteContent" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="padding-top: 150px;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="H1">Delete Confirm</h4>
						</div>
						<form action="pDeleteContent.jsp" method="post"
							name="formDeleteContent" id="formDeleteContent">
							<input name="<%=Mdm.Common.USER_EMAIL%>"
								id="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
								value="<%=strEmail%>" /> <input name="<%=Mdm.Common.GROUP_ID%>"
								id="<%=Mdm.Common.GROUP_ID%>" type="hidden"
								value="<%=strGroupId%>" /> <input
								name="<%=Mdm.Common.FILE_NAME%>" id="<%=Mdm.Common.FILE_NAME%>"
								type="hidden" />

							<div class="modal-body">
								<span> You have selected to delete "<span
									id="DeleteContentName"></span>". <br>If this was the
									action that you wanted to do, please confirm your choice, or
									cancel and return to the page.
								</span>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<input type="submit" class="btn btn-danger" value="Delete">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- END HEADER SECTION -->

		<!--PAGE CONTENT -->

		<div id="content">

			<div class="inner" style="margin-top: 25px; min-height: 850px;">
				<div class="row">
					<div class="col-lg-12">
						<br>
						<h1>Group Management</h1>
						<br>
					</div>
				</div>

				<hr />

				<!-- CHAT  SECTION -->
				<div class="row">
					<div class="col-lg-8">
						<div class="panel panel-default">

							<!-- CREATE GROUP -->
							<button class="btn btn-primary button-add blue semi-square"
								style="padding: 5px 10px;" data-toggle="modal"
								data-target="#AddGroup" title="Create a new group">
								<i class="fa fa-plus fa-lg" aria-hidden="true"></i> <span
									class="sr-only">Create a new group</span>
							</button>
							<!--END CREATE GROUP -->

							<!-- GROUP SELECT -->
							<%
							    /*  int nCount = mdm.queryPermission(strEmail, listPermission);
									//nCount = 0;
									if (0 < nCount) {
									Iterator<Mdm.PermissionData> itPD = null;
									itPD = listPermission.iterator();
									
											while (itPD.hasNext()) {
									permissionData = itPD.next();
									listPermissionName.add(permissionData.permission);
																			
								if (permissionData.permission.trim().equals("android")) {
										strUserId_Android = permissionData.user_id;
																																
									if (!mdm.conTypeDB(0)) {
										response.sendRedirect("error.html"); //insert error page 
										return;
										}*/
							%>
							<div class="styled-select blue semi-square"
								style="margin-top: 4px;">
								<select id="groupBar" name="groupBar"
									onchange="location.href=this.options[this.selectedIndex].value">

									<%
									    if (null == strGroupId || null != strShowContent || null != strShowApp)
												{
									%>
									<option value="#">Select Group</option>
									<%
									    }
									                        itGD = listGroup.iterator();
															while (null != itGD && itGD.hasNext()) {
																groupData = itGD.next();
																strAccountV = strAccountV + groupData.account;
																if (itGD.hasNext()) {
																	strAccountV += ',';
																}

																if (null != strGroupId && (strGroupId.trim().equals(groupData.group_id.trim()))) {
									%>
									<option selected
										value="device_management.jsp?<%=Mdm.Common.GROUP_ID%>=<%=groupData.group_id%>&type=android"><%=groupData.group_name%></option>
									<%
									    } else {
									%>

									<option
										value="device_management.jsp?<%=Mdm.Common.GROUP_ID%>=<%=groupData.group_id%>&type=android"><%=groupData.group_name%></option>

									<%
									    }
															}
														}

														///add conTpyeBD else type DB

													} // end while(itPD.hasNext())
													/********* end group info************/
									%>

								</select>
							</div>

							<%
							    } // if
										else {
							%>
							<div class="styled-select blue semi-square">
								<select><option>Please Create a Group</select>
							</div>
							<%
							    }
							%>

							<!--END GROUP SELECT -->

							<div class="panel-heading">Welcome, please select a group
								to start.</div>

						</div>
					</div>
					<!--END CHAT SECTION -->

					<!--  GROUPS FRAME SECTION   -->
					<div class="col-lg-4">
						<div class="chat-panel  ">
							<br>

							<div class="row"></div>
						</div>
						<!--END GROUPS FRAME SECTION  -->

						<!--GRUOP OPTION TABLE  -->
						<div class="row">
							<div class="col-lg-6">
								<div class="box">
									<header>
										<h5>Groups</h5>
										<div class="toolbar">
											<div class="btn-group"></div>
										</div>
									</header>
									<div id="sortableTable" class="body collapse in">
										<table
											class="table table-bordered sortableTable responsive-table">
											<thead>
												<tr>
													<th>#<i class="icon-sort"></i><i
														class="icon-sort-down"></i> <i class="icon-sort-up"></i></th>
													<th>Group Name<i class="icon-sort"></i><i
														class="icon-sort-down"></i> <i class="icon-sort-up"></i></th>
													<th>Connected Devices<i class="icon-sort"></i><i
														class="icon-sort-down"></i> <i class="icon-sort-up"></i></th>
													<th>Maximum of Devices<i class="icon-sort"></i><i
														class="icon-sort-down"></i> <i class="icon-sort-up"></i></th>
													<th>Type<i class="icon-sort"></i><i
														class="icon-sort-down"></i> <i class="icon-sort-up"></i></th>
													<th>Option<i class="icon-sort"></i><i
														class="icon-sort-down"></i> <i class="icon-sort-up"></i></th>
												</tr>
											</thead>
											<tbody>
												<%
												    int gCount = 0;
												            itGD = listGroup.iterator();
															while (null != itGD && itGD.hasNext()) {
																groupData = itGD.next();

																/**if (null != itGD){
																 More.webTracker(request, "itGD ", null);
																}**/
												%>
												<tr>
													<td style="text-align: center; vertical-align: middle;"><%=++gCount%></td>
													<td style="text-align: center; vertical-align: middle;"><%=groupData.group_name%></td>
													<td style="text-align: center; vertical-align: middle;">42</td>
													<td style="text-align: center; vertical-align: middle;"><%=groupData.maximum%></td>
													<td style="text-align: center; vertical-align: middle;">Android</td>
													<td style="text-align: center; padding: 0;"><button
															class="btn btn-default btn-flat btn-xs"
															style="color: #9fd256; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none;"
															data-toggle="modal" data-target="#AppManage"
															onclick="showAppGN('<%=groupData.group_name%>','<%=groupData.group_id%>','<%=strEmail%>')">
															<span class="fa-stack fa-lg"><i
																class="fa fa-circle fa-stack-2x" aria-hidden="true"></i><i
																class="fa fa-android fa-stack-1x fa-inverse"
																title="Application Management"></i></span><span class="sr-only">Application
																Management</span>
														</button>
														<button class="btn btn-default btn-flat btn-xs"
															style="color: #f0ad4e; white-space: nowrap; vertical-align: middle; cursor: pointer; background-image: none;"
															data-toggle="modal" data-target="#ContentManage"
															onclick="showContentGN('<%=groupData.group_name%>','<%=groupData.group_id%>','<%=strEmail%>')">
															<span class="fa-stack fa-lg"><i
																class="fa fa-circle fa-stack-2x" aria-hidden="true"></i>
																<i class="fa fa-file-text fa-stack-1x fa-inverse"
																title="Content Management"></i></span><span class="sr-only">Content
																Management</span>
														</button>
														<button class="btn btn-sm btn-info"
															style="margin-right: 8px; margin-left: 6px;"
															data-toggle="modal" data-target="#EditGroup" title="Edit"
															onclick="showGN('<%=groupData.group_name%>','<%=groupData.group_id%>','<%=groupData.account%>','<%=groupData.password%>','<%=groupData.maximum%>')"
															value="gName">
															<i class="icon-pencil" aria-hidden="true"></i> <span
																class="sr-only">Edit </span> Edit
														</button>
														<button class="btn btn-sm btn-danger" data-toggle="modal"
															data-target="#DeleteGroup" title="Delete"
															onclick="showGN('<%=groupData.group_name%>','<%=groupData.group_id%>','<%=groupData.account%>','<%=groupData.password%>','<%=groupData.maximum%>')"
															value="gName">
															<i class="icon-trash" aria-hidden="true"></i> <span
																class="sr-only">Delete</span>
														</button></td>
												</tr>
												<%
												    }
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!--END GRUOP OPTION TABLE  -->





					</div>
				</div>
			</div>
		</div>
	</div>
	<!--END PAGE CONTENT -->

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
	<script src="assets/plugins/jquery-2.0.3.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-CM').dataTable();
		});
		
		$(document).ready(function() {
			$('#dataTables-AM').dataTable();
		});
	</script>
	<script src="assets/plugins/jasny/js/bootstrap-fileupload.js"></script>

	<%
	    if (null != strShowContent && strShowContent.trim().equals("true")) {
	%>
	<script type="text/javascript"> 
	showGN('<%=strShowGN%>','<%=strGroupId%>');
		$('#ContentManage').modal('show');
	</script>
	<%
	    }

				if (null != strShowApp && strShowApp.trim().equals("true")) {
	%>
	<script type="text/javascript"> 
	showGN('<%=strShowGN%>','<%=strGroupId%>');
	$('#AppManage').modal('show');
	</script>
	<%
	    }
	%>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="assets/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="assets/plugins/dataTables/dataTables.bootstrap.js"></script>
	 <script src="assets/plugins/jasny/js/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

</body>

<form action="group_management.jsp" method="post"
	name="FormHomeShowContent" id="FormHomeShowContent">
	<input name="<%=Mdm.Common.USER_EMAIL%>" type="hidden"> <input
		name="<%=Mdm.Common.GROUP_ID%>" type="hidden"> <input
		name="<%=Mdm.Common.GROUP_NAME%>" type="hidden"> <input
		name="SHOW_CONTENT" type="hidden" value="true">
</form>
<form action="group_management.jsp" method="post" name="FormHomeShowApp"
	id="FormHomeShowApp">
	<input name="<%=Mdm.Common.USER_EMAIL%>" type="hidden"> <input
		name="<%=Mdm.Common.GROUP_ID%>" type="hidden"> <input
		name="<%=Mdm.Common.GROUP_NAME%>" type="hidden"> <input
		name="SHOW_APP" type="hidden" value="true">
</form>
 
</html>
<%
    if (null != mdm && null != request)
    {
		mdm.closeTypeDB(request, 0);
		mdm.closeDB(request);
		mdm = null;
    }

    //	out.println(strAccountV);
%>
