<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, model.*"
    pageEncoding="UTF-8"%>
<%
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Prodotto Admin - Fratelli Muraca</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
    .central-container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
    }
    .go-back {
        margin-bottom: 20px;
    }
</style>
</head>
<body>
<div class="container">
    <a class="mt-4 btn btn-lg btn-warning go-back" href="catalogo">&#171; Gestione Prodotti</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold"><%= prodotto == null ? "Crea prodotto" : "Modifica Prodotto" %></h1>
        </div>
    </div>
    
    <div class="central-container">
        <form action="modificaProdotto" method="POST">
            <% if (prodotto != null) { %>
            <input name="id" type="hidden" value="<%= prodotto.getId() %>">
            <% } %>

            <div class="form-group">
                <label for="nome">Nome</label>
                <input type="text" name="nome" class="form-control" value="<%= (prodotto != null) ? prodotto.getNome() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="descrizione">Descrizione</label>
                <textarea name="descrizione" class="form-control" required rows="5"><%= (prodotto != null) ? prodotto.getDescrizione() : "" %></textarea>
            </div>
            <div class="form-group">
                <label for="prezzo">Prezzo</label>
                <input name="prezzo" type="text" class="form-control" value="<%= (prodotto != null) ? prodotto.getPrezzoNetto() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="iva">% IVA</label>
                <input name="iva" type="number" class="form-control" value="<%= (prodotto != null) ? prodotto.getIvaPerc() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="sconto">% Sconto</label>
                <input name="sconto" type="number" class="form-control" value="<%= (prodotto != null) ? prodotto.getSalePerc() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="quantita">Quantità</label>
                <input name="quantita" type="number" class="form-control" value="<%= (prodotto != null) ? prodotto.getQuantita() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="dimensione">Dimensione</label>
                <input name="dimensione" type="text" class="form-control" value="<%= (prodotto != null) ? prodotto.getDimensione() : "" %>" required>
            </div>
            <div class="form-group form-check">
                <input name="tipo" type="checkbox" class="form-check-input" <%= (prodotto != null && prodotto.getTipo()) ? "checked": "" %>>
                <label class="form-check-label" for="tipo">È cosmetico?</label>
            </div>
            <div class="form-group">
                <label for="categoria">Categoria</label>
                <select name="categoria" class="form-control">
                    <option value="classici" <%= "Classici".equals((prodotto != null) ? prodotto.getCategoria() : "") ? "selected" : "" %>>Classici</option>
                    <option value="aromatizzati" <%= "Aromatizzati".equals((prodotto != null) ? prodotto.getCategoria() : "") ? "selected" : "" %>>Aromatizzati</option>
                    <option value="cosmetici" <%= "Cosmetici".equals((prodotto != null) ? prodotto.getCategoria() : "") ? "selected" : "" %>>Cosmetici</option>
                </select>
            </div>
            <div class="form-group">
                <label for="anno">Anno</label>
                <input name="anno" type="number" class="form-control" value="<%= (prodotto != null) ? prodotto.getAnno() : "" %>" required>
            </div>
            <div class="form-group">
                <label for="ingredienti">Ingredienti</label>
                <textarea name="ingredienti" class="form-control" rows="5" required><%= (prodotto != null) ? prodotto.getIngredienti() : "" %></textarea>
            </div>

            <input type="submit" class="btn btn-success btn-block" value="Salva">
        </form>

        <!-- <% if (prodotto != null) { %>
        <form action="modificaProdotto" method="POST">
            <input name="id" type="hidden" value="<%= prodotto.getId() %>">
            <input name="delete" type="hidden" value="true">
            <input type="submit" class="btn btn-danger mt-3" value="Elimina">
        </form>  -->
        <% } %>
    </div>
</div>

</body>
</html>