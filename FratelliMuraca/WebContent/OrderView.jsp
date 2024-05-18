<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>

<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>

<h1>Ultimi ordini</h1>
<%
Boolean opStatus = (Boolean) request.getAttribute("opStatus");

// NESSUNA OPERAZIONE EFFETTUATA
if (opStatus == null) {%>
<%}

// OPERAZIONE ANDATA A BUON FINE
else if (opStatus) {%>
	<div class="p-3 mb-2 bg-success text-white">Operazione completata con successo</div>
<%}

else {%>
	<div class="p-3 mb-2 bg-danger text-white">Errore durante l'acquisto, attendi qualche minuto e riprova</div>
<%}
%>

<%
Collection<Order> ordini = (Collection<Order>) request.getAttribute("ordini");
if (ordini == null || ordini.size() <= 0) {%>
	<h5>Nessun ordine effettuato</h5>
	<a class="btn btn-success mt-auto" href="product">Visita i nostri prodotti</a><br><br>		
<%}

else {
	for (Order or : ordini) {%>
		<h4>Ordine #<%= or.getId() %></h4>
		<table class="table mt-4">
			<thead>
			<tr>
				<th>Prodotto</th>
				<th>prezzo (no iva)</th>
				<th>%iva</th>
				<th>%sconto</th>
				<th>quantità</th>
				<th>Totale</th>
			</tr>
			</thead>
			<tbody>
			<%
			// Itera attraverso i prodotti nel carrello
			float prezzoTotale = 0f;
			Cart prodotti = or.getProdotti();
			// per ogni elemento all'interno dell'ordine
			for (Map.Entry<ProductBean, Integer> entry : cart.getProducts().entrySet()) {
				ProductBean prodotto = entry.getKey();
				int quantity = entry.getValue();
				prezzoTotale += prodotto.getPrezzoScontato() * quantity;
				prezzoTotale = ProductBean.arrotondaDueDecimali(prezzoTotale);
			%>
			<tr>
				<td><%= prodotto.getNome() %></td>
				<td>&euro;<%= prodotto.getPrezzoNetto() %></td>
				<td><%= prodotto.getIvaPerc() %>%</td>
				<td><%= prodotto.getSalePerc() %>%</td>
				<td>x<%= quantity %></td>
				<td>&euro;<%= ProductBean.arrotondaDueDecimali(prodotto.getPrezzoScontato() * quantity) %></td>
			</tr>
			</tbody>
		</table>
	<%}
   }
}
%>

<%@ include file="parts/footer.jsp" %>
</body>
</html>