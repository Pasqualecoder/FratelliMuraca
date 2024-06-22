<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


    
     
    <!-- Show User Panel -->
    <!--  TO DO SHOW USERS AND/OR CONFIRM MESSAGE -->
    <!-- 
       <div class="card mb-4">
        <div class="card-header">
            Lista Utenti
        </div>
        <div class="card-body">
           
        </div>
    </div>
    -->
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
