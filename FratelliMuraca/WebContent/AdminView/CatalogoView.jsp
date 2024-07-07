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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <style>
        .custom-container {
            margin-left: 10px;
            margin-right: 10px; 
        }
        .truncate-text {
            max-width: 200px; 
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head> 
<body>
    
	<div class="container">
	<a class="mt-4 btn btn-lg btn-warning go-back" href="dashboard">&#171; Dashboard</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold">Gestione Catalogo</h1>
        </div>
    </div>
</div>
    

   
        <div class="product-table m-2" style="overflow-x:scroll;">
            <h3>Tabella Prodotti</h3>
            <table class="table table-bordered">
                <thead ">
                    <tr class="text-black font-weight-bold">
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Descrizione</th>
                        <th>Prezzo</th>
                        <th>Prezzo Scontato</th>
                        <th>Prezzo Con Iva</th>
                        <th>Percentuale di Sconto</th>
                        <th>Percentuale di Iva</th>
                        <th>Quantità</th>
                        <th>Dimensione</th>
                        <th>Tipo</th>
                        <th>Categoria</th>
                        <th>Anno</th>
                        <th>Ingredienti</th>
                        <th>Azioni</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (prodotti == null || prodotti.isEmpty()) { %>
                        <tr>
                            <td colspan="14">Nessun Prodotto trovato.</td>
                        </tr>
                    <% } else {
                        for (ProductBean product : prodotti) { %>
                            <tr>
                                <td><%= product.getId() %></td>
                                <td class="truncate-text"><a href="../details?id=<%= product.getId() %>"> <%= product.getNome() %> </a> </td>
                                <td class="truncate-text"><%= product.getDescrizione() %></td>
                                <td><%= product.getPrezzoNetto() %></td>
                                <td><%= product.getPrezzoScontato() %></td>
                                <td><%= product.getPrezzoIva() %></td>
                                <td><%= product.getSalePerc() %></td>
                                <td><%= product.getIvaPerc() %></td>
                                <td><%= product.getQuantita() %></td>
                                <td><%= product.getDimensione() %></td>
                                <td><% if(product.getTipo()) { %>Cosmetico<% } else { %>Olio<% } %></td>
                                <td><%= product.getCategoria() %></td>
                                <td><%= product.getAnno() %></td>
                                <td class="truncate-text"><%= product.getIngredienti() %></td>
                                <td>
                                    <a href="modificaProdotto?id=<%= product.getId() %>" class="btn btn-sm mb-2 btn-success">Modifica</a>
			                        <form action="modificaProdotto" method="POST">
			            						<input name="id" type="hidden" value="<%= product.getId() %>">
			            						<input name="delete" type="hidden" value="true">
			            						<input type="submit" class="btn btn-sm btn-block btn-danger" value="Elimina">
			        				</form> 
                                     
                                </td>
                            </tr>
                        <% }
                    } %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="15">
                            <a href="modificaProdotto" class="btn btn-success btn-block">Nuovo Prodotto</a>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>


   
</body>
</html>