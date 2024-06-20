<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
	  <meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
	  <title>Bootstrap Slideshow</title>
	  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  
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
    
      <style>
    /* Custom styles to control the size of the slideshow */
    .custom-carousel {
      max-width: 1200px; /* Set your desired width */
      margin: 20px auto; /* Center the carousel with some margin */
      position: relative;
    }
    .carousel-inner {
      height: 600px; /* Default height */
    }
    .img-container {
      height: 100%; /* Make container fill the carousel-inner */
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }
    .img-container img {
      height: 100%;
      width: auto; /* Maintain aspect ratio */
    }
    .carousel-control-prev,
    .carousel-control-next {
      width: 30%; /* Adjust the width of the controls */
    }
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
      background-size: 100%, 100%; /* Ensure the icons fit within the controls */
    }

    /* Media query for smaller screens */
    @media (max-width: 768px) {
      .carousel-inner {
        height: 300px; /* Adjust height for smaller screens */
      }
    }
    /* Media query for very small screens */
    @media (max-width: 576px) {
      .carousel-inner {
        height: 200px; /* Adjust height for very small screens */
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

<h2> About us </h2>
<br>
<p> 
	Da oltre un secolo la famiglia Muraca si dedica alla coltivazione degli ulivi e alla produzione di olio extra vergine di oliva.
	<br>
	Dalla passione e tenacia, nel rispetto per l’ambiente ed impiegando innovazioni tecnologiche finalizzate al perseguimento di una qualità sempre più alta, nell’anno 2008 nasce la Società Fratelli Muraca con lo scopo di proseguire quanto lasciato in eredità dai propri avi. 
	<br>
	<img src="media/fratelli_muraca_retro1.jpg" alt= "fratelli muraca anni 50/60">
	<img src="media/fratelli_muraca_retro2.jpg" alt= "fratelli muraca anni 50/60">
    <br>
    <br>
	La Società applicando le linee giuda dell’agricoltura biologica, priva dell’utilizzo di prodotti di sintesi, segue tutte le fasi produttive ovvero dalla coltivazione delle olive all’estrazione e confezionamento dell’olio.
	<img src ="media/marchio_bio_ue.png" alt = "logo bio UE">
	<br> 
	<br>
	Gli uliveti, prevalentemente della cultivar Carolea dal quale si produce un olio strutturato, elegante ed equilibrato, con sentori vegetali di erba, carciofo, mela verde, e sfumature d’amaro e piccante sono ubicati nella piana di Lamezia Terme. 
	<img src="media/alberi_muraca.jpg" alt = "alberi d'olio">
	<br>
	<br>
	L’estrazione dell’olio ha inizio portando subito le olive al frantoio, dopo la fase della raccolta che avviene nel momento in cui il frutto raggiunge la maturazione ideale, mediante l’utilizzo di mezzi meccanici senza stress per le piante secolari e garantendo l’integrità del frutto, assicurandone cosi le caratteristiche organolettiche. Nello specifico la molitura che avviene entro poche ore dalla raccolta, viene svolta attraverso impianti tecnologici del tipo a ciclo continuo, rigorosamente a freddo sotto i 25°, al fine di ottenere maggiore qualità. 
	<img src="media/olio_pressatura.jpg" alt = "olio viene estratto">
	<br>
	<br>
	L’olio prodotto viene poi trasferito nei magazzini aziendali, stoccato in appositi contenitori di acciaio inox, in assenza di luce, ossigeno e fonti di calore, al fine di conservarne i composti fenolici e le qualità organolettiche. 
	<img src="media/camion_muraca.jpg" alt = "camion muraca">
	<br>
	<br>
	L’olio prodotto dalla Carolea è un olio equilibrato, armonico che ben si presta ad esaltare, senza coprirli, tutti i sapori. Inoltre può essere utilizzato nei vari abbinamenti, tanto a crudo che nelle preparazioni, ricordando inoltre che la composizione chimica dell’olio di oliva, grazie al suo alto “punto di fumo“,  lo rende particolarmente indicato e sano per friggere. Molte sono le proprietà riconosciute all’olio extravergine di oliva, le quali attualmente sono in grado di migliorare di molto lo stato di benessere di chi lo assume: (antinfiammatoria, antiallergica, antibatterica, antivirale, favorisce la digestione gastrica perché agisce migliorando le contrazioni della cistifellea e provocando la liberazione degli acidi biliari, attiva nella prevenzione delle malattie degenerative, diabete, colesterolo nel sangue, cancro, malattie cardiovascolari e l’invecchiamento precoce). 
	<img src="media/olio_frittura.png" alt = "frittura">
	<img src="media/olio_insalata.jpg" alt = "insalata">
	<img src="media/olio_pasta.jpg" alt = "pasta">
	<br>
	<br>
	Per tali motivi è consigliabile assumere quotidianamente circa 20 g di olio d’oliva, in modo tale da sfruttare al meglio i molteplici benefici e salvaguardare le cellule, grazie soprattutto al contenuto di vitamina E.
	<img src="media/benefici_olio.jpg" alt = "benefici olio">
</p>




<div class="custom-carousel">
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
    
      <!-- Prima slide -->
      <div class="carousel-item active">
        <div class="img-container">
          <img class="d-block" src="media/fratelli_muraca_retro1.jpg" alt="First slide">
        </div>
        <div class="carousel-caption d-none d-md-block">
          <p>
            Da oltre un secolo la famiglia Muraca si dedica alla coltivazione degli ulivi e alla produzione di olio extra vergine di oliva.
            <br>
            Dalla passione e tenacia, nel rispetto per l’ambiente ed impiegando innovazioni tecnologiche finalizzate al perseguimento di una qualità sempre più alta, nell’anno 2008 nasce la Società Fratelli Muraca con lo scopo di proseguire quanto lasciato in eredità dai propri avi.
          </p>
        </div>
      </div>
      <!-- Fine prima slide -->
      
      <div class="carousel-item">
        <div class="img-container">
          <img class="d-block" src="media/placeholder.png" alt="Second slide">
        </div>
      </div>
      <div class="carousel-item">
        <div class="img-container">
          <img class="d-block" src="media/placeholder.png" alt="Third slide">
        </div>
      </div>
      
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>