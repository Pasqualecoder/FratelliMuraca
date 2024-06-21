<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
<meta charset="UTF-8">
<title>Dashboard Admin - Fratelli Muraca</title>
</head>
<body>
<div class="dashboard-container central-container">
    <div class="container-title">
        Benvenuto
    </div>
    <ul>
    	<li><a href="#">Opzione 1</a></li>
    	<li><a href="#">Opzione 1</a></li>
    	<li><a href="#" id="logout-link">Log Out</a></li>
    </ul>
    </div>
</div>
</body>
</html>