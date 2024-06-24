<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
OrderBean order = (OrderBean) request.getAttribute("order");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ricevuta Ordine #<%= order.getId() %> - Fratelli Muraca</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }
        .receipt {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        header {
            text-align: center;
            margin-bottom: 30px;
        }
        header h1 {
            margin: 0;
            font-size: 24px;
        }
        header address {
            font-style: normal;
            margin: 10px 0;
        }
        address p {
            margin: 0px;
        }
        .details, .payment, .items, .shipping {
            margin-bottom: 20px;
        }
        .details h2, .payment h2, .items h2, .shipping h2 {
            margin-top: 0;
            font-size: 20px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 5px;
        }
        .details p, .payment p, .shipping p {
            margin: 5px 0;
        }
        .order-payment-wrapper {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .details, .payment {
            flex: 1;
            min-width: 48%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
            text-align: left;
        }
        .total {
            text-align: right;
            font-size: 18px;
            margin-top: 20px;
        }
        footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
        }
        
        @media print {
            body {
                background: #fff;
                color: #000;
            }
            .receipt {
                border: none;
                box-shadow: none;
            }
            .print-button {
                display: none;
            }
        }
    </style>
</head>

<body>
    <div class="receipt" name="top">
        <header>
            <h1>Fratelli Muraca</h1> <sub>Società Agricola Semplice</sub>
            <address>
                <p id="company-address">Piazza Armando Diaz n.1, Lamezia Terme, Italy</p>
                <p id="company-PIVA">P.IVA: XXXXXXXXXXX</p>                
                <p id="company-phone">Telefono: 338 457 8681</p>
                <p id="company-email">Email: fratellimuraca@agricola.com</p>
                <p id="company-pec">PEC: agricolamuraca@pec.it</p>
            </address>
        </header>

        <!-- Wrapper for Order Details and Payment Details -->
        <div class="order-payment-wrapper">
            <section class="details">
                <h2>Dettagli dell'Ordine</h2>
                <p><strong>Numero Ordine:</strong> <text id="order-number"><%= order.getId() %></text></p>
                <p><strong>Cliente:</strong> <text id="customer-name"><%= order.getUser().getFullName() %></text></p>
                <p><strong>Email:</strong> <text id="customer-email"><%= order.getUser().getEmail() %></text></p>
                <p><strong>Telefono:</strong> <text id="customer-phone"><%= order.getUser().getPhone() %></text></p>
                <p><strong>Data dell'Ordine:</strong> <text id="order-date"></text></p>
            </section>

            <section class="payment">
                <h2>Dettagli del Pagamento</h2>
                <p><strong>ID Transazione PayPal:</strong> <text id="paypal-transaction-id"></text></p>
                <p><strong>Stato del Pagamento:</strong> <text id="payment-status"></text></p>
                <p><strong>Metodo di Pagamento:</strong> <text id="payment-method"></text></p>
                <p><strong>Data del Pagamento:</strong> <text id="payment-date"></text></p>
                <p><strong>Totale Pagato:</strong> €<text id="payment-total"></text></p>
                <p><strong>Payer:</strong> <u><i><text id="payer-name"></text></i></u> <text id="payer-email"></text> </p>
                <p><strong>Payee:</strong> <text id="payee-email"></text></p>
            </section>
        </div>

        <section class="shipping">
            <h2>Dettagli di Spedizione</h2>
            <p><strong>Destinatario:</strong> <text id="shipping-recipient"></text></p>
            <p><strong>Indirizzo di Spedizione:</strong> <text id="shipping-address"></text></p>
            <p><strong>Città:</strong> <text id="shipping-city"></text></p>
            <p><strong>Provincia:</strong> <text id="shipping-state"></text></p>
            <p><strong>CAP:</strong> <text id="shipping-postal-code"></text></p>
            <p><strong>Paese:</strong> <text id="shipping-country"></text></p>
        </section>

        <section class="items">
            <h2>Prodotti</h2>
            <table>
                <thead>
                    <tr>
                        <th>Prodotto</th>
                        <th>Quantità</th>
                        <th>Prezzo Unitario</th>
                        <th>% IVA</th>
                        <th>% Sconto</th>
                        <th>Totale</th>
                    </tr>
                </thead>
                <tbody id="product-list">
                <%
                float prezzoTotale = 0f;
                Map<ProductBean, Integer> prodotti = order.getProdotti().getProducts(); // prendo la mappa del carrello
                for (Map.Entry<ProductBean, Integer> pr : prodotti.entrySet()) { // per ogni prodotto all'interno della mappa
                    ProductBean key = pr.getKey();
                    Integer value = pr.getValue();
                    prezzoTotale += key.getPrezzoScontato();
                    %>
                    <tr>
                        <td id="product-description"><%= key.getNome() + " (id:" + key.getId() + ") " %></td>
                        <td id="product-quantity"><%= value %></td>
                        <td id="product-unit-price">€<%= key.getPrezzoNetto() %></td>
                        <td id="product-iva-perc"><%= key.getIvaPerc() %>%</td>
                        <td id="product-sale-perc"><%= key.getSalePerc() %>%</td>
                        <td id="product-total-price">€<%= key.getPrezzoScontato() %></td>
                    </tr>
                <%}
                %>
                </tbody>
            </table>
        </section>

        <div class="total">
            <p><strong>Totale Ordine:</strong> €<text id="order-total"><%= prezzoTotale %></text></p>
        </div>

        <footer>
            <p>Grazie per il tuo acquisto!</p>
            <button class="print-button" onclick="window.scrollTo(0, 0); window.print()">Stampa Ricevuta</button>
        </footer>
    </div>
    
    
<script type="text/javascript">
//Funzione per popolare gli elementi della pagina HTML
function populateOrderDetails(orderDetails) {
    // Parsing del JSON
    const transactionId = orderDetails.purchase_units[0].payments.captures[0].id;
    const paymentStatus = orderDetails.status;
    const paymentMethod = "PayPal";
    const paymentTotal = orderDetails.purchase_units[0].amount.value;
    const payeeEmail = orderDetails.purchase_units[0].payee.email_address;
    const orderDescription = orderDetails.purchase_units[0].description;
    const productName = orderDetails.purchase_units[0].items[0].name;
    const productUnitAmount = orderDetails.purchase_units[0].items[0].unit_amount.value;
    const productQuantity = orderDetails.purchase_units[0].items[0].quantity;
    const payerName = orderDetails.payer.name.given_name + " " + orderDetails.payer.name.surname;
    const payerEmail = orderDetails.payer.email_address;
    const paymentDate = orderDetails.purchase_units[0].payments.captures[0].create_time;

    const shippingRecipient = orderDetails.purchase_units[0].shipping.name.full_name;
    const shippingAddress = orderDetails.purchase_units[0].shipping.address.address_line_1;
    const shippingCity = orderDetails.purchase_units[0].shipping.address.admin_area_2;
    const shippingState = orderDetails.purchase_units[0].shipping.address.admin_area_1;
    const shippingPostalCode = orderDetails.purchase_units[0].shipping.address.postal_code;
    const shippingCountry = orderDetails.purchase_units[0].shipping.address.country_code;

    // Popolamento dei dettagli nella pagina HTML
    document.getElementById('paypal-transaction-id').textContent = transactionId;
    document.getElementById('order-date').textContent = paymentDate;
    document.getElementById('payment-status').textContent = paymentStatus;
    document.getElementById('payment-method').textContent = paymentMethod;
    document.getElementById('payment-date').textContent = paymentDate;
    document.getElementById('payment-total').textContent = paymentTotal;
    document.getElementById('payer-email').textContent = payerEmail;
    document.getElementById('payer-name').textContent = payerName;
    document.getElementById('payee-email').textContent = payeeEmail;

    // Popolamento dei dettagli di spedizione
    document.getElementById('shipping-recipient').textContent = shippingRecipient;
    document.getElementById('shipping-address').textContent = shippingAddress;
    document.getElementById('shipping-city').textContent = shippingCity;
    document.getElementById('shipping-state').textContent = shippingState;
    document.getElementById('shipping-postal-code').textContent = shippingPostalCode;
    document.getElementById('shipping-country').textContent = shippingCountry;
}

// Esegui quando la pagina è completamente caricata
document.addEventListener('DOMContentLoaded', () => {
    const orderDetails = <%= order.getDetails() %>;
    populateOrderDetails(orderDetails);
	window.print();
});

</script>
</body>
</html>
