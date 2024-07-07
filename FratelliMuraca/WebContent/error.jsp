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
<style>
        .footer {
            text-align: center;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            list-style-type: none;
            padding: 0;
        }
        .social-icons li {
            margin-right: 15px; /* Adjust margin between icons if needed */
        }
    </style>
<meta charset="UTF-8">
<title>Error <%= statusCode %> - Fratelli Muraca</title>
  <link rel="stylesheet" href="css/footer-style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link rel="stylesheet" href="/FratelliMuraca/css/navbar-style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	
<body class=" d-flex flex-column min-vh-100" >

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

<div class="w-50 container text-center pt-3 error-container">
    <a href="https://www.youtube.com/watch?v=xVWeRnStdSA" target="_blank">
        <img class="mt-4 img-float" alt="huh?" src="./media/cat-huh.gif" width="400px" height="200px">
    </a>
    <h1 class="text-danger display-3">Si è verificato un errore <i class="fa-regular fa-face-frown"></i></h1>
    <h1 class="mt-2 display-1"><%= statusCode %></h1>
    <h4 class="mt-3"><strong>Messaggio di Errore:</strong> <%= errorMessage %></h4>
    <a href="/FratelliMuraca/home" class="mb-3 btn btn-success btn-lg mt-4">
        <i class="fas fa-home"></i> Torna alla <strong>Home</strong>
    </a>
</div>
        
 <footer class="footer mt-auto">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto"> <!-- Center the column -->
                    <h5>La nostra azienda</h5>
                    <ul class="list-unstyled">
                        <li><a href="home?page=about">About Us</a></li>
                        <li><a href="home?page=contacts">Contattaci</a></li>
                    </ul>
                </div>
                <div class="col-md-6 mx-auto"> <!-- Center the column -->
                    <h5>I nostri contatti</h5>
                    <ul class="social-icons">
                        <li><a href="https://wa.me/393384578681" class="whatsapp" aria-label="WhatsApp"><i class="fab fa-whatsapp"></i></a></li>
                        <li><a href="tel:+393384578681" class="phone" aria-label="Phone"><i class="fas fa-phone"></i></a></li>
                        <li><a href="https://www.facebook.com/FratelliMuraca/" class="facebook" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="https://www.instagram.com" class="instagram" aria-label="Instagram"><i class="fab fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <a href="/FratelliMuraca/home?page=crediti"><img src="media/groot.png" alt="groot" class="footer-img"></a>
    </footer>

</body>
</html>
