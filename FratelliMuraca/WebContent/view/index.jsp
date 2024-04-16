<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Fratelli Muraca</title>
<meta charset="ISO-8859-1">
<title><%= request.getAttribute("title") %></title>
</head>
<body>
<h1 style="text-align: center;">Fratelli Muraca</h1>

<h2>Products</h2>
<ul>
  <c:forEach var="product" items="${products}"> <!--itera i prodotti nella lista  -->
    <li>
      <span>Name:</span> ${product.getName()} <br>
      <span>Price:</span> ${product.getPrice()} <br>
      <span>Description:</span> ${product.getDescription()} <br>
      <a href="/product/${product.getId()}">Detailed Description</a>
      <img src="media/${product.getImage()}" alt="${product.getName()}" width="300" height="300"><br>
      <button type="button">Aggiungi al carrello</button>
    </li>
  </c:forEach>
</ul>
</body>
</html>