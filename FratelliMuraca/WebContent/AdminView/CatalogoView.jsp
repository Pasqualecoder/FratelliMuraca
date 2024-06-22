<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
    
<%
LinkedList<ProductBean> prodotti = (LinkedList) request.getAttribute("prodotti");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
<meta charset="UTF-8">
<title>Modifica Catalogo Admin - Fratelli Muraca</title>
</head> 
<body>
	<div class="central-container" id="edit-product-container">
	<h3>Nuovo Prodotto</h3>
	<form action="createProduct" method="POST" enctype="multipart/form-data">
    <div class="form-group">
        <label for="nome">Nome</label>
        <input type="text" name="nome" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="descrizione">Descrizione</label>
        <textarea name="descrizione" class="form-control" required rows="5"></textarea>
    </div>
    <div class="form-group">
        <label for="prezzo">Prezzo</label>
        <input name="prezzo" type="text" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="iva">% IVA</label>
        <input name="iva" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="sconto">% Sconto</label>
        <input name="sconto" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="quantita">Quantità</label>
        <input name="quantita" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="dimensione">Dimensione</label>
        <input name="dimensione" type="text" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="tipo">È cosmetico?</label>
        <input name="tipo" type="checkbox" class="form-check-input">
    </div>
    <div class="form-group">
        <label for="categoria">Categoria</label>
        <select name="categoria" class="form-control">
            <option value="classici">Classici</option>
            <option value="aromatizzati">Aromatizzati</option>
            <option value="cosmetici">Cosmetici</option>
        </select>
    </div>
    <div class="form-group">
        <label for="anno">Anno</label>
        <input name="anno" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="ingredienti">Ingredienti</label>
        <textarea name="ingredienti" class="form-control" rows="5" required></textarea>
    </div>
    <div class="form-group">
        <label for="foto">Carica Foto</label>
        <input type="file" id="immagine" class="form-control-file" name="foto[]" accept="image/png, image/gif, image/jpeg" multiple>
    </div>
    <button type="submit" class="btn btn-primary">Invia</button>
</form>
</div>
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
                            <td></td> <!-- Colonna vuota per il ruolo -->
                            <td>
                            <a href="admin?action=catalogo&op=delete&id=<%= product.getId() %> ">Rimuovi</a>
                            <br>
                            <a href="admin?action=catalogo&op=modifica&id=<%= product.getId() %>">Modifica</a>
                            </td>
                        </tr>
                    <% }
                } %>
            </tbody>
        </table>
    </div>
</body>
</html>