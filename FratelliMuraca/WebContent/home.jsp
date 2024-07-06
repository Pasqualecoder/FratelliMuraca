<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <title>Home - Fratelli Muraca</title>
    <link rel="stylesheet" href="css/home-style.css">
    <style type="text/css">
    
    /* Stili per le immagini nelle card */
    .card-img {
        max-width: 100%;
        height: auto;
        object-fit: cover;
        width: auto;
    }

    .card {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        transition: transform 0.3s ease, box-shadow 0.3s ease; /* Aggiunge una transizione per l'effetto hover */
    }

    /* Effetto hover su tutte le card */
    .card:hover {
        transform: scale(1.05); /* Effetto di ingrandimento al passaggio del mouse */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Aggiunge un'ombra per dare un effetto di sollevamento */
    }

    /* Stili specifici per la card "Oli Classici" */
    .card-classici {
        flex: 1.5; /* Fa sì che questa card prenda il 50% di spazio in più rispetto alle altre */
        border: 2px solid #ffc107; /* Aggiunge un bordo dorato per farla risaltare */
        background-color: rgba(255, 193, 7, 0.1); /* Sfondo leggero giallo */
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
    

    /* Regole specifiche per diversi schermi per migliorare la visualizzazione */
    @media (max-width: 992px) {
        .col-lg-4 {
            max-width: 50%;
            margin-bottom: 20px;
        }

        .card-img-overlay h5 {
            font-size: 1.2rem;
        }

        .card-img-overlay p {
            font-size: 0.9rem;
        }
        
        /* La card "Oli Classici" diventa ancora più prominente su schermi più piccoli */
        .card-classici {
            flex: 1.7; /* La card diventa più grande su schermi più piccoli */
        }
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

    <br>

    <section class="text-center">
    	<a href="./product">

    	</a>
    	<h2 class="font-weight-bold mb-4 font-italic" style="color:	#5f720f;">Scopri il piacere della vera tradizione italiana!</h2>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 mb-4">
                    <a href="./product?categoria=aromatizzati">
                        <div class="card border-0">
                            <img src="media/aromatizzati.jpg" class="card-img img-fluid" alt="aromatizzati">
                            <div class="card-img-overlay">
                                <h5 class="card-title">Oli Aromatizzati</h5>
                                <p class="card-text">Un'esplosione di sapori mediterranei: scopri come i nostri oli aromatizzati possono trasformare ogni piatto.</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 mb-4">
	                   <div class="card card-classici border-0">
		                    <a href="./product?categoria=classici">
	                            <img src="media/classici.jpg" class="card-img img-fluid" alt="classici">
	                            <div class="card-img-overlay">
	                                <h5 class="card-title">Oli Classici</h5>
	                                <p class="card-text">Dal cuore della Calabria, l'essenza pura dell'extravergine: scopri il nostro olio che parla di tradizione.</p>
	                            </div>
		                    </a>
                       </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <a href="./product?categoria=cosmetici">
                        <div class="card border-0">
                            <img src="media/cosmetici.jpg" class="card-img img-fluid" alt="cosmetici">
                            <div class="card-img-overlay">
                                <h5 class="card-title">Cosmetici</h5>
                                <p class="card-text">Riscopri il segreto di una pelle radiosa con i nostri cosmetici all'olio d'oliva: pura cura per una bellezza autentica.</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <a href="./product">
			<h3 class="btn btn-success btn-lg font-weight-bold" >Vieni a scoprire tutti i nostri prodotti...</h3>
    	</a>
        
    </section>
    
    <br><br><br>
    <section class="text-center">
    <div class="ricette-container">
    	<a href=".?page=ricette" class="link-success">
    		<h1 class="display-6 font-italic font-weight-bold" style="color: #607244">Ricette</h1>
        </a>
        <p class="font-weight-bold">I benefici dell'olio EVO, non solo a crudo ma anche in cottura</p>

		
	    <div class="images">
            <img src="media/baccala.jpg" alt="Baccala'">
            <img src="media/pizza.jpg" alt="Pizza">
            <img src="media/peperoni.jpg" alt="Peperoni">
        </div>
    </div>
    </section>

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
