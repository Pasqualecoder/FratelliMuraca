<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<AdminBean> adminList = (LinkedList<AdminBean>) request.getAttribute("adminList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestisci Admin - Fratelli Muraca</title>
</head>
<body>
<h2> Gestione admin </h2>
<p> lista degli admin </p>
<table border="1">
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
<!-- 1 mostrare gli admin
 recuperarli dal bean
 fare una ul e mostrarla schermo -->

</body>
</html>