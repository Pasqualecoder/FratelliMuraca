<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,model.*"
    pageEncoding="ISO-8859-1"%>
<%
ProductBean prodotto = (ProductBean)request.getAttribute("prodotto");
LinkedList<Integer> immagini = prodotto.getImmagini();
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<form action="createProduct" method="POST" enctype="multipart/form-data">
    <div class="form-group">
        <label for="nome">Nome</label>
        <input type="text" name="nome" class="form-control" value="<%= prodotto.getNome() %>" required>
    </div>
    <div class="form-group">
        <label for="descrizione">Descrizione</label>
        <textarea name="descrizione" class="form-control" required rows="5"><%= prodotto.getDescrizione() %></textarea>
    </div>
    <div class="form-group">
        <label for="prezzo">Prezzo</label>
        <input name="prezzo" type="text" class="form-control" value="<%= prodotto.getPrezzoNetto() %>" required>
    </div>
    <div class="form-group">
        <label for="iva">% IVA</label>
        <input name="iva" type="number" class="form-control" value="<%= prodotto.getIvaPerc() %>" required>
    </div>
    <div class="form-group">
        <label for="sconto">% Sconto</label>
        <input name="sconto" type="number" class="form-control" value="<%= prodotto.getSalePerc() %>" required>
    </div>
    <div class="form-group">
        <label for="quantita">Quantità</label>
        <input name="quantita" type="number" class="form-control" value="<%= prodotto.getQuantita() %>" required>
    </div>
    <div class="form-group">
        <label for="dimensione">Dimensione</label>
        <input name="dimensione" type="text" class="form-control"  value="<%= prodotto.getDimensione() %>" required>
    </div>
    <div class="form-group">
        <label for="tipo">È cosmetico?</label>
        <input name="tipo" type="checkbox" class="form-check-input"  <%= prodotto.getTipo()? "checked": "" %>>
    </div>
    <div class="form-group">
        <label for="categoria">Categoria</label>
        <select name="categoria" class="form-control">
            <option value="classici" <%= "Classici".equals(prodotto.getCategoria()) ? "selected" : "" %>>Classici</option>
            <option value="classici" <%= "Aromatizzati".equals(prodotto.getCategoria()) ? "selected" : "" %>>Aromatizzati</option>
            <option value="classici" <%= "Cosmetici".equals(prodotto.getCategoria()) ? "selected" : "" %>>Cosmetici</option>
        </select>
    </div>
    <div class="form-group">
        <label for="anno">Anno</label>
        <input name="anno" type="number" class="form-control" value="<%= prodotto.getAnno() %>" required>
    </div>
    <div class="form-group">
        <label for="ingredienti">Ingredienti</label>
        <textarea name="ingredienti" class="form-control" rows="5" required><%= prodotto.getIngredienti() %></textarea>
    </div>
    <div class="form-group">
        <label for="foto">Carica Foto</label>
        <input type="file" id="immagine" class="form-control-file" name="foto[]" accept="image/png, image/gif, image/jpeg" multiple>
        <% for(int idImg : immagini) { %>
        	<img src="imageServlet?img=<%= idImg %>" alt="<%= prodotto.getNome() %>" width="50%">
        	<button type="button" class="btn btn-primary" onclick="myFunction()">Rimuovi</button>
        <% } %>
    </div>
    <button type="submit" class="btn btn-primary">Invia</button>
</form>
</body>
</html>