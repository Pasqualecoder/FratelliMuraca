<!DOCTYPE html>
<html lang="it">
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>

<%@ include file="init/cartinit.jsp" %>

<head>
    <%@ include file="parts/head.jsp" %>
    <title>Pagina 1 - Fratelli Muraca</title>
    <link rel="stylesheet" href="css/home-style.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<style>
    body {
        font-family: Arial, sans-serif;
        line-height: 1.6;
        color: #333;
    }
    .section-title {
        font-size: 2.5em;
        margin-bottom: 1em;
        text-transform: uppercase;
        font-weight: bold;
    }
    .section-content {
        font-size: 1.2em;
        line-height: 1.8;
        margin-bottom: 2em;
    }
    .bg-light {
        background-color: #f8f9fa !important;
    }
    .u-custom-color-2 {
        background-color: #607244;
        color: #fff; /* White text color for section below */
    }
    .u-text-palette-1-base {
        color: #007bff;
    }
    .contact-icons a {
        margin: 15px;
        color: #007bff;
        font-size: 3.5em; /* Increased icon size */
    }
    .contact-icons {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px; /* Added margin for spacing */
    }
    .contact-info {
        text-align: center;
        background-color: #fff; /* White background for the outer section */
        color: #333; /* Black text color */
        padding: 20px; /* Padding around the content */
        border-radius: 10px; /* Rounded corners */
        box-shadow: 0 0 15px rgba(0,0,0,0.2); /* Shadow for depth */
    }
    .inner-content {
        background-color: #607244; /* Green background color */
        color: #fff; /* White text color */
        padding: 20px; /* Padding around the content */
        border-radius: 10px; /* Rounded corners */
    }
</style>
</head>

<body class="bg-light">
<%@ include file="parts/navbar.jsp" %>

<main>
    <section class="container my-5 text-center">
        <h2 class="my-4">CONTATTACI</h2>
        <p>Per qualsiasi dubbio siamo a disposizione</p>
    </section>

    <section class="u-custom-color-2 py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 contact-info">
                    <h2>I nostri contatti</h2>
                    <p><strong>Telefono/Whatsapp:</strong> <a href="tel:+393384578681" class="u-text-palette-1-base">338 457 8681</a></p>
                    <p><strong>Email:</strong> <a href="mailto:agricolamuraca@pec.it" class="u-text-palette-1-base">agricolamuraca@pec.it</a></p>
                    <p><strong>Facebook:</strong> <a href="https://www.facebook.com/FratelliMuraca/" target="_blank" class="u-text-palette-1-base">https://www.facebook.com/FratelliMuraca/</a></p>
                    <div class="contact-icons">
                        <a href="https://wa.me/393384578681" target="_blank"><i class="fab fa-whatsapp"></i></a>
                        <a href="tel:+393384578681" target="_blank"><i class="fas fa-phone"></i></a>
                        <a href="https://www.facebook.com/FratelliMuraca/" target="_blank"><i class="fab fa-facebook"></i></a>
                        <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container my-5">
        <div class="embed-responsive embed-responsive-16by9">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3102.1341553974507!2d16.27606152637361!3d38.966604592616974!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x133fe5b9026eb951%3A0x4ae99a21a20554ee!2sPiazza%205%20Dicembre%2C%2088046%20Lamezia%20Terme%20CZ!5e0!3m2!1sen!2sit!4v1719519092382!5m2!1sen!2sit" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>
</main>

<%@ include file="parts/footer.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js" integrity="sha384-rOA1PnstxnOBLzCLMcre8ybwbTmemjzdNlILg8O7z1lUkLXozs4DHonlDtnE7fpc" crossorigin="anonymous"></script>
</body>
</html>