<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*, model.*, java.util.stream.Collectors" pageEncoding="UTF-8"%>

<%
// Assuming LinkedList<OrderBean> orderList is populated elsewhere in your servlet or JSP
LinkedList<OrderBean> orderList = (LinkedList<OrderBean>) request.getAttribute("listaOrdini");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Visualizza Ordini Admin - Fratelli Muraca</title>
</head>
<body>
<div class="central-container" id="dashboard-container">
    <a class="go-back" href="/FratelliMuraca/admin">&#171; Dashboard</a>
    <h2>Gestione Ordini</h2>
    
    <div>
    	<h4>Filtraggio</h4>
		id cliente <input type="text"> <br>
		data inizio <input type="date"> <br> 
		data fine <input type="date"> <br>
    </div>
    
    <p>Lista Ordini</p>
    <table border="1">
        <tr>
            <th>Id</th>
            <th>IdCliente</th>
            <th>Dettagli</th>
            <th>InfoProdotto</th>
            <th>ModificaStato</th>
        </tr>
			<% if (orderList != null && !orderList.isEmpty()) {
              for (OrderBean externalOrder : orderList) { 
              LinkedList<ProductBean> products = externalOrder.getProdotti().retrieveProducts();
              String productNames = products.stream()
                                                .map(ProductBean::getNome)
                                                .collect(Collectors.joining(", "));%>
			<tr>
            <td><%= externalOrder.getId() %></td>
            <td><%= externalOrder.getId_cliente() %></td>
            <td><%= externalOrder.getDetails() %></td>
            <td><%= productNames %></td>
            <td>
                <select id="statoSelect" onchange="changeOrderState('<%= externalOrder.getId() %>')">
                    <% for (StatoOrdine stato : StatoOrdine.values()) { %>
                        <option value="<%= stato %>" <%= stato == externalOrder.getStato() ? "selected" : "" %>>
                            <%= stato %>
                        </option>
                    <% } %>
                </select>
            </td>
        </tr>
        <% } %>
        <% } %>
    </table>
</div>

<script>
    function changeOrderState(orderId) {
        var selectedValue = document.getElementById("statoSelect").value;

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
</script>

</body>
</html>