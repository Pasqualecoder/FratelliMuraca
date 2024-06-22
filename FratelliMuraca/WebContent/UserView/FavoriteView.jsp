<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="../init/cartinit.jsp" %>
<% UserBean user = (UserBean)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<%@ include file="../parts/head.jsp" %>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Nome Prodotto</th>
                            <th scope="col">Descrizione</th>
                            <th scope="col">Prezzo</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Azione</th> <!-- Colonna per il link Rimuovi -->
                        </tr>
                    </thead>
                    <tbody>
                        <% for (ProductBean prodotto : preferiti) { %>
                            <tr>
                                <td>
                                    <img src="imageServelt?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" class="img-fluid" style="max-width: 100px;">
                                </td>
                                <td>
                                    <a href="details?id=<%= prodotto.getId() %>" class="text-decoration-none"><%= prodotto.getNome() %></a>
                                </td>
                                <td><%= prodotto.getDescrizione() %></td>
                                <td>
                                    <% 
                                        float prezzoFinale;
                                        if (prodotto.getSalePerc() > 0) {
                                            prezzoFinale = prodotto.getPrezzoScontato();
                                        } else {
                                            prezzoFinale = prodotto.getPrezzoIva();
                                        }
                                    %>
                                    € <%= String.format("%.2f", prezzoFinale) %>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
