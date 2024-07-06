<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <title>Ricette - Fratelli Muraca</title>
    
    <link rel="stylesheet" href="css/home-style.css">
    <%@ include file="parts/head.jsp" %>
    <style type="text/css">
    @charset "UTF-8"; 

.ricette-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
}

div.ricette-container > header {
    text-align: center;
    background-color: #607244;
    color: #fff;
    padding: 20px;
}

div.ricette-container > header h1 {
    margin: 0;
    font-size: 36px;
}

div.ricette-container > header p {
    margin: 5px 0 0 0;
    font-size: 14px;
}

div.ricette-container > .images {
    display: flex;
    justify-content: space-around;
    margin: 20px 0;
}

div.ricette-container > .images img {
    width: 30%;
    border-radius: 8px;
}

div.ricette-container > .recipe {
    text-align: center;
    background-color: #f7f7f7;
    padding: 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}

div.ricette-container > .recipe img {
    width: 100%;
    border-radius: 8px;
    margin-bottom: 10px;
}

div.ricette-container > .recipe h2 {
    color: #607244;
    font-size: 28px;
    margin: 0 0 10px 0;
}

div.ricette-container > .recipe p {
    font-size: 16px;
    color: #333;
    margin: 0 0 10px 0;
}

div.ricette-container > .recipe ul {
    list-style: none;
    padding: 0;
    text-align: left;
    display: inline-block;
    margin: 0 0 20px 0;
}

div.ricette-container > .recipe ul li {
    font-size: 16px;
    color: #333;
    margin-bottom: 5px;
}

div.ricette-container > .recipe a {
    text-decoration: none;
    color: #607244;
    font-weight: bold;
    font-size: 16px;
}

div.ricette-container > .recipe a:hover {
    text-decoration: underline;
}
    
    </style>

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

	<div class="ricette-container">
        <header>
            <h1>Ricette</h1>
            <p><strong>I benefici dell'olio EVO, non solo a crudo ma anche in cottura</strong></p>
        </header>
        <section class="recipe">
            <img src="media/peperoni.jpg" alt="Bruschetta piccante alla calabrese">
            <h2><i>Bruschetta piccante alla calabrese</i></h2>
            <p><strong>Piatto tipico della Calabria.</strong></p>
            <ul>
                <li>Filone di pane</li>
                <li>Olio extravergine di oliva</li>
                <li>Mozzarella fresca</li>
                <li>Peperoni grigliati</li>
                <li>Capperi</li>
                <li>Basilico, sale e pepe</li>
                <li>Peperoncino a piacere</li>
            </ul>
            <br>
            <a href="https://blog.giallozafferano.it/lacucinadimara/bruschetta-piccante-alla-calabrese/" target="_blank">Giallo Zafferano</a>
        </section>
        <hr style="width:100%;text-align:center;margin-left:0;background-color:black;">
        <section class="recipe">
        	<img src="media/baccala.jpg" alt="Baccala'">
            <h2><i>Baccalà alla lucana con peperoni cruschi</i></h2>
            <p><strong>Piatto tipico della Basilicata.</strong></p>
            <ul>
                <li>500 g Baccalà (già ammollato)</li>
                <li>4 Peperoni cruschi</li>
                <li>q.b. Olio extravergine d'oliva</li>
                <li>1 ciuffo Prezzemolo</li>
            </ul>
            <br>
            <a href="https://blog.giallozafferano.it/peccatodigola/baccala-con-peperoni-cruschi/" target="_blank">Giallo Zafferano</a>
        </section>
        <hr style="width:100%;text-align:center;margin-left:0;background-color:black;">
        <section class="recipe">
            <img src="media/pizza.jpg" alt="Pizza Margherita">
            <h2><i>Pizza Margherita</i></h2>
            <p><strong>Piatto tipico della Campania.</strong></p>
            <ul>
                <li>Farina</li>
                <li>Acqua</li>
                <li>Lievito di birra secco</li>
                <li>Olio extravergine d'oliva</li>
                <li>Sale fino</li>
                <li>Mozzarella</li>
                <li>Grana Padano DOP</li>
                <li>Basilico q.b</li>
            </ul>
            <br>
            <a href="https://ricette.giallozafferano.it/Pizza-Margherita.html" target="_blank">Giallo Zafferano</a>
        </section>
    </div>

    <!-- Bootstrap JS and custom script -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
            integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
            crossorigin="anonymous"></script>

    <%@ include file="parts/footer.jsp" %>
</body>
</html>
