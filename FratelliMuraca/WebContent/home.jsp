<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <style>
        /* Stile per il banner con logo centrato */
        .banner {
            background-color: #607244; /* Colore di sfondo */
            padding: 50px 0; /* Spaziatura interna */
        }

        .banner img {
            max-width: 100%; /* Immagine del logo al massimo della larghezza del contenitore */
            max-height: 500px; /* Altezza massima dell'immagine del logo */
        }

        /* Stile per le categorie di prodotti */
        .categories {
            padding: 50px 0; /* Spaziatura interna */
        }

        .categories img {
            width: 100%; /* Immagini delle categorie larghe al 100% */
            border-radius: 5px; /* Bordo arrotondato */
            margin-bottom: 20px; /* Spaziatura inferiore */
        }
		
		/* Stile per i card con immagine e testo in overlay */
		.card {
			position: relative;
			margin-bottom: 30px;
			border: none;
			height: 400px; /* Altezza dei card */
		}
		
		.card img {
			border-radius: 5px;
			width: 100%; /* Larghezza immagine al 100% del card */
			height: 100%; /* Altezza immagine al 100% del card */
			object-fit: cover; /* Copertura immagine */
			transition: transform .2s;
		}
		
		.card img:hover {
			transform: scale(1.05);
		}
		
		.card .card-img-overlay {
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			right: 0;
			color: white;
			opacity: 0;
			background-color: rgba(0, 0, 0, 0.7);
			border-radius: 5px;
			transition: opacity .3s;
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.card:hover .card-img-overlay {
			opacity: 1;
		}
	
	
		
    </style>
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

    <!-- Categories of products -->
    <section class="categories">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a href="prodotti-aromatizzati.jsp">
                        <img src="media/groot.png" alt="Oli Aromatizzati" class="img-fluid">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="prodotti-classici.jsp">
                        <img src="media/groot.png" alt="Oli Classici" class="img-fluid">
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="cosmetici.jsp">
                        <img src="media/groot.png" alt="Oli Cosmetici" class="img-fluid">
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap cards with image and text overlay -->
   <<section class="text-center"> <!-- Added text-center class to center align content -->
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-MtiAkIMgfizxrWvHqutR8S3v7h1tC8Gai9NruxHwiTixbDfi5G4Lc3H2zp1LYU9S"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-APsP1PUH29OdK9fn+5qzrBEyY2L1pZWVC7nC1z3+3AaP1A2Gm3juD5ag2FbF65x4"
        crossorigin="anonymous"></script>
        
 <%@ include file="parts/footer.jsp" %>
</body>
</html>
