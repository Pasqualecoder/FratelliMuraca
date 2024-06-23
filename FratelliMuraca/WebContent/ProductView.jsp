<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>
<%@ include file="init/productsinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%= "ProductView.jsp row13 " + session.getAttribute("user") %>


<%
// se non ci sono elementi nel db da mostrare abort
if (products == null || products.size() == 0) {%> 
	<h1>Store attualmente non diponibile! Torna più tardi</h1>	
<%return;}%>



<!-- SEZIONE PRODOTTI -->
<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			
			<% // per ogni prodotto crea una card e valuta se mostrare lo sconto
			for (ProductBean prodotto : products) { %>
				<!-- CARD -->			
				<div class="col mb-5">
					<a href="details?id=<%=prodotto.getId()%>">
					<div class="card h-100">
					
				<% 
				// se il prodotto è in sconto applica il bollino
				if (prodotto.isOnSale()) {%> 
					<!-- Sale badge-->
					<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>										
					
				<%} // endif (prodotto.isOnSale()) %>
				
				
				<!-- Product image-->
				<img src="imageServlet?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" width="100%">
				
				
				
				<!-- Product details-->
				<div class="card-body p-4">
					<div class="text-center">
						<!-- Product name-->
						<h5 class="fw-bolder"><%= prodotto.getNome() %></h5>
						
						<!-- Product price-->
						<% if (prodotto.isOnSale()) { // controllo se ha un prezzo scontato per far vedere la percentuale e il vecchio prezzo %>
						<h6 class="text-danger text-uppercase font-weight-bold font-italic"><%= prodotto.getSalePerc() %>% off</h6>
						<span class="text-muted text-decoration-line-through" style="display: inline;">&euro;<%= prodotto.getPrezzoIva() %></span>
						<%} //endif (prodotto.isOnSale()) %>
						<h6 class="text-uppercase font-weight-bold" style="display: inline;">&euro;<%= prodotto.getPrezzoScontato() %> <%/* qui faccio vedere in ogni caso il prezzo scontato perché anche se non c'è sconto questa varibile è piena*/ %></h6>
					</div>
				</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center"><a class="btn btn-success mt-auto" href="cart?action=addC&id=<%=prodotto.getId()%>">Add to cart</a></div> <br>
					</div>
					</div>
					</a>
				</div>
				<!-- end CARD -->
			<%} // endfor 
			%>
			

	
</section> 



<%@ include file="parts/footer.jsp" %>
</body>
</html>