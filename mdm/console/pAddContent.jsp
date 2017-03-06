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
<%@ page import="more.*"%>



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
					String saveDirectory = application.getRealPath(Mdm.Common.UPLOAD_FILE_ANDROID_MANAGE_CONTENT_PATH);

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
					FileItem itemUploadFile = null;

					while (iter.hasNext()) {
						FileItem item = (FileItem) iter.next();
						if (item.isFormField()) {
							String strName = item.getFieldName();
							String strValue = item.getString();
							strValue = new String(strValue.getBytes("ISO-8859-1"), "UTF-8");
							mapData.put(strName.trim(), strValue.trim());
							Logs.showTrace("KEY: "+String.valueOf(strName.trim())+ " VALUE: "+String.valueOf(strValue.trim()));
						} else {
							itemUploadFile = item;
						}
					} // while

					long timeNow = System.currentTimeMillis();
					String strFileName = String.valueOf(timeNow);
					String strFN = null;
					String strContentType = null;

					if (null != itemUploadFile) 
					{
						// Process a file upload
						String fieldName = itemUploadFile.getFieldName();
						String fileName = itemUploadFile.getName();
						String contentType = itemUploadFile.getContentType();
						//boolean isInMemory = itemUploadFile.isInMemory();
						long sizeInBytes = itemUploadFile.getSize();

						//	out.println(contentType); 

						if (fileName != null && !"".equals(fileName) && 0 < sizeInBytes) {
							String strPath = saveDirectory + "/" + mapData.get("userId_Android") + "/"
									+ mapData.get(Mdm.Common.GROUP_ID);

							if (contentType.trim().equals("image/png")) {
								strFN = strFileName + ".png";
								strContentType = "PNG";
							}
							if (contentType.trim().equals("image/jpeg")) {
								strFN = strFileName + ".jpg";
								strContentType = "JPG";
							}
							if (contentType.trim().equals("image/bmp")) {
								strFN = strFileName + ".bmp";
								strContentType = "BMP";
							}
							if (contentType.trim().equals("image/gif")) {
								strFN = strFileName + ".gif";
								strContentType = "GIF";
							}
							if (contentType.trim().equals("application/msword")) {
								strFN = strFileName + ".doc";
								strContentType = "DOC";
							}
							if (contentType.trim()
									.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")) {
								strFN = strFileName + ".docx";
								strContentType = "DOCX";
							}
							if (contentType.trim().equals("application/vnd.ms-excel")) {
								strFN = strFileName + ".xls";
								strContentType = "XLS";
							}
							if (contentType.trim()
									.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
								strFN = strFileName + ".xlsx";
								strContentType = "XLSX";
							}
							if (contentType.trim().equals("application/vnd.ms-powerpoint")) {
								strFN = strFileName + ".ppt";
								strContentType = "PPT";
							}
							if (contentType.trim()
									.equals("application/vnd.openxmlformats-officedocument.presentationml.presentation")) {
								strFN = strFileName + ".pptx";
								strContentType = "PPTX";
							}
							if (contentType.trim().equals("text/plain")) {
								strFN = strFileName + ".txt";
								strContentType = "TXT";
							}
							if (contentType.trim().equals("application/pdf")) {
								strFN = strFileName + ".pdf";
								strContentType = "PDF";
							}
							if (null != strFN) {
								new File(strPath).mkdirs();
								File uploadedFile = new File(strPath, strFN);
								itemUploadFile.write(uploadedFile);
								mapData.put(Mdm.Common.FILE_LOCATION, Mdm.Common.UPLOAD_FILE_ANDROID_MANAGE_CONTENT_PATH + "/"
										+ mapData.get("userId_Android") + "/" + mapData.get(Mdm.Common.GROUP_ID) + "/" + strFN);
							} else {
								  response.sendRedirect("error.html"); //insert error page 
								return;
							}
						}
					}
					/*
										for (Object key : mapData.keySet()) {
											System.out.println(key + " : " + mapData.get(key) + "<br/>");
										}
					*/
					final String strEmail = mapData.get(Mdm.Common.USER_EMAIL);
					final String strUserId_Android = mapData.get("userId_Android");
					final String strGroupId = mapData.get(Mdm.Common.GROUP_ID);
					final String strAlias = mapData.get(Mdm.Common.ALIAS);
					final String strFileLocation = mapData.get(Mdm.Common.FILE_LOCATION);

					Logs.showTrace(
							"Insert Content Data to Database, USER_ID:" + strUserId_Android + ", GROUP_ID:" + strGroupId);
					Mdm mdm = new Mdm();

					if (!mdm.conTypeDB(0)) {
						response.sendRedirect("error.html"); //insert error page 
						return;
					}
					mapData.put(Mdm.Common.FILE_NAME, strFileName);
					int nResult = mdm.insertContentManage(strGroupId, strAlias, strContentType, strFN, strFileLocation);

					mdm.closeTypeDB(0);
					mdm = null;
	%>

	<form action="group_management.jsp" method="post" name="FormHome"
		id="FormHome">
		<input name="<%=Mdm.Common.USER_EMAIL%>" type="hidden"
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
