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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .custom-container {
            margin-left: 10px; /* Adjust the left margin as needed */
            margin-right: 10px; /* Adjust the right margin as needed */
        }
        .truncate-text {
            max-width: 200px; /* Adjust the max-width as needed */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>
</head> 
<body>
    
	 <div class=" mt-4 ml-4">
        <a href="dashboard" class="btn btn-warning mb-3 btn-lg">&lt;&lt; Dashboard</a>
       
    </div>
    

    <div class="container custom-container"> <!-- New container for table with custom CSS -->
   
        <div class="product-table">
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
                        <th>Modifica</th>
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
                                    <a href="modificaProdotto?id=<%= product.getId() %>" class="btn btn-sm btn-success">Modifica</a>
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


    <!-- Bootstrap JS (Optional for certain features like tooltips, modals, etc.) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>