
<%
    String strEmailValid = (String) session.getAttribute("Email");

    boolean bLoginedValid = false;

    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);
    //System.out.println(pageName);
    
    
    
    if (null != strEmailValid)
		bLoginedValid = true;
    else
    {
	
	if (!pageName.contains("login.jsp"))
	{
	response.sendRedirect("/more/home/console/login.jsp");
	}
    }
    
%>
