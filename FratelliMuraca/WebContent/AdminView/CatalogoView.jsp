<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
    
<%
LinkedList<ProductBean> prodotti = (LinkedList) request.getAttribute("prodotti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Catalogo Admin - Fratelli Muraca</title>
</head> 
<body>
<a href="modificaProdotto">nuovo prodotto</a>
	<div class="product-table">
        <h3>Tabella Prodotti</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Descrizione</th>
                    <th>Prezzo</th>
                    <th>Prezzo Scontato</th>
                    <th>Prezzo Con Iva</th>
                    <th>Percentuale di Sconto</th>
                    <th>Percentuale di Iva</th>
                    <th>Quantita'</th>
                    <th>Dimensione</th>
                    <th>Tipo</th>
                    <th>Categoria</th>
                    <th>Anno</th>
                    <th>Ingredienti</th>
                </tr>
            </thead>
            <tbody>
                <% 
            
                if (prodotti == null || prodotti.isEmpty()) { %>
                    <tr>
                        <td colspan="8">Nessun Prodotto trovato.</td>
                    </tr>
                <% } else {
                    for (ProductBean product : prodotti) { %>
                        <tr>
                            <td><%= product.getId() %></td>
                            <td><%= product.getNome() %></td>
                            <td><%= product.getDescrizione() %></td>
                            <td><%= product.getPrezzoNetto() %></td>
                            <td><%= product.getPrezzoScontato() %></td>
                            <td><%= product.getPrezzoIva() %></td>
                            <td><%= product.getSalePerc() %></td>
                            <td><%= product.getIvaPerc() %></td>
                            <td><%= product.getQuantita() %></td>
                            <td><%= product.getDimensione() %></td>
                            <td><% if(product.getTipo() == true) { %>Cosmetico<% } else { %>Olio<% } %></td>
                            <td><%= product.getCategoria() %></td>
                            <td><%= product.getAnno() %></td>
                            <td><%= product.getIngredienti() %></td>
                            <td>
                            <a href="modificaProdotto?id=<%= product.getId() %>">Modifica</a>
                            </td>
                        </tr>
                    <% }
                } %>
            </tbody>
        </table>
    </div>
</body>
</html>