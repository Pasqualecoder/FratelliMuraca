<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>

<%@ include file="init/cartinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>

<%
Collection<Order> ordini = (Collection<Order>) request.getAttribute("ordini");
for (Order or : ordini) {%>
	<p><%= or %></p>
<%}
%>

<%@ include file="parts/footer.jsp" %>
</body>
</html>