<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // Recupera gli attributi di errore dal contesto della richiesta
    Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
    String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
    String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");
    
    Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
    String servletName = (String) request.getAttribute("javax.servlet.error.servlet_name");
    
    if (requestUri == null) {
        requestUri = "Unknown";
    }
    if (servletName == null) {
        servletName = "Unknown";
    }
    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error <%= statusCode %> - Fratelli Muraca</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="/FratelliMuraca/css/navbar-style.css">
</head>
<body>
	<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
	<!-- Home Icon -->
    <a class="navbar-brand position-relative nav-link" href="/FratelliMuraca/home">
    	<i class="fas fa-home home-icon"></i>
    </a>
    
    <!-- Navbar links (hidden on smaller screens) -->
    <div class="collapse navbar-collapse justify-content-end">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/FratelliMuraca/home">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/FratelliMuraca/product">Prodotti</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/FratelliMuraca/home?page=about">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/FratelliMuraca/home?page=contacts">Contatti</a>
            </li>
        </ul>
    </div>
</nav>
	
	
	
	<h1 class="text-danger font-italic text-center">Si è verificato un errore</h1>
	<a href="/FratelliMuraca/home"><h3 class="font-italic text-center">Torna al sicuro</h3></a>
    <h2>Error <%= statusCode %></h2>
    <p><strong>Messaggio di Errore:</strong> <%= errorMessage %></p>
    <p><strong>URI Richiesta:</strong> <%= requestUri %></p>
    <p><strong>Servlet Name:</strong> <%= servletName %></p>

    <% if (throwable != null) { %>
        <p><strong>Eccezione:</strong></p>
        <pre><%= throwable.getMessage() %></pre>
        <pre><%= throwable.getStackTrace() %></pre>
    <% } %>

    <img alt="huh?" src="https://i.kym-cdn.com/entries/icons/original/000/046/895/huh_cat.jpg" width="500px">
    <br><br><br>
</body>
</html>
