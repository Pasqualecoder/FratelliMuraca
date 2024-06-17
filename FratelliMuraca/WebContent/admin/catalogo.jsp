<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*,model.*"
    pageEncoding="ISO-8859-1"%>
    
<%
LinkedList<ProductBean> prodotti = (LinkedList) request.getAttribute("prodotti");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head> 
<body>

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
        <input name="prezzo" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="sconto">% Sconto</label>
        <input name="sconto" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="iva">% IVA</label>
        <input name="iva" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="quantita">Quantit�</label>
        <input name="quantita" type="number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="dimensione">Dimensione</label>
        <input name="dimensione" type="text" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="tipo">� cosmetico?</label>
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
        <input type="file" name="foto[]" class="form-control-file" multiple required>
    </div>
    <button type="submit" class="btn btn-primary">Invia</button>
</form>

	
	
	TABELLA PER METTERE TUTTI I PRODOTTI	
	<table>
	</table>
</body>
</html>