<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard Admin - Fratelli Muraca</title>
</head>
<body>
	Benvenuto <%= admin.getUsername() %>
	<a href="./admin?action=catalogo">modifica catalogo</a>
	<a href="logout">logout</a>
</body>
</html>