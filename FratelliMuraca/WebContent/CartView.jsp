<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%@ include file="parts/header.jsp" %>

<div class="container mt-5">
	<h1>Il tuo carrello</h1>
	<% if (cart.getSize() == 0)  {%> 
		<h3 class="text-muted text-italic">Il tuo carrello è attualmente vuoto</h3>
		<a class="btn btn-success mt-auto" href="product">Visita i nostri prodotti</a><br><br>
	<%} 
	else {%>
	<a class="btn btn-danger mt-auto" href="cart?action=svuotaC">Svuota carrello</a>
	<table class="carrello table mt-4">
		<thead>
			<tr>
				<th>Prodotto</th>
				<th>Nome</th>
				<th>Prezzo</th>
				<th>Quantità</th>
				<th>Totale</th>
			</tr>
		</thead>
		<tbody>
			<!-- Itera attraverso i prodotti nel carrello -->
			<% 
			// per ogni elemento all'interno del carrello (entrySet sarebbe l'insieme delle coppie del dizionario)
			for (Map.Entry<ProductBean, Integer> entry : cart.getProducts().entrySet()) {
				ProductBean prodotto = entry.getKey();
				int quantity = entry.getValue();
			%>
			<tr>
				<td><img src="imageServlet?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" style="max-width: 200px"></td>
				<td>
					<h5><%= prodotto.getNome() %></h5>
					<h6 class="text-muted font-italic"><%= prodotto.getCategoria() %></h6>
					<h5 class="text-uppercase font-italic"><%= prodotto.getDimensione() %></h5>
				</td>
				<td>&euro;<%= prodotto.getPrezzoScontato() %></td>
				<td>
					<div style="display: inline;">x<%= quantity %></div>
					<div style="display: inline;">
						<a class="btn btn-success mt-auto" href="cart?action=addC&id=<%= prodotto.getId() %>">+</a>
						<a class="btn btn-danger mt-auto" href="cart?action=removeC&id=<%= prodotto.getId() %>">-</a>
					</div>
					</td>
				
				<!-- totale -->
				<td>&euro;<%= ProductBean.arrotondaDueDecimali(prodotto.getPrezzoScontato() * quantity) %></td>
			</tr>
			<%}%>
		</tbody>
	</table>
	<%} // end else%>
</div>

<!-- Includi jQuery e Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<%@ include file="parts/footer.jsp" %>
</body>
</html>