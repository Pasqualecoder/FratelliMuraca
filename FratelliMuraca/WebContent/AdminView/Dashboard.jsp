<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin - Fratelli Muraca</title>
    <!-- Include Bootstrap CSS for styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background-color: #f8f9fa;">
    <div class="container">
        <div class="d-flex justify-content-center align-items-center vh-100">
            <div id="dashboard-container" class="col-md-8 col-lg-6 bg-white border rounded p-4">
                <div class="text-center mb-4">
                    Benvenuto <%= admin.getUsername() %>
                </div>
                <div id="action-section">
                    <ul class="list-unstyled">
                        <li class="mb-2 d-flex justify-content-start"><a href="./catalogo" class="btn btn-link text-left text-success">Gestione <strong>Catalogo</strong></a></li>
                        <li class="mb-2 d-flex justify-content-start"><a href="./manageImages" class="btn btn-link text-left text-success">Gestione <strong>Immagini</strong></a></li>
                        <% if (admin.getId() == 1) { %>
                            <li class="mb-2 d-flex justify-content-start"><a href="./manageAdmin" class="btn btn-link text-left text-success">Gestione <strong>Admin</strong></a></li>
                        <% } %>
                        <li class="mb-2 d-flex justify-content-start"><a href="./manageUser" class="btn btn-link text-left text-success">Gestione <strong>Utenti</strong></a></li>
                        <li class="mb-2 d-flex justify-content-start"><a href="./manageReview" class="btn btn-link text-left text-success">Gestione <strong>Recensioni</strong></a></li>
                        <li class="mb-2 d-flex justify-content-start"><a href="./manageOrder" class="btn btn-link text-left text-success">Gestione <strong>Ordini</strong></a></li>
                        <li class="d-flex justify-content-center"><a id="logout-button" href="/FratelliMuraca/logout" class="btn btn-danger text-left "><b>Logout</b></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>