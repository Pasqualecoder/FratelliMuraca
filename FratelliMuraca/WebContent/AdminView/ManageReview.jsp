<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<ReviewBean> reviewList = (LinkedList<ReviewBean>) request.getAttribute("listaReview"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestione Review Admin - Fratelli Muraca</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
    .central-container {
        max-width: 1000px; 
        margin: 20px auto;
        padding: 20px;
    }
    .go-back {
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<div class="central-container">
    <a class="btn btn-lg btn-warning go-back" href="dashboard">&#171; Dashboard</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold">Gestione Review</h1>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead >
                <tr class="font-weight-bold text-black">
                    <th >Id</th>
                    <th> Titolo</th>
                    <th> Content</th>
                    <th >Rating</th>
                    <th >Date</th>
                    <th >UserID</th>
                    <th >UserEmail</th>
                    <th >ProductID</th>
                    <th >ProductName</th>
                    <th>ELIMINA RECENSIONE</th>
                </tr>
            </thead>
            <tbody>
                <% if (reviewList != null && !reviewList.isEmpty()) {
                    for (ReviewBean externalReview : reviewList) { %>
                <tr>
                    <td><%= externalReview.getId() %></td>
                    <td><%= externalReview.getTitolo() %></td>
                    <td><%= externalReview.getContent() %></td>
                    <td><%= externalReview.getRating() %></td>
                    <td><%= externalReview.getDate() %></td>
                    <td><%= externalReview.getUser().getId() %></td>
                    <td><%= externalReview.getUser().getEmail() %></td>
                    <td><%= externalReview.getProduct().getId() %></td>
                    <td><a href="../details?id=<%= externalReview.getProduct().getId() %>"> <%= externalReview.getProduct().getNome() %></a></td>
                    <td><a href="./manageReview?delete=<%= externalReview.getId() %>" class="btn btn-sm btn-danger">Elimina</a></td>
                </tr>
                <% } %>
                <% } %>	 
            </tbody>
        </table>
    </div>
</div>

</body>
</html>