<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<% LinkedList<AdminBean> adminList = (LinkedList<AdminBean>) request.getAttribute("listaAdmin"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestisci Admin - Fratelli Muraca</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin_style.css"> <!-- Se necessario, aggiungi il tuo file CSS aggiuntivo -->
<style>
  /* Aggiungi stili specifici qui, se necessario */
  .page-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
  }
  .central-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
  }
  .go-back {
    display: inline-block;
    margin-bottom: 20px;
  }
</style>
</head>
<body>
<div class="container">
	<a class="mt-4 btn btn-lg btn-warning go-back" href="dashboard">&#171; Dashboard</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold">Gestione Review</h1>
        </div>
    </div>
    


    <h2 class="justify-content-start">Aggiungi un nuovo admin</h2>
    <form action="manageAdmin" method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-success">Aggiungi Admin</button>
    </form>

    
    
    <table class="table table-bordered mt-3">
        <thead >
             <tr class="font-weight-bold text-bold">
                <th>ID</th>
                <th>User</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if (adminList != null && !adminList.isEmpty()) {
                for (AdminBean externalAdmin : adminList) { %>
            <tr>
                <td><%= externalAdmin.getId() %></td>
                <td><%= externalAdmin.getUsername() %></td>
                <td><a href="./manageAdmin?id=<%= externalAdmin.getId() %>" class="btn btn-sm btn-danger">Rimuovi</a></td> 
            </tr>
            <% }
            } %>
        </tbody>
    </table>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>