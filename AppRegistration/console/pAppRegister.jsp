<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>
<%@ page import="more.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>

<%
    final String strHostUrl = request.getRequestURL().toString();
    /** Web Tracker **/
    More.webTracker(request, "load page", null);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>>MORE PROGRESS</title>


</head>
<body>

	<%
	    //Check that we have a file upload request
	    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	    if (isMultipart)
	    {
			String saveDirectory = application.getRealPath(More.Common.UPLOAD_FILE_PATH);

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

			while (iter.hasNext())
			{
			    FileItem item = (FileItem) iter.next();
			    if (item.isFormField())
			    {
				String strName = item.getFieldName();
				String strValue = item.getString();
				strValue = new String(strValue.getBytes("ISO-8859-1"), "UTF-8");
				mapData.put(strName.trim(), strValue.trim());
				Logs.showTrace("KEY: " + String.valueOf(strName.trim()) + " VALUE: " + String.valueOf(strValue.trim()));
			    }
			    else
			    {
				itemUploadFileArray.add(item);
			    }
			} // while

			long timeNow = System.currentTimeMillis();
			String strFileName = String.valueOf(timeNow);
			String strFName = null;
			String strFN = null;
			mapData.put(More.Common.APP_ICON, More.Common.UPLOAD_FILE_PATH + "/app_icon_default.png");
			
			for (int i = 0; i < itemUploadFileArray.size(); i++) {
				Logs.showTrace("*******" + itemUploadFileArray.get(i).getName());
				Logs.showTrace("*******" + itemUploadFileArray.get(i).getContentType());
				Logs.showTrace("*******" + itemUploadFileArray.get(i).getFieldName());
				Logs.showTrace("**********************************************");
			
				
				FileItem itemUploadFile = itemUploadFileArray.get(i);
			if (null != itemUploadFile)
			{
			    // Process a file upload
			    String fieldName = itemUploadFile.getFieldName();
			    String fileName = itemUploadFile.getName();
			    String contentType = itemUploadFile.getContentType();
			    //boolean isInMemory = itemUploadFile.isInMemory();
			    long sizeInBytes = itemUploadFile.getSize();

			    //	out.println(contentType); 

			    if (fileName != null && !"".equals(fileName) && 0 < sizeInBytes)
			    {
				String strPath = saveDirectory + "/" + mapData.get(More.Common.USER_TOKEN);

				Logs.showTrace(" fieldName:"+fieldName);
				if (contentType.trim().equals("image/png"))
				{
				    strFN = strFileName + ".png";
				}
				else if (contentType.trim().equals("image/jpeg"))
				{
				    strFN = strFileName + ".jpg";
				}
				
				
				if (null != strFN)
				{
				    new File(strPath).mkdirs();
				    File uploadedFile = new File(strPath, strFN);
				    itemUploadFile.write(uploadedFile);
				    mapData.put(More.Common.APP_ICON, More.Common.UPLOAD_FILE_PATH + "/" + mapData.get(More.Common.USER_TOKEN) + "/" + strFN);
				}
				else
				{
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
			
			final String strToken = mapData.get(More.Common.USER_TOKEN);
			final String strAppName = mapData.get(More.Common.APP_NAME);
			final String strAppOs = mapData.get(More.Common.APP_OS);
			final String strAppCategory = mapData.get(More.Common.APP_CATEGORY);
			final String strUserName = mapData.get(More.Common.USER_NAME);
			final String strUserEmail = mapData.get(More.Common.USER_EMAIL);
			final String strUserPhone = mapData.get(More.Common.USER_PHONE);
		
			
			
			
			
	%>








	<%
	    return;
	    }
	    response.sendRedirect(".jsp");
	%>
</body>
</html>