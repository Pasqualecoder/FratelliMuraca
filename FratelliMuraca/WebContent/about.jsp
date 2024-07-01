<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>

<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>About - Fratelli Muraca</title>
    <link rel="stylesheet" href="css/home-style.css">
    <%@ include file="parts/head.jsp" %>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
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
            color: #000; /* Set text color to black */
        }
        .img-responsive {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .banner {
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .banner h1 {
            max-width: 800px;
            margin: auto;
            font-size: 2.5em;
        }
        .custom-section {
            padding: 50px 0;
        }
        .text-center {
            text-align: center;
        }
        .d-flex {
            display: flex;
        }
        .align-items-center {
            align-items: center;
        }
        .justify-content-center{
            justify-content: center;
        }
        .py-5 {
            padding: 3em 0;
        }
        .container img {
            margin-bottom: 1em;
        }
        .u-large-text {
            font-size: 1.2em; /* Adjusted font size for consistency */
            color: #000; /* Changed color to black */
        }
        .u-text-variant {
            color: #666;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .small-image {
                display: none; /* Hide the small image on smaller screens */
            }
        }
    </style>
</head>
<body class="u-body u-xl-mode">
<%@ include file="parts/navbar.jsp" %>

<header class="banner">
    <div class="container">
        <div class="row justify-content-center">
            <!-- Centered Video -->
            <div class="container d-flex justify-content-center align-items-center">
                <h1 class="font-weight-light font-italic text-light" style="margin-right: 50px">Un'azienda familiare, basata su un lavoro collettivo ricco di <strong>passione</strong></h1>
                <video loop autoplay controls muted width="640" height="360" class="border">
                    <source src="media/video.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>  
    </div>
</header>

<section class="custom-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2 class="section-title text-center">La nostra storia</h2>
                <p class="section-content text-center">Da oltre un secolo la famiglia Muraca si dedica alla coltivazione degli ulivi e alla produzione di olio extra vergine di oliva. Dalla passione e tenacia, nel rispetto per l’ambiente ed impiegando innovazioni tecnologiche finalizzate al perseguimento di una qualità sempre più alta, nell’anno 2008 nasce la Società Fratelli Muraca con lo scopo di proseguire quanto lasciato in eredità dai propri avi.</p>
                <div class="d-flex justify-content-center">
                    <img src="media/fratelli_muraca_retro1.jpg" alt="La nostra storia" class="img-responsive" style="width: 45%; margin-right: 10px;">
                    <img src="media/fratelli_muraca_retro2.jpg" alt="La nostra storia" class="img-responsive" style="width: 45%; margin-left: 10px;">
                </div>
            </div>
        </div>
    </div>
</section>

<section class="custom-section">
    <div class="container">
        <div class="row mb-4">
            <div class="col-lg-6 order-lg-2 d-flex align-items-center">
                <div>
                    <h2 class="section-title text-center">Estrazione</h2>
                    <p class="section-content">L’estrazione dell’olio ha inizio portando subito le olive al frantoio, dopo la fase della raccolta che avviene nel momento in cui il frutto raggiunge la maturazione ideale, mediante l’utilizzo di mezzi meccanici senza stress per le piante secolari e garantendo l’integrità del frutto, assicurandone così le caratteristiche organolettiche. Nello specifico la molitura che avviene entro poche ore dalla raccolta, viene svolta attraverso impianti tecnologici del tipo a ciclo continuo, rigorosamente a freddo sotto i 25°, al fine di ottenere maggiore qualità.</p>
                </div>
            </div>
            <div class="col-lg-6 order-lg-1">
                <img src="media/olio_pressatura.jpg" alt="pressatura" class="img-fluid rounded mr-lg-4" style="max-width: 100%; height: auto;">
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-lg-6 d-flex align-items-center">
                <div>
                    <h2 class="section-title text-center">Stoccaggio</h2>
                    <p class="section-content text-center">L’olio prodotto viene poi trasferito nei magazzini aziendali, stoccato in appositi contenitori di acciaio inox, in assenza di luce, ossigeno e fonti di calore, al fine di conservarne i composti fenolici e le qualità organolettiche.</p>
                </div>
            </div>
            <div class="col-lg-6">
                <img src="media/camion_muraca.jpg" alt="Stoccaggio" class="img-fluid rounded ml-lg-4" style="max-width: 100%; height: auto;">
            </div>
        </div>
    </div>
</section>

<section class="custom-section">
    <div class="container">
        <h2 class="section-title text-center">Qualità Organolettiche</h2>
        <p class="section-content text-center">L’olio prodotto dalla Carolea è un olio equilibrato, armonico che ben si presta ad esaltare, senza coprirli, tutti i sapori. Inoltre può essere utilizzato nei vari abbinamenti, tanto a crudo che nelle preparazioni, ricordando inoltre che la composizione chimica dell’olio di oliva, grazie al suo alto “punto di fumo“, lo rende particolarmente indicato e sano per friggere.</p>
        <div class="row">
            <div class="col-lg-4">
                <img src="media/olio_insalata.jpg" alt="insalata" class="img-responsive">
            </div>
            <div class="col-lg-4">
                <img src="media/olio_pasta.jpg" alt="pasta" class="img-responsive">
            </div>
            <div class="col-lg-4">
                <img src="media/olio_frittura.png" alt="frittura" class="img-responsive">
            </div>
        </div>
        <p class="section-content text-center ">Molte sono le proprietà riconosciute all’olio extravergine di oliva, le quali attualmente sono in grado di migliorare di molto lo stato di benessere di chi lo assume: (antinfiammatoria, antiallergica, antibatterica, antivirale, favorisce la digestione gastrica perché agisce migliorando le contrazioni della cistifellea e provocando la liberazione degli acidi biliari, attiva nella prevenzione delle malattie degenerative, diabete, colesterolo nel sangue, cancro, malattie cardiovascolari e l’invecchiamento precoce). Per tali motivi è consigliabile assumere quotidianamente circa 20 g di olio d’oliva, in modo tale da sfruttare al meglio i molteplici benefici e salvaguardare le cellule, grazie soprattutto al contenuto di vitamina E.</p>
    </div>
</section>

<section class="custom-section text-center">
    <div class="container">
        <div class="row justify-content-center align-items-center mb-4">
            <div class="col-lg-6">
                <div class="d-flex flex-column justify-content-center align-items-center">
                    <h2 class="section-title">Agricoltura Biologica</h2>
                    <p class="section-content">La Società applicando le linee guida dell’agricoltura biologica, priva dell’utilizzo di prodotti di sintesi, segue tutte le fasi produttive ovvero dalla coltivazione delle olive all’estrazione e confezionamento dell’olio.</p>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="d-flex justify-content-center">
                    <img src="media/marchio_bio_ue.png" alt="marchio_bio_ue.png" class="img-fluid rounded" style="max-width: 50%; height: auto;">
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="parts/footer.jsp" %>
</body>
</html>

