<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
	pageEncoding="UTF-8"%>

<%@ include  file="init/cartinit.jsp"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- FIXME: cache-busting: normalmente (almeno sul browser Brave) il file css rimane in cache e se subisce modifiche non viene riscaricato dal client. appendendo una stringa al ? per il get, che cambia sempre si forza il client a riscaricare il file css dal server poiché risulta un indirizzo diverso -->
	<title>Store - Fratelli Muraca</title>
	
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="css/styles.css" rel="stylesheet" />
</head>

<body>
<%
Iterator ite = products.iterator();
ProductBean pr = (ProductBean) ite.next();
%>

<%@ include file="parts/header.jsp" %>



		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">All Products</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill"><%= cart.getSize() %></span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
        
        
        <!-- Header-->
        <header class="" style="background-color: #607244">
            <div class="container px-4 px-lg-5 my-5" style="background-color: #607244">
                <div class="text-center">
                    <img alt="logo" src="media/logo.png">
                </div>
            </div>
        </header>


	<h2>Prodotti</h2>
	<br><br><br><br><br><br><br><br><br>
	
	 <section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
		    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        
        <%
        
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
		%>
        
        <div class="col mb-5">
		<div class="card h-100">
		    <!-- Sale badge-->
		    <!--  <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>  -->
		    <!-- Product image-->
		    <img src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(bean.getImmagini().getFirst().getDati())) %>" alt="<%= bean.getNome()%>" width="100">
		    <!-- Product details-->
		    <div class="card-body p-4">
		        <div class="text-center">
		            <!-- Product name-->
		            <h5 class="fw-bolder"><%= bean.getNome() %></h5>
		            <!-- Product reviews-->
		            <div class="d-flex justify-content-center small text-warning mb-2">
		                <div class="bi-star-fill"></div>
		                <div class="bi-star-fill"></div>
		                <div class="bi-star-fill"></div>
		                <div class="bi-star-fill"></div>
		                <div class="bi-star-fill"></div>
		            </div>
		            <!-- Product price-->
		            <span class="text-muted text-decoration-line-through"></span><%= bean.getPrezzo() %>
		        </div>
		    </div>
		    <!-- Product actions-->
		        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
		            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
		        </div>
		    </div>
		    <% } %>
			</div>
			<% }%>
		
        </div>
    </div>
     </section>
	
	
	
	
	
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
			<td>
				<%
				for (Immagine im : bean.getImmagini()) { %>
					<img src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(im.getDati())) %>" alt="Immagine Prodotto" width="100">
				<% }
				%>
			</td>
			
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
			<th>img</th>
			<th>nome</th>
			<th>descrizione</th>
			<th>prezzo</th>
			<th>quantita</th>
			<th>dimensione</th>
			<th>categoria</th>
			<th>anno di produzione</th>
			<th>ingredienti</th>
		</tr>
		<tr>
			<td><%=product.getId()%></td>
			<td>
			<%
				for (Immagine im : product.getImmagini()) { %>
					<img src="data:image/jpeg;base64,<%= new String(Base64.getEncoder().encode(im.getDati())) %>" alt="Immagine Prodotto" width="100">
				<% }
			%>
			</td>
			<td><%=product.getNome()%></td>
			<td><%=product.getDescrizione()%></td>
			<td>&euro;<%=product.getPrezzo()%></td>
			<td><%=product.getQuantita()%></td>
			<td><%=product.getDimensione()%></td>
			<td><%=product.getCategoria()%></td>
			<td><%=product.getAnno()%></td>
			<td><%=product.getIngredienti()%></td>
		</tr>
	</table>
	<%
		}
	%>
	

	<h2>TODO: da portare nel lato admin <br> Insert</h2>
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
		
		
		<label for="image">TODO: carica immagini:</label><br>
		<input name="image" type="text" maxlength="20" required placeholder="asdf"><br> 
		

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
	
<br><br><br><br>
	
<%@ include file="parts/footer.jsp" %>	
</body>
</html>