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

<!-- Section 3 -->
<section class="u-clearfix u-container-align-center py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6 d-flex flex-column justify-content-center">
                <h2>Agricoltura Biologica</h2>
                <p>La Società applicando le linee guida dell’agricoltura biologica, priva dell’utilizzo di prodotti di sintesi, segue tutte le fasi produttive ovvero dalla coltivazione delle olive all’estrazione e confezionamento dell’olio.</p>
                <img src="media/marchio_bio_ue.png" alt="Agricoltura Biologica" style="height: 400px; width: 100%; object-fit: cover;">				            
            </div>
        </div>
    </div>
</section>

<!-- Section 4 -->
<section class="u-clearfix custom-color-5 py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 d-flex flex-column justify-content-center">
                <h2 class="text-center">La nostra storia</h2>
                <p class="text-center">Da oltre un secolo la famiglia Muraca si dedica alla coltivazione degli ulivi e alla produzione di olio extra vergine di oliva. Dalla passione e tenacia, nel rispetto per l’ambiente ed impiegando innovazioni tecnologiche finalizzate al perseguimento di una qualità sempre più alta, nell’anno 2008 nasce la Società Fratelli Muraca con lo scopo di proseguire quanto lasciato in eredità dai propri avi.</p>
            </div>
            <div class="col-lg-6">
                <img src="media/fratelli_muraca_retro1.jpg" alt="La nostra storia" style="height: 400px; width: 100%; object-fit: cover;">
                <img src="media/fratelli_muraca_retro2.jpg" alt="La nostra storia" style="height: 400px; width: 100%; object-fit: cover;">
            </div>
        </div>
    </div>
</section>

<!-- Section 5 -->
<section class="u-align-center u-clearfix py-5">
    <div class="container"></div>
</section>

<!-- Section 6 -->
<section class="skrollable u-clearfix u-uploaded-video py-5">
    <div class="u-align-center u-container-style u-group u-white p-5 mt-3">
        <h1>Estrazione</h1>
        <p>L’estrazione dell’olio ha inizio portando subito le olive al frantoio, dopo la fase della raccolta che avviene nel momento in cui il frutto raggiunge la maturazione ideale, mediante l’utilizzo di mezzi meccanici senza stress per le piante secolari e garantendo l’integrità del frutto, assicurandone cosi le caratteristiche organolettiche. Nello specifico la molitura che avviene entro poche ore dalla raccolta, viene svolta attraverso impianti tecnologici del tipo a ciclo continuo, rigorosamente a freddo sotto i 25°, al fine di ottenere maggiore qualità.</p>
		<img src="media/olio_pressatura.jpg" alt="pressatura" style="height: 400px; width: 100%; object-fit: cover;">    
    </div>
</section>

<!-- Section 7 -->
<section class="u-clearfix custom-color-5 py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 d-flex flex-column justify-content-center">
                <h2 class="text-center">Stoccaggio</h2>
                <p class="text-center">L’olio prodotto viene poi trasferito nei magazzini aziendali, stoccato in appositi contenitori di acciaio inox, in assenza di luce, ossigeno e fonti di calore, al fine di conservarne i composti fenolici e le qualità organolettiche.</p>
            </div>
            <div class="col-lg-8">
                <img src="media/camion_muraca.jpg" alt="Stoccaggio" style="height: 400px; width: 100%; object-fit: cover;">
            </div>
        </div>
    </div>
</section>

<!-- Section 8 -->
<section class="u-align-center u-clearfix py-5">
    <div class="container">
        <h2>Qualità Organolettiche</h2>
        <p>L’olio prodotto dalla Carolea è un olio equilibrato, armonico che ben si presta ad esaltare, senza coprirli, tutti i sapori. Inoltre può essere utilizzato nei vari abbinamenti, tanto a crudo che nelle preparazioni, ricordando inoltre che la composizione chimica dell’olio di oliva, grazie al suo alto “punto di fumo“, lo rende particolarmente indicato e sano per friggere.</p>
    	<img src="media/olio_insalata.jpg" alt="insalata" style="height: 400px; width: 100%; object-fit: cover;">    
		<img src="media/olio_pasta.jpg" alt="pasta" style="height: 400px; width: 100%; object-fit: cover;">    
		<img src="media/olio_frittura.png" alt="frittura" style="height: 400px; width: 100%; object-fit: cover;">    
    </div>
</section>

<!-- Section 9 -->
<section class="u-clearfix py-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
            </div>
            <div class="col-lg-6 d-flex flex-column justify-content-center">

            </div>
        </div>
    </div>
</section>

<!-- Section 10 -->
<section class="u-align-center u-clearfix custom-color-2 py-5">
    <div class="container">
        <p class="u-large-text u-text-variant">Molte sono le proprietà riconosciute all’olio extravergine di oliva, le quali attualmente sono in grado di migliorare di molto lo stato di benessere di chi lo assume: (antinfiammatoria, antiallergica, antibatterica, antivirale, favorisce la digestione gastrica perché agisce migliorando le contrazioni della cistifellea e provocando la liberazione degli acidi biliari, attiva nella prevenzione delle malattie degenerative, diabete, colesterolo nel sangue, cancro, malattie cardiovascolari e l’invecchiamento precoce). Per tali motivi è consigliabile assumere quotidianamente circa 20 g di olio d’oliva, in modo tale da sfruttare al meglio i molteplici benefici e salvaguardare le cellule, grazie soprattutto al contenuto di vitamina E.</p>
		<img src="media/benefici_olio.jpg" alt="benefici_olio" style="height: 400px; width: 100%; object-fit: cover;">    
    </div>
</section>

<%@ include file="parts/footer.jsp" %>
</body>
</html>
