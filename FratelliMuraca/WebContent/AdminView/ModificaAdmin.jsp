<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<AdminBean> adminList = (LinkedList<AdminBean>) request.getAttribute("adminList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_style.css">
<title>Gestisci Admin - Fratelli Muraca</title>
</head>
<body>
<div class="central-container admin-manager-container">
	<div class="container-title">
	    Gestione Admin
	</div>
	<a class="go-back" href="admin">&#171 Dashboard</a>
	<table>
	    <tr>
	        <th>Id</th>
	        <th>User</th>
	        <th>Action</th>
	    </tr>
	    <% if (adminList != null && !adminList.isEmpty()) {
	        for (AdminBean externalAdmin : adminList) {
	            String actionLink = (externalAdmin.getId() != 1) 
	                                ? "<a href= '?action=modificaAdmin&op=remove&id=" + externalAdmin.getId() + "'>Rimuovi</a>" 
	                                : "";
	    %>
	    <tr>
	        <td><%= externalAdmin.getId() %></td>
	        <td><%= externalAdmin.getUsername() %></td>
	        <td><%= actionLink %></td>
	    </tr>
	    <% }
	    } %>
	</table>
</div>
</body>
</html>