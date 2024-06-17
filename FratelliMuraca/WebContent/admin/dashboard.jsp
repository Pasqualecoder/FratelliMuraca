<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,model.*"
    pageEncoding="ISO-8859-1"%>
<%
AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard Admin Fratelli Muraca</title>
</head>
<body>
	Benvenuto <%= admin.getUsername() %>
	<a href="./admin?action=catalogo">modifica catalogo</a>
</body>
</html>