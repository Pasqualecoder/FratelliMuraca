<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<AdminBean> adminList = (LinkedList<AdminBean>) request.getAttribute("listaAdmin"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_style.css">
<title>Gestisci Admin - Fratelli Muraca</title>
</head>
<body>
<div class="page-title">
    Gestione Admin
</div>
<div class="central-container" id="dashboard-container">
	<a class="go-back" href="/FratelliMuraca/admin">&#171; Dashboard</a>

<h2>Aggiungi un nuovo admin</h2>
<form action="manageAdmin" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br>
    <button type="submit">Aggiungi Admin</button>
</form>

<h2>Gestione admin</h2>
<p>lista degli admin</p>
<table border="1">
    <tr>
        <th>Id</th>
        <th>User</th>
        <th>Action</th>
    </tr>
    <% if (adminList != null && !adminList.isEmpty()) {
        for (AdminBean externalAdmin : adminList) {%>
    <tr>
        <td><%= externalAdmin.getId() %></td>
        <td><%= externalAdmin.getUsername() %></td>
		<td><a href="./manageAdmin?id=<%= externalAdmin.getId() %>">Rimuovi</a></td> 
    </tr>
    	<%}
    } %>
</table>

</div>

	
</body>
</html>