<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
<h1 style="text-align: center;">Admin Page</h1>
<h2>Products</h2>
<ul>
  <c:forEach var="product" items="${products}"> <!--itera i prodotti nella lista  -->
    <li>
      <span>Name:</span> ${product.getName()} <br>
      <span>Price:</span> ${product.getPrice()} <br>
      <span>Description:</span> ${product.getDescription()} <br>
      <a href="/product/${product.getId()}">Detailed Description</a>
      <img src="images/${product.getImage()}" alt="${product.getName()}" width="300" height="300"><br>
      <button type="button">Modifica</button>
      <button type="button">Rimuovi</button>
		</li>
  </c:forEach>
</ul>

<form method="GET" action="addProduct.html">
<button type="submit">Aggiungi Prodotto</button>
</form>
</body>
</html>