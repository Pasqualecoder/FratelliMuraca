<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>
<%
// inizializzo l'unico prodotto di cui si vogliono vedere le info
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
%>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%@ include file="parts/header.jsp" %>

<%= prodotto %>

<%@ include file="parts/footer.jsp" %>
</body>
</html>