<%@ page contentType="text/html; charset=utf-8" language="java"
	session="false"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="mdmjava.*"%>



<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" />
<title>MDM PROGRESS</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- JavaScript -->
<script src="js/formverify.js"></script>

</head>
<body>

	<%
	    //Check that we have a file upload request
				boolean isMultipart = ServletFileUpload.isMultipartContent(request);
				if (isMultipart) {
					String saveDirectory = application.getRealPath(Common.UPLOAD_FILE_ANDROID_MANAGE_APP_PATH);

					// Create a factory for disk-based file items
					FileItemFactory factory = new DiskFileItemFactory();
					// Create a new file upload handler
					ServletFileUpload upload = new ServletFileUpload(factory);
					// Parse the request
					@SuppressWarnings("unchecked")
					List<FileItem> items = upload.parseRequest(request);

					// Process the uploaded items
					Iterator<FileItem> iter = items.iterator();
					HashMap<String, String> mapData = new HashMap<String, String>();
					ArrayList<FileItem> itemUploadFileArray = new ArrayList<FileItem>();

					while (iter.hasNext()) {
						FileItem item = (FileItem) iter.next();
						if (item.isFormField()) {
							String strName = item.getFieldName();
							String strValue = item.getString();
							strValue = new String(strValue.getBytes("ISO-8859-1"), "UTF-8");
							mapData.put(strName.trim(), strValue.trim());
							Logs.showTrace("KEY: " + String.valueOf(strName.trim()) + " VALUE: "
									+ String.valueOf(strValue.trim()));
						} else {

							itemUploadFileArray.add(item);
						}
					} // while

					long timeNow = System.currentTimeMillis();
					String strFileName = String.valueOf(timeNow);
					String strFName = null;
					mapData.put(Common.APP_ICON, Common.UPLOAD_FILE_ANDROID_MANAGE_APP_PATH + "/app_icon_default.png");

					for (int i = 0; i < itemUploadFileArray.size(); i++) {
						Logs.showTrace("*******" + itemUploadFileArray.get(i).getName());
						Logs.showTrace("*******" + itemUploadFileArray.get(i).getContentType());
						Logs.showTrace("*******" + itemUploadFileArray.get(i).getFieldName());
						Logs.showTrace("**********************************************");

						FileItem itemUploadFile = itemUploadFileArray.get(i);
						if (null != itemUploadFile) {
							String strFN = null;
							String strIN = null;
							String strContentType = null;

							// Process a file upload
							String fieldName = itemUploadFile.getFieldName();
							String fileName = itemUploadFile.getName();
							String contentType = itemUploadFile.getContentType();
							//boolean isInMemory = itemUploadFile.isInMemory();
							long sizeInBytes = itemUploadFile.getSize();

							//out.println(contentType);

							if (fileName != null && !"".equals(fileName) && 0 < sizeInBytes) {
								String strPath = saveDirectory + "/" + mapData.get("userId_Android") + "/"
										+ mapData.get(Common.GROUP_ID);

								Logs.showTrace(" fieldName:"+fieldName);
								if (fieldName != null && fieldName.equals("app_icon")) 
								{
								 
									if (contentType.trim().equals("image/png"))
									{
										strIN = strFileName + ".png";
										strContentType = "PNG";
									}
									else if (contentType.trim().equals("image/jpeg")) 
									{
										strIN = strFileName + ".jpg";
										strContentType = "JPG";
									}

									if (null != strIN) {
										new File(strPath).mkdirs();
										File uploadedFile = new File(strPath, strIN);
										itemUploadFile.write(uploadedFile);
										mapData.put(Common.APP_ICON,
												Common.UPLOAD_FILE_ANDROID_MANAGE_APP_PATH + "/"
														+ mapData.get("userId_Android") + "/" + mapData.get(Common.GROUP_ID)
														+ "/" + strIN);
									}
								}
								

								else if (fieldName != null && fieldName.equals("apk_file_name")) 
								{

									try 
									{
										String strExtension = itemUploadFile.getName().substring(
												itemUploadFile.getName().length() - 4, itemUploadFile.getName().length());
										Logs.showTrace("&&&&:" + strExtension);

										if (strExtension.trim().equals(".apk")) 
										{

											if (contentType.trim().equals("application/vnd.android.package-archive")||contentType.trim().equals("application/octet-stream")) 
											{
												strFN = strFileName + ".apk";
											}
											

											if (null != strFN) 
											{
												new File(strPath).mkdirs();
												File uploadedFile = new File(strPath, strFN);
												itemUploadFile.write(uploadedFile);
												mapData.put(Common.FILE_LOCATION,
														Common.UPLOAD_FILE_ANDROID_MANAGE_APP_PATH + "/"
																+ mapData.get("userId_Android") + "/"
																+ mapData.get(Common.GROUP_ID) + "/" + strFN);
												
												strFName = strFileName;
											}
											
										}
										else 
										{
											response.sendRedirect("error.html"); //insert error page 
											return;
										}
									} 
									catch (Exception e) 
									{
									    response.sendRedirect("error.html"); //insert error page 
										Logs.showError(e.toString());
										return;
									}

								}
								else
								{
									response.sendRedirect("error.html"); //insert error page 
									return;
								}
							}
						}
					}
					/*
					for (Object key : mapData.keySet()) {
						System.out.println(key + " : " + mapData.get(key) + "<br/>");
					}
					*/
					final String strEmail = mapData.get(Common.USER_EMAIL);
					final String strUserId_Android = mapData.get("userId_Android");
					final String strGroupId = mapData.get(Common.GROUP_ID);
					final String strAppName = mapData.get(Common.APP_NAME);
					final String strCategory = mapData.get(Common.CATEGORY);
					final String strEdition = mapData.get(Common.EDITION);
					final String strDescription = mapData.get(Common.DESCRIPTION);
					final String strAppIcon = mapData.get(Common.APP_ICON);
					final String strFileLocation = mapData.get(Common.FILE_LOCATION);

					Logs.showTrace(
							"Insert App Data to Database, USER_ID:" + strUserId_Android + ", GROUP_ID:" + strGroupId);
					Logs.showTrace("FileLocation:" + strFileLocation + ", AppIcon:" + strAppIcon);
					Mdm mdm = new Mdm();

					if (!mdm.conTypeDB(0)) {
						response.sendRedirect("error.html"); //insert error page 
						return;
					}
					mapData.put(Common.APK_FILE_NAME, strFName);
					int nResult = mdm.insertAppManage(strGroupId, strAppName, strCategory, strEdition, strDescription,
							strAppIcon, strFName, strFileLocation);

					mdm.closeTypeDB(0);
					mdm = null;
	%>

	<form action="group_management.jsp" method="post" name="FormHome"
		id="FormHome">
		<input name="<%=Common.USER_EMAIL%>" type="hidden"
			value="<%=strEmail%>" />
	</form>

	<script>
		formSubmit('FormHome');
	</script>

	<%
	    return;
	    }
	    response.sendRedirect("index.jsp");
	%>
</body>
</html>
