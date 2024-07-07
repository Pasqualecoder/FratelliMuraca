<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<% LinkedList<UserBean> userList = (LinkedList<UserBean>) request.getAttribute("listaUtenti"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pannello utenti - Fratelli Muraca</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
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
						<td>
						    <a href="javascript:void(0);" 
						       onclick="if(confirm('Sei sicuro di voler eliminare l'Utente <%= externalUser.getId() %>')) { 
						                   
						                   window.location.href='manageUser?delete=<%= externalUser.getId() %>'; 
						               }" 
						       class="btn btn-sm btn-danger">Elimina</a>
						</td>                    
						</tr>
                    <% } %>
                    <% } %>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <script>
    		delete_user(var id){
    			
    			
    		}
    
    </script>
</body>
</html>

