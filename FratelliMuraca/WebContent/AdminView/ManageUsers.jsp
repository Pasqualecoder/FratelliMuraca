<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<% LinkedList<UserBean> userList = (LinkedList<UserBean>) request.getAttribute("listaUtenti"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pannello utenti</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .central-container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
    }
    .go-back {
        margin-bottom: 20px;
    }
    .table-responsive {
        overflow-x: auto;
    }
</style>
</head>
<body>
<div class="container">
    <a class="mt-4 btn btn-lg btn-warning go-back" href="dashboard">&#171; Dashboard</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold">Gestione Utenti</h1>
        </div>
    </div>
    
    
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr class="font-weight-bold text-bold">
                        <th>Id</th>
                        <th>Email</th>
                        <th>Nome</th>
                        <th>Cognome</th>
                        <th>DDN</th>
                        <th>Telefono</th>
                        <th>ELIMINA UTENTE</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (userList != null && !userList.isEmpty()) {
                        for (UserBean externalUser : userList) { 
                            if (!externalUser.isDisabled()) { %>
                    <tr>
                        <td><%= externalUser.getId() %></td>
                        <td><%= externalUser.getEmail() %></td>
                        <td><%= externalUser.getNome() %></td>
                        <td><%= externalUser.getCognome() %></td>
                        <td><%= externalUser.getDdn() %></td>
                        <td><%= externalUser.getPhone() %></td>
                        <td><a href="manageUser?delete=<%= externalUser.getId() %>" class="btn btn-sm btn-danger">Elimina</a></td>
                    </tr>
                    <% } %>
                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

