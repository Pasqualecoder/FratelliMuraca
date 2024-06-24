<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
<title>Home - Fratelli Muraca</title>
<link rel="stylesheet" href="css/home-style.css">
<%@ include file="parts/head.jsp" %>
</head>
<body>
    <%@ include file="parts/navbar.jsp" %>

    <!-- Banner with logo -->
    <a href=".">
	    <header class="banner">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-md-6 text-center">
	                    <img src="media/logo.png" alt="Logo Azienda" class="img-fluid">
	                </div>
	            </div>
	        </div>
	    </header>
    </a>

    <!-- Categories of products -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a href="prodotti-aromatizzati">
                        <img src="media/groot.png" alt="Oli Aromatizzati" class="img-fluid">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="prodotti-classici">
                        <img src="media/groot.png" alt="Oli Classici" class="img-fluid">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="cosmetici">
                        <img src="media/groot.png" alt="Oli Cosmetici" class="img-fluid">
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap cards with image and text overlay -->
   <section class="text-center"> <!-- Added text-center class to center align content -->
    <div class="row justify-content-center"> <!-- Added justify-content-center to center align columns -->
        <div class="col-lg-3 mb-4">
            <div class="card">
                <img src="media/logo.png" class="card-img" alt="Card Image">
                <div class="card-img-overlay">
                    <h5 class="card-title">Card Title 1</h5>
                    <p class="card-text">Some quick example text to show content.</p>
                </div>
            </div>
        </div>
        <div class="col-lg-3 mb-4">
            <div class="card">
                <img src="media/placeholder.png" class="card-img" alt="Card Image">
                <div class="card-img-overlay">
                    <h5 class="card-title">Card Title 2</h5>
                    <p class="card-text">Some quick example text to show content.</p>
                </div>
            </div>
        </div>
        <div class="col-lg-3 mb-4">
            <div class="card">
                <img src="media/groot.png" class="card-img" alt="Card Image">
                <div class="card-img-overlay">
                    <h5 class="card-title">Card Title 3</h5>
                    <p class="card-text">Some quick example text to show content.</p>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Bootstrap JS and custom script -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
 <%@ include file="parts/footer.jsp" %>
</body>
</html>
