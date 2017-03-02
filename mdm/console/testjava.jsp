<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mdmjava.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>MDM Java Test</h1>
	<br>

	<%
		Mdm mdm = new Mdm();
		    out.println("Connect DB start<br>");
		    if (mdm.conDB())
		    {
			out.println("Connect DB Success<br>");
			ArrayList<Mdm.PermissionData> listPermission = new ArrayList<Mdm.PermissionData>();
			mdm.queryPermission("juliettechien@iii.org.tw", listPermission);

			for (int i = 0; i < listPermission.size(); ++i)
			{
			    out.println(listPermission.get(i).user_email);
			    out.println("<br>");
			    out.println(listPermission.get(i).permission);
			    out.println("<br>");
			}

			mdm.closeDB();
		    } else
		    {
			out.println("Connect DB Fail<br>");
		    }
		    mdm = null;
	%>
</body>
</html>