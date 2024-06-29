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
<div class="central-container" id="dashboard-container">
    <div class="page-title">
        Benvenuto <%= admin.getUsername() %>
    </div>
    <div id="action-section">

        <ul class="action-links">
            <li><a href="./catalogo">Gestione <strong>Catalogo</strong></a></li>
            <li><a href="./manageImages">Gestione <strong>Immagini</strong></a></li>
            <% if (admin.getId() == 1) { %>
                <li><a href="./manageAdmin">Gestione <strong>Admin</strong></a></li>
            <% } %>
            <li><a href="./manageUser">Gestione <strong>Utenti</strong></a></li>
            <li><a href="./manageReview">Gestione <strong>Recensioni</strong></a></li>
            <li><a href="./manageOrder">Gestione <strong>Ordini</strong></a></li>
			<br><br>
            <li><a href="/FratelliMuraca/logout"><b>Logout</b></a></li>
        </ul>
    </div>
</div>
</body>
</html>