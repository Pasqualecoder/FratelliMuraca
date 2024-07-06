<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="../init/cartinit.jsp" %>
<% UserBean user = (UserBean)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<title>Preferiti - Fratelli Muraca</title>
<%@ include file="../parts/head.jsp" %>
</head>
<!-- Include Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<body>
<%@ include file="../parts/navbar.jsp" %>

<div class="container mt-5">
    <h2>I Tuoi Preferiti</h2>
    <%
        LinkedList<ProductBean> preferiti = (LinkedList<ProductBean>) request.getAttribute("prodotti_preferiti");
        if (preferiti == null || preferiti.size() <= 0) { %>
            <div class="alert alert-warning" role="alert">
                Nessun preferito trovato.
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Nome Prodotto</th>
                            <th scope="col">Prezzo</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Azione</th> <!-- Colonna per il link Rimuovi -->
                        </tr>
                    </thead>
                    <tbody>
                        <% for (ProductBean prodotto : preferiti) { %>
                            <tr>
                                <td>
                                    <img src="imageServlet?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" class="img-fluid" style="max-width: 100px;">
                                </td>
                                <td>
                                    <a href="details?id=<%= prodotto.getId() %>" class="text-decoration-none"><%= prodotto.getNome() %></a>
                                </td>
                                
                                <td>
                                    €<%= String.format("%.2f", prodotto.getPrezzoScontato()) %>
                                </td>
                                <td><%= prodotto.getCategoria() %></td>
                                <td>
                                    <a href="?action=removeFavorite&id=<%= prodotto.getId() %>" class="btn btn-danger btn-sm">Rimuovi</a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% }
    %>
</div>

<%@ include file="../parts/footer.jsp" %>
<!-- Include Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
