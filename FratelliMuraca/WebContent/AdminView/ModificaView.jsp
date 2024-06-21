<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
LinkedList<Integer> immagini = prodotto.getImmagini();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_style.css">
</head>
<body>
	<div class="central-container" id="edit-product-container">
		<div class="container-title">
	    Modifica Prodotto
		</div>
	<form>
</form>
</div>
</body>
</html>