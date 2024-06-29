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
</head>
<body>
<h1><%= prodotto == null ? "Crea prodotto" : "Modifica Prodotto" %></h1>
<form action="modificaProdotto" method="POST">
	<% if (prodotto != null) {%>
		<input name="id" type="hidden"  value="<%= prodotto.getId() %>">
	<%}%>

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
        <input name="dimensione" type="text" class="form-control"  value="<%= (prodotto != null) ? prodotto.getDimensione() : "" %>" required>
    </div>
    <div class="form-group">
        <label for="tipo">È cosmetico?</label>
        <input name="tipo" type="checkbox" class="form-check-input"  <%= (prodotto != null && prodotto.getTipo()) ? "checked": "" %>>
    </div>
    <div class="form-group">
        <label for="categoria">Categoria</label>
        <select name="categoria" class="form-control">
            <option value="classici" <%= "Classici".equals( (prodotto != null) ? prodotto.getCategoria() : "" ) ? "selected" : "" %>>Classici</option>
            <option value="aromatizzati" <%= "Aromatizzati".equals( (prodotto != null) ? prodotto.getCategoria() : "" ) ? "selected" : "" %>>Aromatizzati</option>
            <option value="cosmetici" <%= "Cosmetici".equals( (prodotto != null) ? prodotto.getCategoria() : "" ) ? "selected" : "" %>>Cosmetici</option>
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

	<input type="submit">
</form>

<% if (prodotto != null) {%>
<form action="modificaProdotto" method="POST">
	<input name="id" type="hidden" value="<%= prodotto.getId() %>">
	<input name="delete" type="hidden" value="true">
	<input type="submit" value="delete">	
</form>
<%}%>
</body>
</html>