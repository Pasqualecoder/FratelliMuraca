<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Fratelli Muraca</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <style>
        .banner {
            background-color: #607244;
            padding: 50px 0;
        }

        .banner img {
            max-width: 100%;
            max-height: 500px;
        }

        .categories {
            padding: 50px 0;
        }

        .categories img {
            width: 100%;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .card {
            position: relative;
            margin-bottom: 30px;
            border: none;
            height: 400px;
        }

        .card img {
            border-radius: 5px;
            width: 100%;
            height: 100%;
            object-fit: cover;
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

        .custom-carousel {
            max-width: 1200px;
            margin: 20px auto;
            position: relative;
        }

        .carousel-inner {
            height: 600px;
        }

        .img-container {
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .img-container img {
            height: 100%;
            width: auto;
        }

        .carousel-control-prev,
        .carousel-control-next {
            width: 30%;
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-size: 100%, 100%;
        }

        @media (max-width: 768px) {
            .carousel-inner {
                height: 300px;
            }
        }

        @media (max-width: 576px) {
            .carousel-inner {
                height: 200px;
            }
        }

        .content-section {
            padding: 50px 0;
        }

        .content-section h2 {
            margin-bottom: 30px;
        }

        .content-section img {
            margin: 20px 0;
            max-width: 100%;
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

    <section class="content-section">
        <div class="container">
            <h2>About us</h2>
            <div class="row">
                <div class="col-md-8">
                    <p>
                        Da oltre un secolo la famiglia Muraca si dedica alla coltivazione degli ulivi e alla produzione di olio extra vergine di oliva.
                        <br>
                        Dalla passione e tenacia, nel rispetto per l’ambiente ed impiegando innovazioni tecnologiche finalizzate al perseguimento di una qualità sempre più alta, nell’anno 2008 nasce la Società Fratelli Muraca con lo scopo di proseguire quanto lasciato in eredità dai propri avi.
                    </p>
                    <img src="media/fratelli_muraca_retro1.jpg" alt="fratelli muraca anni 50/60">
                    <img src="media/fratelli_muraca_retro2.jpg" alt="fratelli muraca anni 50/60">
                    <p>
                        La Società applicando le linee guida dell’agricoltura biologica, priva dell’utilizzo di prodotti di sintesi, segue tutte le fasi produttive ovvero dalla coltivazione delle olive all’estrazione e confezionamento dell’olio.
                    </p>
                    <img src="media/alberi_muraca.jpg" alt="alberi d'olio">
                    <p>
                        Gli uliveti, prevalentemente della cultivar Carolea dal quale si produce un olio strutturato, elegante ed equilibrato, con sentori vegetali di erba, carciofo, mela verde, e sfumature d’amaro e piccante sono ubicati nella piana di Lamezia Terme.
                    </p>
                    <img src="media/olio_pressatura.jpg" alt="olio viene estratto">
                    <p>
                        L’estrazione dell’olio ha inizio portando subito le olive al frantoio, dopo la fase della raccolta che avviene nel momento in cui il frutto raggiunge la maturazione ideale, mediante l’utilizzo di mezzi meccanici senza stress per le piante secolari e garantendo l’integrità del frutto, assicurandone cosi le caratteristiche organolettiche. Nello specifico la molitura che avviene entro poche ore dalla raccolta, viene svolta attraverso impianti tecnologici del tipo a ciclo continuo, rigorosamente a freddo sotto i 25°, al fine di ottenere maggiore qualità.
                    </p>
                    <img src="media/camion_muraca.jpg" alt="camion muraca">
                    <p>
                        L’olio prodotto viene poi trasferito nei magazzini aziendali, stoccato in appositi contenitori di acciaio inox, in assenza di luce, ossigeno e fonti di calore, al fine di conservarne i composti fenolici e le qualità organolettiche.
                    </p>
                    <p>
                        L’olio prodotto dalla Carolea è un olio equilibrato, armonico che ben si presta ad esaltare, senza coprirli, tutti i sapori. Inoltre può essere utilizzato nei vari abbinamenti, tanto a crudo che nelle preparazioni, ricordando inoltre che la composizione chimica dell’olio di oliva, grazie al suo alto “punto di fumo“, lo rende particolarmente indicato e sano per friggere. Molte sono le proprietà riconosciute all’olio extravergine di oliva, le quali attualmente sono in grado di migliorare di molto lo stato di benessere di chi lo assume: (antinfiammatoria, antiallergica, antibatterica, antivirale, favorisce la digestione gastrica perché agisce migliorando le contrazioni della cistifellea e provocando la liberazione degli acidi biliari, attiva nella prevenzione delle malattie degenerative, diabete, colesterolo nel sangue, cancro, malattie cardiovascolari e l’invecchiamento precoce).
                    </p>
                    <img src="media/olio_frittura.png" alt="frittura">
                    <img src="media/olio_insalata.jpg" alt="insalata">
                    <img src="media/olio_pasta.jpg" alt="pasta">
                    <p>
                        Per tali motivi è consigliabile assumere quotidianamente circa 20 g di olio d’oliva, in modo tale da sfruttare al meglio i molteplici benefici e salvaguardare le cellule, grazie soprattutto al contenuto di vitamina E.
                    </p>
                    <img src="media/benefici_olio.jpg" alt="benefici olio">
                </div>
                <div class="col-md-4 text-center">
                    <img src="media/marchio_bio_ue.png" alt="logo bio UE" class="img-fluid my-4">
                </div>
            </div>
        </div>
    </section>

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
    <section class="text-center">
        <div class="container">
            <div class="row justify-content-center">
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
        </div>
    </section>

    <!-- Bootstrap JS and custom script -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <%@ include file="parts/footer.jsp" %>
</body>
</html>