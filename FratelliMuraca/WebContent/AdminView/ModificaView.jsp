<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
LinkedList<Integer> immagini = prodotto.getImmagini();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
</head>
<body>
	<div class="central-container" id="edit-product-container">
	<form action="editProduct" method="POST" enctype="multipart/form-data">
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
        <input name="tipo" type="checkbox" class="form-check-input"  <%= prodotto.getTipo() ? "checked": "" %>>
    </div>
    <div class="form-group">
        <label for="categoria">Categoria</label>
        <select name="categoria" class="form-control">
            <option value="classici" <%= "Classici".equals(prodotto.getCategoria()) ? "selected" : "" %>>Classici</option>
            <option value="aromatizzati" <%= "Aromatizzati".equals(prodotto.getCategoria()) ? "selected" : "" %>>Aromatizzati</option>
            <option value="cosmetici" <%= "Cosmetici".equals(prodotto.getCategoria()) ? "selected" : "" %>>Cosmetici</option>
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
        
    </div>
     <input type="hidden" id="id_prodotto" name="postId" value="<%= prodotto.getId() %>" />
    <button type="submit" class="btn btn-primary">Invia</button>
 
    
</form>

<% for(int idImg : immagini) { %>
	<img src="imageServlet?img=<%=idImg%>" alt="<%= prodotto.getNome() %>" width="50%">
	<a href="./admin?action=catalogo&op=deleteImage&img=<%= idImg %>&prodotto=<%= prodotto.getId() %>">rimuovi</a>
    	<!-- <form action="imageServlet?img=<%=idImg%>&op=delete" method="POST">
        	<input type="submit" class="btn btn-primary" value="rimuovi">
    	</form> -->
		<% } %>
</div>
</body>
</html>