<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
LinkedList<OrderBean> ordini = (LinkedList) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
<meta charset="UTF-8">
<title>Modifica Catalogo Admin - Fratelli Muraca</title>
</head> 
<body>
    <div class="central-container" id="order-manager-container">
        <h3>Gestione Ordini</h3>
        <table border="1" class="order-table">
            <thead>
                <tr>
                    <th>ID Ordine</th>
                    <th>ID Cliente</th>
                </tr>
            </thead>
            <tbody>
                <% for (OrderBean order : ordini) { %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getId_cliente() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>