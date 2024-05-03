<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%@ include file="parts/header.jsp" %>

<%
// per ogni elemento all'interno del carrello (entrySet sarebbe l'insieme delle coppie del dizionario)
for (Map.Entry<ProductBean, Integer> entry : cart.getProducts().entrySet()) {
	ProductBean prodotto = entry.getKey();
	int quantity = entry.getValue();
%>
	<p><%= prodotto.getNome() %>: x<%= quantity %></p>
<%}
%>

<%@ include file="parts/footer.jsp" %>
</body>
</html>