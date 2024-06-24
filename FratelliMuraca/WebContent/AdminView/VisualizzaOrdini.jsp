<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<OrderBean> orderList = (LinkedList<OrderBean>) request.getAttribute("orderList"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Visualizza Ordini Admin - Fratelli Muraca</title>
</head>
<body>
<div class="central-container" id="dashboard-container">
	<a class="go-back" href="admin">&#171; Dashboard</a>

	<h2> Gestione Ordini </h2>
	<p> lista Ordini</p>
	<table border="1">
	    <tr>
	        <th>Id</th>
	        <th>IdCliente</th>
	        <th>Dettagli</th>
	        <th>InfoProdotto</th>
	        <th>ModificaStato</th>
	    </tr>
	    <% if (orderList != null && !orderList.isEmpty()) {
	          for (OrderBean externalOrder : orderList) 
	          {%>
	    <tr>
	        <td><%= externalOrder.getId() %></td>
	        <td><%= externalOrder.getId_cliente() %></td>
	        <td><%= externalOrder.getDetails() %></td>
	        <td><%= externalOrder.getProdotti() %></td>
	        <td>
	        	<select>
		        	<% for (StatoOrdine stato : StatoOrdine.values()) { %>
		        	<option value="<%= stato %>" <%= stato == externalOrder.getStato() ? "selected" : "" %>>
		        		<%= stato %>
		        	</option><% } %>
	        	</select>
        	</td>
  
	    </tr>
	    <% } %>
	    <% } %>	 
	</table>
	
</div>
</body>
</html>