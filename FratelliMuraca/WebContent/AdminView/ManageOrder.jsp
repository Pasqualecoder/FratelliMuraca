<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, model.*, java.util.stream.Collectors" pageEncoding="UTF-8"%>

<%

LinkedList<OrderBean> orderList = (LinkedList<OrderBean>) request.getAttribute("listaOrdini");
%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
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
<div class="container">
	<a class="mt-4 btn btn-lg btn-warning go-back" href="dashboard">&#171; Dashboard</a>
    <div class="row justify-content-center">
        <div class="col-12 text-center">
            <h1 class="mt-4 mb-4 font-weight-bold">Gestione Ordini</h1>
        </div>
    </div>
    
    <!-- Form per il filtro degli ordini -->
    <form id="filterForm">
        <label for="clienteId">Id Cliente:</label>
        <input type="number" class="ml-3 mb-3" name="clienteId" id="clienteId"><br>

        <label for="dataStart">Data Start:</label>
        <input type="date" class="ml-3 mb-3" name="dataStart" id="dataStart"><br>

        <label for="dataEnd">Data End:</label>
        <input type="date" class=" ml-3 mb-3" name="dataEnd" id="dataEnd"><br>

        <button type="button" class="ml-3 btn-success btn " onclick="filterOrders()">Filtra</button>
    </form>

    <table id="ordersTable" border="1">
        <thead>
            <tr>
                <th>Id</th>
                <th>IdCliente</th>
                <th>Data</th>
                <th>Destinatario</th>
                <th>Prodotti</th>
                <th>Totale</th>
                <th>ModificaStato</th>
                <th>Ricevuta</th>
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
                        
                        var totale = "€ " + ordine["details"]["purchase_units"][0]["amount"]["value"];
                        
                        
                        

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
                            
                            var cellTotale = document.createElement('td');
                            cellTotale.textContent = totale;
                            row.appendChild(cellTotale);

                            var cellModificaStato = document.createElement('td');
                            var select = document.createElement('select');
                            select.id = "statoSelect_" + idOrdine;
                            select.className = 'form-select';
                            
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
                            
                            var cellRicevuta = document.createElement('td');
                            var anchor = document.createElement('a');
                            anchor.href = '../receipt?id=' + idOrdine;
                            anchor.className = 'btn btn-success';
                            anchor.textContent = 'Ricevuta';
                            cellRicevuta.appendChild(anchor);
                            row.appendChild(cellRicevuta);
								
                        
                         

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
