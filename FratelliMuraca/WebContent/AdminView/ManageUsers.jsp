<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<UserBean> userList = (LinkedList<UserBean>) request.getAttribute("userList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pannello utenti</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Pannello Utenti</h2>
    <!-- Add User Panel -->
    <div class="card mb-4">
        <div class="card-header">
            Aggiungi Utente
        </div>
        <div class="card-body">
            <form id="addUserForm" method = "post" action = "addUser">
                <div class="form-group">
                    <label for="addEmail">Email</label>
                    <input type="email" name = "email" class="form-control" id="addEmail" placeholder="Enter email">
                </div>
                <div class="form-group">
                    <label for="addPassword">Password</label>
                    <input type="password" name = "password" class="form-control" id="addPassword" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="addName">Nome</label>
                    <input type="text" name = "nome" class="form-control" id="addName" placeholder="Nome">
                </div>
                <div class="form-group">
                    <label for="addSurname">Cognome</label>
                    <input type="text" name = "cognome" class="form-control" id="addSurname" placeholder="Cognome">
                </div>
                <div class="form-group">
                    <label for="addDdn">DDN</label>
                    <input type="date" name = "DDN" class="form-control" id="addDdn" placeholder="DDN">
                </div>
                <div class="form-group">
                    <label for="addPhone">Telefono</label>
                    <input type="tel" name = "telefono" class="form-control" id="addPhone" placeholder="Telefono">
                </div>
                <button type="submit" class="btn btn-primary">Aggiungi</button>
            </form>
        </div>
    </div>
	
	</div>
<div class="central-container" id="dashboard-container">
	<a class="go-back" href="admin">&#171 Dashboard</a>

	<body>
	<h2> Gestione User </h2>
	<p> lista degli User</p>
	<table border="1">
	    <tr>
	        <th>Id</th>
	        <th>Email</th>
	        <th>Nome</th>
	        <th>Cognome</th>
	        <th>DDN</th>
	        <th>Telefono</th>
	        <th>ELIMINA UTENTE</th>
	    </tr>
	    <% if (userList != null && !userList.isEmpty()) {
	          for (UserBean externalUser : userList) 
	          { if(externalUser.isDisabled() == false)
	          	{%>
	    <tr>
	        <td><%= externalUser.getId() %></td>
	        <td><%= externalUser.getEmail() %></td>
	        <td><%= externalUser.getNome() %></td>
	        <td><%= externalUser.getCognome() %></td>
	        <td><%= externalUser.getDdn() %></td>
	        <td><%= externalUser.getPhone() %></td>
            <td><a href="admin?action=users&op=remove&id=<%= externalUser.getId() %> ">ELIMINA UTENTE</a></td>
	    </tr>
	    <% } %>
	    <% } %>
	    <% } %>
	 
	</table>
	
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

