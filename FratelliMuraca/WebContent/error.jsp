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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	
<body class=" d-flex flex-column min-vh-100" style="background-color:#d3d3d3;">



<div class="w-50 container text-center mt-5 pt-5 error-container">
    <a href="https://www.youtube.com/watch?v=xVWeRnStdSA" target="_blank">
        <img class="mt-4 img-fluid" alt="huh?" src="https://i.kym-cdn.com/entries/icons/original/000/046/895/huh_cat.jpg" width="400px">
    </a>
    <h1 class="text-danger display-3">Si è verificato un errore <i class="fa-regular fa-face-frown"></i></h1>
    <h1 class="mt-2 display-1"><%= statusCode %></h1>
    <h4 class="mt-3"><strong>Messaggio di Errore:</strong> <%= errorMessage %></h4>
    <a href="/FratelliMuraca/home" class="mb-3 btn btn-success btn-lg mt-4">
        <i class="fas fa-home"></i> Torna alla <strong>Home</strong>
    </a>
</div>
        

</body>
</html>
