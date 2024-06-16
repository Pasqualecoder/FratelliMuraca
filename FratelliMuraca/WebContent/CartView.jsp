<%@page import="control.StringEscapeUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>

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
			<% 
			// Itera attraverso i prodotti nel carrello
			float prezzoTotale = 0f;
			// per ogni elemento all'interno del carrello (entrySet sarebbe l'insieme delle coppie del dizionario)
			for (Map.Entry<ProductBean, Integer> entry : cart.getProducts().entrySet()) {
				ProductBean prodotto = entry.getKey();
				int quantity = entry.getValue();
				prezzoTotale += prodotto.getPrezzoScontato() * quantity;
				prezzoTotale = ProductBean.arrotondaDueDecimali(prezzoTotale);
			%>
			<tr>
				<td><img src="imageServlet?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" style="max-width: 200px"></td>
				<td>
					<h5><%= prodotto.getNome() %></h5>
					<h6 class="text-muted font-italic"><%= prodotto.getCategoria() %></h6>
					<h5 class="text-uppercase font-italic"><%= prodotto.getDimensione() %></h5>
				</td>
				<td><h6 class="font-italic font-weight-normal">&euro;<%= prodotto.getPrezzoScontato() %></h6></td>
				<td>
					<div style="display: inline;"><h6>x<%= quantity %></h6></div>
					<div style="display: inline;">
						<a class="btn btn-success mt-auto" href="cart?action=addC&id=<%= prodotto.getId() %>">+</a>
						<a class="btn btn-danger mt-auto" href="cart?action=deleteC&id=<%= prodotto.getId() %>">-</a>
					</div>
					</td>
				
				<!-- totale -->
				<td><h5 class="font-weight-bold">&euro;<%= ProductBean.arrotondaDueDecimali(prodotto.getPrezzoScontato() * quantity) %></h5></td>
			</tr>
			<%}%>
			<!-- Riga per il prezzo totale -->
            <tr>
                <td colspan="4" style="text-align: right;"><strong>Prezzo totale:</strong></td>
                <td><h4>&euro;<%= prezzoTotale %></h4></td>	
            </tr>
		</tbody>
	</table>
	
	<% if (session.getAttribute("user") == null) {%>
		<h6>Devi essere loggato per effettuare l'ordine</h6>
		<a class="btn btn-success mt-auto" href="login">Entra subito</a><br><br>
	<%}
	else {%>
		<div class="container mt-5">
        <form action="order" method="post">
			
<<<<<<< Updated upstream
			<script src="https://www.paypal.com/sdk/js?client-id=<%= (String) getServletContext().getAttribute("PAYPAL_CLIENT_ID") %>&currency=EUR"></script>
<div id="paypal-button-container"></div>
<script>
    paypal.Buttons({
        createOrder: function(data, actions) {
            // Calcola l'importo totale dal carrello
            var prezzoTotale = <%= prezzoTotale %>;

            // Costruisci l'oggetto di creazione dell'ordine da passare a actions.order.create
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: prezzoTotale.toFixed(2), // Assicurati di arrotondare l'importo a due decimali
                        breakdown: {
                            item_total: {
                                currency_code: 'EUR',
                                value: prezzoTotale.toFixed(2)
                            }
                        }
                    },
                    items: [
                        <% 
                        // Itera attraverso i prodotti nel carrello
                        for (Map.Entry<ProductBean, Integer> entry : cart.getProducts().entrySet()) {
                            ProductBean prodotto = entry.getKey();
                            int quantity = entry.getValue();
                            String nomeProdottoEscaped = StringEscapeUtil.escapeString(prodotto.getNome());
                        %>
                        {
                            name: '<%= nomeProdottoEscaped %>',
                            unit_amount: {
                                currency_code: 'EUR',
                                value: <%= prodotto.getPrezzoScontato() %>.toFixed(2) // Prezzo unitario dell'articolo
                            },
                            quantity: <%= quantity %> // Quantità dell'articolo
                        },
                        <% } %>
                    ]
                }]
            });
        },

        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                alert('Pagamento completato da ' + details.payer.name.given_name + ' di ' + details.purchase_units[0].amount.value);
                console.log(details);
                // Qui puoi fare una richiesta al tuo server per registrare il pagamento
            });
        }
    }).render('#paypal-button-container');
</script>

=======
			<script src="https://www.paypal.com/sdk/js?client-id=paypalClientIdg&currency=EUR"></script>
			<div id="paypal-button-container"></div>
			<script>
			    paypal.Buttons({
			        createOrder: function(data, actions) {
			            return actions.order.create({
			                purchase_units: [{
			                    amount: {
			                        value: <%= prezzoTotale %> // Importo da pagare
			                    }
			                }]
			            });
			        },
			        onApprove: function(data, actions) {
			            return actions.order.capture().then(function(details) {
			                alert('Pagamento completato da ' + details.payer.name.given_name + ' di ' + <%= prezzoTotale %>);
			                
			                // Qui puoi fare una richiesta al tuo server per registrare il pagamento
			            });
			        }
			    }).render('#paypal-button-container');
			</script>
>>>>>>> Stashed changes


            <!-- Bottone di Submit -->
            <div class="form-group text-right">
                <button type="submit" class="btn btn-success">Conferma l'ordine</button>
            </div>
        </form>
    </div>
	<%} %>	
	<%} // end else%>
</div>

<!-- Includi jQuery e Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<%@ include file="parts/footer.jsp" %>
</body>
</html>