<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Under Construction</title>

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

</head>
<body class="padTop53">

<%

//final String strAToken = request.getParameter("accessToken");
final String strClientId = request.getParameter("clientId");
final String strURL = request.getParameter("returnURL");


out.println("clientId: " + strClientId + " URL: " + strURL); 

%>
  <div class="container">
       
<div class="col-lg-12 title">
            <h2  >Our Site Is <span class="">U</span>nder <span class="">C</span>onstruction</h2>
          We are done with the backend just front end to go.
          </div>
          <br /><br />


      </div>
</body>
</html>