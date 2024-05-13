<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>

<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>

<%
Boolean opStatus = (Boolean) request.getAttribute("opStatus");

// NESSUNA OPERAZIONE EFFETTUATA
if (opStatus == null) {%>
	<h1>ultimi ordini</h1>
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
for (Order or : ordini) {%>
	<p><%= or %></p>
<%}
%>

<%@ include file="parts/footer.jsp" %>
</body>
</html>