<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <title>Ricette - Fratelli Muraca</title>
    
    <link rel="stylesheet" href="css/home-style.css">
    <%@ include file="parts/head.jsp" %>

</head>
<body>
    <%@ include file="parts/navbar.jsp" %>

    <!-- Banner with logo -->
    <header class="banner">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <img src="media/logo.png" alt="Logo Azienda" class="img-fluid">
                </div>
            </div>
        </div>
    </header>

	<div class="container my-5">
        <div class="row">
            <div class="col-12 text-center">
                <h2>Crediti</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <ul class="list-group">
                    <li class="list-group-item" onclick="handleClick(this)">Pasquale Muraca - p.muraca@studenti.unisa.it - 05121/16807</li>
                    <li class="list-group-item" onclick="handleClick(this)">Giuseppe Pastena - g.pastena1@studenti.unisa.it - 05121/18169</li>
                    <li class="list-group-item" onclick="handleClick(this)">Salvatore Conte - s.conte19@studenti.unisa.it - 05121/17275</li>
                    <li class="list-group-item" onclick="handleClick(this)">Mariairene La Torre - m.latorre7@studenti.unisa.it - 05121/17155</li>
                </ul>
            </div>
        </div>
    </div>
	<script>
        function handleClick(element) {
            
            let clickCount = parseInt(element.getAttribute('data-click-count')) || 0;
            clickCount++;

           
            element.setAttribute('data-click-count', clickCount);

            
            if (clickCount === 4) {
                window.location.href = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
            }
        }
    </script>

    <%@ include file="parts/footer.jsp" %>
</body>
</html>
