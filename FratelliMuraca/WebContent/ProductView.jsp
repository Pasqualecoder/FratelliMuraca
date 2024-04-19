<%@page import="model.ProductCategorie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean,model.Cart"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Store - Fratelli Muraca</title>
</head>

<body>
	<h2>Prodotti</h2>
	<a href="product">List</a>
	<table border="1">
		<tr>
			<th>id <a href="product?sort=id">Sort</a></th>
			<th>img</th>
			<th>nome <a href="product?sort=nome">Sort</a></th>
			<th>descrizione <a href="product?sort=descrizione">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
		<tr>
			<td><%=bean.getId()%></td>
			<td><img alt="<%=bean.getNome()%>" src="media/<%=bean.getImage()%>"></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.getDescrizione()%></td>
			<td><a href="product?action=delete&id=<%=bean.getId()%>">Delete</a><br>
				<a href="product?action=read&id=<%=bean.getId()%>">Details</a><br>
				<a href="product?action=addC&id=<%=bean.getId()%>">Add to cart</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
	
	<h2>Details</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>id</th>
			<th>nome</th>
			<th>descrizione</th>
			<th>prezzo</th>
			<th>quantita</th>
		</tr>
		<tr>
			<td><%=product.getId()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getQuantita()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<h2>Insert</h2>
	<form action="product" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20" required placeholder="inserisci il nome"><br> 
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required placeholder="inserisci la descrizione"></textarea><br>
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" min="0" value="0" required><br>

		<label for="quantita">Quantità:</label><br> 
		<input name="quantita" type="number" min="1" value="1" required><br>

		<label for="dimensione">Dimensione:</label><br> 
		<input name="dimensione" type="text" maxlength="20" required placeholder="inserisci la dimensione (specificare l'unità di misura)"><br>
		
		<label for="tipo">Tipo:</label><br>
		<input name="tipo" type="radio" required value="olio"><label for="olio">Olio</label><br>
		<input name="tipo" type="radio" required value="cosmetico"><label for="cosmetico">Cosmetico</label><br>
		
		<label for="categoria">Categoria:</label>
		<select name="categoria">
			<%
				for (ProductCategorie cat : ProductCategorie.values()) { %>
					<option value="<%=cat%>"><%=cat%></option>
				<% }
			%>
		</select><br>
		
		<label for="anno">Anno di Produzione:</label><br> 
		<input name="anno" type="number" min="0" value="0" required><br>
		
		<label for="ingredienti">Ingredienti:</label><br>
		<textarea name="ingredienti" maxlength="200" rows="3" required placeholder="inserisci gli ingredienti"></textarea><br>
		
		<label for="image">Path immagine:</label><br>
		<input name="image" type="text" maxlength="20" required placeholder="path image"><br> 
		

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	<% if(cart != null) { %>
		<h2>Cart</h2>
		<table border="1">
		<tr>
			<th>Name</th>
			<th>Action</th>
		</tr>
		<% List<ProductBean> prodcart = cart.getProducts(); 	
		   for(ProductBean beancart: prodcart) {
		%>
		<tr>
			<td><%=beancart.getNome()%></td>
			<td><a href="product?action=deleteC&id=<%=beancart.getId()%>">Delete from cart</a></td>
		</tr>
		<%} %>
	</table>		
	<% } %>	
</body>
</html>