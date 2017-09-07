<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>   
<%@ page import="org.apache.commons.fileupload.*"%> 
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>   
<%@ page import="java.util.HashMap"%>   
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%> 
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*"%>    
<%@ page import="more.*"%>    

    
<%@include file="../../console/loginValid.jsp"%>    
    
<%
    final String strHostUrl = request.getRequestURL().toString();
    /** Web Tracker **/
    More.webTracker(request, "load progress page", null);
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MORE PROGRESS</title>

</head>
<body>

<%
	String strEmail = (String) session.getAttribute("Email");
	String strAppId = null;
	String strAppIcon = null;
	String strAppName = null;
	String strAppOs = null;
	String strAppCategory = null;
	String strUserName = null;
	String strUserEmail = null;
	String strUserPhone = null;

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
				Logs.showTrace("****update****" );
				itemUploadFileArray.add(item);
			    }
			} // while
			   
			String strFName = null;
			String strFN = null;
			mapData.put(More.Common.APP_ICON, More.Common.UPLOAD_FILE_PATH + "/app_icon_default.png");
			strAppId = mapData.get(More.Common.APP_ID);
			strAppName = mapData.get(More.Common.APP_NAME);
		//	Logs.showTrace("line 88 strAppName = mapData.get(More.Common.APP_NAME);: " + strAppName);
			strAppOs = mapData.get(More.Common.APP_OS);
			strAppCategory = mapData.get(More.Common.APP_CATEGORY);
			strUserName = mapData.get(More.Common.USER_NAME);
			strUserEmail = mapData.get(More.Common.USER_EMAIL);
			strUserPhone = mapData.get(More.Common.USER_PHONE);
			    
			for (int i = 0; i < itemUploadFileArray.size(); i++) {
				Logs.showTrace("*******" + itemUploadFileArray.get(i).getName());
				Logs.showTrace("*******" + itemUploadFileArray.get(i).getContentType());
				Logs.showTrace("*******" + itemUploadFileArray.get(i).getFieldName());
				
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
					String strPath = saveDirectory + "/" + strEmail;

					Logs.showTrace(" fieldName:"+fieldName);
					if (contentType.trim().equals("image/png"))
					{
					    strFN = strAppId + ".png";
					}
					else if (contentType.trim().equals("image/jpeg"))
					{
					    strFN = strAppId + ".jpg";
					}
					
					
					if (null != strFN)
					{
					    new File(strPath).mkdirs();
					    File uploadedFile = new File(strPath, strFN);
					    itemUploadFile.write(uploadedFile);
					    mapData.put(More.Common.APP_ICON, More.Common.UPLOAD_FILE_PATH + "/" + strEmail + "/" + strFN);
					    strAppIcon = More.Common.UPLOAD_FILE_PATH + "/" + strEmail + "/" + strFN;
					    
					    Logs.showTrace("FN: "+strFN);
					    Logs.showTrace("Path: "+strPath);
					}
					else
					{
					    response.sendRedirect("error.html"); //insert error page 
					    return;
					}
				    }
				}// if
				}//for
				
			
			Logs.showTrace("Update App Data to Database, Member Email: " + strEmail + ", App ID: " + strAppId);
			Logs.showTrace("AppIcon: " + strAppIcon);

		//	sqliteClient sqlite = new sqliteClient();
		//	Connection con = sqlite.getConnection(More.Common.DB_PATH_IDEAS);
			
			More more = new More();
			 if (StringUtility.isValid(strEmail) && StringUtility.isValid(strAppId))
			 {
			     if(null == strAppIcon)
				   strAppIcon = "/uploadfile/app_icon_default.png";
			     if(null == strAppName)
				   strAppName = "";
			     if(null == strAppOs)
				   strAppOs = "";
			     if(null == strAppCategory)
				   strAppCategory = "";
			     if(null == strUserName)
				   strUserName = "";
			     if(null == strUserEmail)
				   strUserEmail = "";
			     if(null == strUserPhone)
				   strUserPhone = "";
			     
			     Logs.showTrace("AppIcon: " + strAppIcon);
			     Logs.showTrace("AppName: " + strAppName);
			     
			more.mUpdateApp(request, strEmail, strAppId, strAppIcon, strAppName, strAppOs, strAppCategory, strUserName, strUserEmail, strUserPhone);
			 } 
			 
			more = null;
		//	con.close(); 
		//	sqlite = null;
		
	    }
	 
	 
	 if (StringUtility.isValid(strAppId))
		{
	    response.sendRedirect("app_list.jsp");
		}
		else
		{
		    response.sendRedirect("error.jsp");
		}
%>

</body>
</html>