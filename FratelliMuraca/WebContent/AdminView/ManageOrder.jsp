<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, model.*, java.util.stream.Collectors" pageEncoding="UTF-8"%>

<%
// Assuming LinkedList<OrderBean> orderList is populated elsewhere in your servlet or JSP
LinkedList<OrderBean> orderList = (LinkedList<OrderBean>) request.getAttribute("listaOrdini");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordini</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
<div class="central-container" id="dashboard-container">
    <a class="go-back" href="/FratelliMuraca/admin">&#171; Dashboard</a>
    <h2>Gestione Ordini</h2>
    
    <!-- Form per il filtro degli ordini -->
    <form id="filterForm">
        <label for="clienteId">Id Cliente:</label>
        <input type="number" name="clienteId" id="clienteId"><br>

        <label for="dataStart">Data Start:</label>
        <input type="date" name="dataStart" id="dataStart"><br>

        <label for="dataEnd">Data End:</label>
        <input type="date" name="dataEnd" id="dataEnd"><br>

        <button type="button" onclick="filterOrders()">Filtra</button>
    </form>

    <table id="ordersTable" border="1">
        <thead>
            <tr>
                <th>Id</th>
                <th>IdCliente</th>
                <th>Data</th>
                <th>Destinatario</th>
                <th>InfoProdotto</th>
                <th>ModificaStato</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <script>
        var ordini;

        // Funzione per pulire la tabella
        function clearOrders() {
            const table = document.getElementById('ordersTable');
            const tbody = table.querySelector('tbody');
            if (tbody) {
                while (tbody.firstChild) {
                    tbody.removeChild(tbody.firstChild);
                }
            }
        }

        // Funzione per cambiare lo stato dell'ordine
        function changeOrderState(orderId) {
            var selectedValue = document.getElementById("statoSelect_" + orderId).value;

            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'editOrderState?id=' + encodeURIComponent(orderId) + '&state=' + encodeURIComponent(selectedValue), true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = xhr.responseText;
                    console.log(response);
                }
            };
            xhr.send();
        }

        // Funzione per filtrare gli ordini
        function filterOrders() {
            var formData = new FormData(document.getElementById('filterForm'));
            var clienteId = formData.get('clienteId');
            var dataStart = formData.get('dataStart');
            var dataEnd = formData.get('dataEnd');

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var ordersJSON = xhr.responseText;
                    clearOrders();
                    ordini = JSON.parse(ordersJSON);

                    // Itera sugli ordini e popola la tabella
                    for (var i = 0; i < ordini.length; i++) {
                        var ordine = ordini[i];
                        var details = ordine["details"];
                        var shipping = details["purchase_units"][0]["shipping"];
                        var prodotti = ordine["prodotti"];

                        // Estrazione info
                        var idOrdine = ordine["id"];
                        var idCliente = ordine["id_cliente"];
                        var data = details["create_time"];
                        var destinatario = shipping["name"]["full_name"] + "\n" + 
                                           shipping["address"]["address_line_1"] + "\n" +
                                           shipping["address"]["admin_area_1"] + "\n" + 
                                           shipping["address"]["admin_area_2"] + "\n" + 
                                           shipping["address"]["postal_code"] + "\n" + 
                                           shipping["address"]["country_code"];

                        // Conversione della data dell'ordine in oggetto Date per il confronto
                        var orderDate = new Date(data);

                        // Controlli di filtro
                        var includeOrder = true;

                        if (clienteId && clienteId !== idCliente.toString()) {
                            includeOrder = false;
                        }

                        if (dataStart) {
                            var startDate = new Date(dataStart);
                            if (orderDate < startDate) {
                                includeOrder = false;
                            }
                        }

                        if (dataEnd) {
                            var endDate = new Date(dataEnd);
                            if (orderDate > endDate) {
                                includeOrder = false;
                            }
                        }

                        if (includeOrder) {
                            // Creazione della riga della tabella per l'ordine
                            var row = document.createElement('tr');

                            // Creazione delle celle per ciascuna colonna dell'ordine
                            var cellId = document.createElement('td');
                            cellId.textContent = idOrdine;
                            row.appendChild(cellId);

                            var cellIdCliente = document.createElement('td');
                            cellIdCliente.textContent = idCliente;
                            row.appendChild(cellIdCliente);

                            var cellData = document.createElement('td');
                            cellData.textContent = new Date(data).toLocaleString();
                            row.appendChild(cellData);

                            var cellDestinatario = document.createElement('td');
                            cellDestinatario.textContent = destinatario;
                            row.appendChild(cellDestinatario);

                            // Creazione della cella InfoProdotto con i prodotti separati da un a capo
                            var cellInfoProdotto = document.createElement('td');
                            prodotti.forEach(function(prodotto, index) {
                                var productLink = document.createElement('a');
                                productLink.href = '/FratelliMuraca/details?id=' + prodotto["idProdotto"];
                                productLink.textContent = prodotto["nome"] + " - Quantita': " + prodotto["quantita"];
                                productLink.style.color = "#1a73e8"; // Stile per il link
                                productLink.style.display = "block"; // Mostra ogni prodotto su una nuova riga

                                cellInfoProdotto.appendChild(productLink);

                                // Aggiungere un a capo tra i prodotti, ma non dopo l'ultimo
                                if (index < prodotti.length - 1) {
                                    cellInfoProdotto.appendChild(document.createElement('br'));
                                }
                            });
                            row.appendChild(cellInfoProdotto);

                            var cellModificaStato = document.createElement('td');
                            var select = document.createElement('select');
                            select.id = "statoSelect_" + idOrdine;
                            select.onchange = function() {
                                changeOrderState(idOrdine);
                            };
                            var states = ["in_elaborazione", "in_transito", "consegnato"];
                            states.forEach(function(state) {
                                var option = document.createElement('option');
                                option.value = state;
                                option.text = state;
                                if (state === ordine["stato"]) {
                                    option.selected = true;
                                }
                                select.appendChild(option);
                            });
                            cellModificaStato.appendChild(select);
                            row.appendChild(cellModificaStato);

                            // Aggiungi la riga dell'ordine al tbody
                            document.querySelector('#ordersTable tbody').appendChild(row);
                        }
                    }
                }
            };
            xhr.open('GET', './ordersFilter', true);
            xhr.send();
        }

        // Esegui queste funzioni quando il DOM � completamente caricato
        document.addEventListener('DOMContentLoaded', function() {
            clearOrders();
            filterOrders();
        });
    </script>
</body>
</html>
