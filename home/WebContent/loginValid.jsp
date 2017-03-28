<%@ page import="more.*"%>
<%
    String strEmailValid = (String) session.getAttribute("Email");

    boolean bLogined = false;

    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
    //System.out.println(pageName);
    
    
    
    if (null != strEmailValid)
		bLogined = true;
    else
    {
	
	if (!pageName.contains("login.jsp"))
	{
	response.sendRedirect("/more/home/console/login.jsp");
	}
    }
    
%>