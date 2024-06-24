<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="../init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Ordini - Fratelli Muraca</title>
<%@ include file="../parts/head.jsp" %>
</head>
<body>
<%@ include file="../parts/navbar.jsp" %>

<h1 class="font-italic text-center">Ultimi ordini</h1>
<%
Boolean opStatus = (Boolean) request.getAttribute("opStatus");

// NESSUNA OPERAZIONE EFFETTUATA
if (opStatus == null) {
%>
<%
	}

// OPERAZIONE ANDATA A BUON FINE
else if (opStatus) {
%>
	<div class="p-3 mb-2 bg-success text-white">Operazione completata con successo</div>
<%
	}

else {
%>
	<div class="p-3 mb-2 bg-danger text-white">Errore durante l'acquisto, attendi qualche minuto e riprova</div>
<%
	}
%>

<%
	Collection<OrderBean> ordini = (Collection<OrderBean>) request.getAttribute("ordini");
if (ordini == null || ordini.size() <= 0) {
%>
	<h5>Nessun ordine effettuato</h5>
	<a class="btn btn-success mt-auto" href="product">Visita i nostri prodotti</a><br><br>		
<%
			}

				else {
			for (OrderBean or : ordini) {
				// SI PREFERISCE RIEMPIRE I CAMPI CON JAVASCRIPT PERCHé USA LE INFO GIUSTE DI PAYPAL				
				// UserBean acquirente = or.getUser();
				
				// i text hanno gli id con numero dell'ordine così sono incrementali e js doesnt complain
		%>

<div class="card mb-4">
    <div class="card-body">
		<h4>Ordine #<%=or.getId()%></h4>
		<a href="receipt?id=<%=or.getId()%>"><i>Ricevuta Fiscale</i></a>
        <div class="row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="idTransazione" class="form-label">ID Transazione:</label>
                    <span id="idTransazione<%=or.getId()%>" class="form-text"></span>
                </div>
                <div class="mb-3">
                    <label for="data" class="form-label">Data ordine:</label>
                    <span id="data<%=or.getId()%>" class="form-text"></span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="acquirente" class="form-label">Acquirente:</label>
                    <span id="acquirente<%=or.getId()%>" class="form-text"></span>
                </div>
                <div class="mb-3">
                    <label for="destinatario" class="form-label">Destinatario:</label>
                    <span id="destinatario<%=or.getId()%>" class="form-text"></span>
                </div>
                <div class="mb-3">
                    <label for="indirizzo" class="form-label">Indirizzo destinazione:</label>
                    <span id="indirizzo<%=or.getId()%>" class="form-text"></span>
                </div>
            </div>
        </div>
    </div>
		<table class="table mt-4">
			<thead>
			<tr>
				<th>Prodotto</th>
				<th>Prezzo (no iva)</th>
				<th>%IVA</th>
				<th>%Sconto</th>
				<th>Quantità</th>
				<th>Totale</th>
			</tr>
			</thead>
			<tbody>
			<%
				// Itera attraverso i prodotti nel carrello
				float prezzoTotale = 0f;
				CartBean prodotti = or.getProdotti();
				// per ogni elemento all'interno dell'ordine
				for (Map.Entry<ProductBean, Integer> entry : prodotti.getProducts().entrySet()) {
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
			<%
			}%>
		
			</tbody>
		</table>
		<h5 class="text-right text-success">Totale: &euro;<%=prezzoTotale%></h5>
</div>

		
		<script type="text/javascript">
		// Codice JavaScript per popolare i campi nei tag <text>
		document.addEventListener('DOMContentLoaded', function() {
			const orderId = "<%= or.getId()%>";
			const jsonString = `<%=or.getDetails()%>`;
			const detailsInfo = JSON.parse(jsonString);
			
			// ID Transazione
	        const idTransazione = detailsInfo.purchase_units[0].payments.captures[0].id;
			document.getElementById("idTransazione"+orderId).textContent = idTransazione;

			// Data di acquisto
	        const dataAcquisto = new Date(detailsInfo.create_time);
	        const dataAcquistoFormattata = dataAcquisto.getDate()+"/"+(dataAcquisto.getMonth() + 1)+"/"+dataAcquisto.getFullYear();
	        document.getElementById("data"+orderId).textContent = dataAcquistoFormattata;
			
			// Acquirente: nome completo (nome e cognome)
	        const acquirenteFullName = detailsInfo.payer.name.given_name + " "
	        	+ detailsInfo.payer.name.surname + " " + detailsInfo.payer.email_address;
	        document.getElementById("acquirente"+orderId).textContent = acquirenteFullName;
	        
	     	// Destinatario: nome completo (se disponibile, altrimenti usa il nome dell'acquirente)
	        let destinatarioFullName;
	        if (detailsInfo.purchase_units[0].shipping && detailsInfo.purchase_units[0].shipping.name) {
	            destinatarioFullName = detailsInfo.purchase_units[0].shipping.name.full_name;
	        } else {
	            destinatarioFullName = acquirenteFullName;
	        }
	        document.getElementById("destinatario"+orderId).textContent = destinatarioFullName;

	        // Indirizzo di destinazione
	        const indirizzo = detailsInfo.purchase_units[0].shipping.address;
	        const indirizzoCompleto = indirizzo.address_line_1 + " " + indirizzo.admin_area_2 + " " + indirizzo.admin_area_1 + " " + indirizzo.postal_code + " " + indirizzo.country_code;
	        document.getElementById("indirizzo"+ orderId).textContent = indirizzoCompleto;
	        
		})
			
		</script>
<%}		
	} %>
<%@ include file="../parts/footer.jsp" %>
</body>
</html>