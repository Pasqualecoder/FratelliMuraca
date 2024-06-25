<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*,utilities.StringEscapeUtil" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>
<%
// inizializzo l'unico prodotto di cui si vogliono vedere le info
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");

UserBean user = (UserBean)session.getAttribute("user");
Boolean canCommentBool = (Boolean) request.getAttribute("canComment"); // dont use me 
Boolean hasReviewBool = (Boolean) request.getAttribute("hasReview"); // dont use me 
Boolean isFavoriteBool = (Boolean) request.getAttribute("isFavorite");
boolean canComment = (canCommentBool != null) ? canCommentBool.booleanValue() : false; // use me
boolean hasReview = (hasReviewBool != null) ? hasReviewBool.booleanValue() : false;
boolean isFavorite = (isFavoriteBool != null) ? isFavoriteBool.booleanValue() : false;

Integer avg = (Integer) request.getAttribute("avg");

LinkedList<ReviewBean> listaRecensioni = (LinkedList<ReviewBean>) request.getAttribute("listaRecensioni");
if (listaRecensioni == null) listaRecensioni = new LinkedList<ReviewBean>();
%>

<!DOCTYPE html>
<html>
<head>
<title><%= prodotto.getNome() %> - Fratell Muraca</title>
<link rel="stylesheet" href="css/details-style.css">
</head>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%
String opStatus = request.getParameter("status");

// NESSUNA OPERAZIONE EFFETTUATA
if (opStatus == null) {
%>
<%
	}

// OPERAZIONE ANDATA A BUON FINE
else if (opStatus.equals("success")) {
%>
	<div class="p-3 mb-2 bg-success text-white">Commento inserito correttamente</div>
<%
	}

else if (opStatus.equals("failure")) {
%>
	<div class="p-3 mb-2 bg-danger text-white">Errore durante l'inserimento del commento</div>
<%
	}
%>



<!-- layout orizzontale -->
<div class="container mt-5">
  <div class="row">
    <div class="col-md-6">
    
      <!-- CAROSELLO CON CONTROLLI -->
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <%
          boolean primoAttivo = true;
          if (prodotto.getImmagini().size() > 0) {
        	  for (int keyImg : prodotto.getImmagini()) {%>
		          <div class="carousel-item <%= primoAttivo ? "active" : "" %>"> <% primoAttivo = false; /*solamente il primo elemento deve essere della classe css "active", per questo motivo utilizzo il booleano*/%>
		            <img src="imageServlet?img=<%= keyImg %>" class="d-block w-100" alt="<%= prodotto.getNome() + "#" + keyImg %>">
		          </div>	        	  
	          <%} // endfor%>
        </div>
        
        <!-- pulsanti funzione del carosello -->
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      
      
      <ol class="carousel-indicators mt-2">
      	
        <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
        <% for (int i = 1; i < prodotto.getImmagini().size(); i++) {%>
        	<li data-target="#carouselExampleControls" data-slide-to="<%= i %>"></li>
      	<% } %>
      </ol>
         <%} // endif (prodotto.getImmagini().size() > 0)%>
         
         
    </div>
    <div class="col-md-6">
      <h2><%= prodotto.getNome() %></h2>
      <h3 class="text-muted font-italic"><%= prodotto.getCategoria() %></h3>
      <h3 class="text-uppercase font-italic"><%= prodotto.getDimensione() %></h3>
      <% 
      for (int i = 1; i <= 5; i++) { %>
      <span class="gig-rating text-body-2" style="color: <%= (avg > 0) ? "#ffbf00" : "grey" %>;">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
              <path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
          </svg>
      </span>
      <%
      	avg--;
      }
      %>
      
      <!-- Product price-->
	  <% if (prodotto.isOnSale()) { // controllo se ha un prezzo scontato per far vedere la percentuale e il vecchio prezzo %>
	  <h6 class="text-danger text-uppercase font-weight-bold font-italic"><%= prodotto.getSalePerc() %>% off</h6>
	  <span class="text-muted text-decoration-line-through" style="display: inline;">&euro;<%= prodotto.getPrezzoIva() %></span>
	  <%} //endif (prodotto.isOnSale()) %>
	  <br>
	  <h5 class="text-uppercase font-weight-bold" style="display: inline;">&euro;<%= prodotto.getPrezzoScontato() %> <%/* qui faccio vedere in ogni caso il prezzo scontato perché anche se non c'è sconto questa varibile è piena*/ %></h5>

	  <p class="text-muted">Disponibili in magazzino: <%= prodotto.getQuantita() %></p>

      <p><%= StringEscapeUtil.newLineToBr(prodotto.getDescrizione()) %></p>
      
<form method="POST" id="favoriteForm">
    <input type="hidden" id="id" name="id_prodotto" value="<%= prodotto.getId() %>">
    <button id="heartButton" type="submit" class="btn btn-outline-danger">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16" id="heartIcon">
            <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"></path>
        </svg>
        <span id="buttonText">Aggiungi Ai Preferiti</span>
    </button>
    <input type="hidden" id="isFavorite" value="<%= isFavorite %>">
</form>

<br>
	
      <form method="get" action="cart">
      	<input type="hidden" id="action" name="action" value="addC">
      	<input type="hidden" id="id" name="id" value="<%= prodotto.getId() %>">
      	
        <div class="form-group">
          <label for="quantity">Quantità</label>
          <input type="number" id="quantity" name="quantity" class="form-control" value="1" min="1" max="<%= prodotto.getQuantita() %>">
        </div>
        <button type="submit" class="btn btn-success">Add to Cart</button>
      </form>
    </div>
    
    <!-- Riquadro per ulteriori informazioni -->
    <div class="col-md-12 mt-5">
      <div class="card">
        <div class="card-body">
          <h4 class="text-muted">Ulteriori Informazioni</h4>
          <!-- Qui inserisci ulteriori informazioni sul prodotto -->
          <p>Anno di produzione: <%= prodotto.getAnno() %></p>
          <% if (prodotto.getIngredienti() != null) {%>
          	<p>Ingredienti: <%= prodotto.getIngredienti() %></p>
          <%} %>
        </div>
      </div>
    </div>
    
    <% if (!hasReview) { %> <!-- Aggiungi questa riga -->
    <div class="container mt-5 mb-4" id="review-panel">
    	<div class="card p-3">
    	<% 
           	if (canComment) {
		    %>
			    <h4 class="font-weight-light font-italic text-success">Scrivi la tua recensione a <%= prodotto.getNome() %></h4>
           	<%} else {%>
           		<h4 class="font-weight-light font-italic text-danger">
           		<% if (user == null) {%>
    
          			Devi effettuare il login per commentare <a class="font-italic" style="text-decoration: underline;" href="login">Entra Subito!</a>           	
    	
           		<% } else {%>
           		   <% if (hasReview) { %>
           				Hai già recensito questo prodotto!
           			<% } else {%>
           			
        			Devi aver acquistato il prodotto per commentare
           			<% } %>
           		</h4>
           		<% } %>
           	<% }
           %>
        <form id="review-panel" class="<%= canComment ? "" : "blur-effect" %>" action="<%= canComment ? "addReview" : "" %>" method="POST" onsubmit="return validateForm()">
    <input type="hidden" name="idProdotto" value="<%= prodotto.getId() %>">

    <br>
    <!-- Star Rating -->
    <div class="mb-3">
        <label class="form-label" style="margin: 0px">Valutazione</label>
        <div class="star-rating">
            <input id="star5" name="rating" type="radio" value="5">
            <label for="star5" title="5 stelle">&#9733;</label>
            <input id="star4" name="rating" type="radio" value="4">
            <label for="star4" title="4 stelle">&#9733;</label>
            <input id="star3" name="rating" type="radio" value="3">
            <label for="star3" title="3 stelle">&#9733;</label>
            <input id="star2" name="rating" type="radio" value="2">
            <label for="star2" title="2 stelle">&#9733;</label>
            <input id="star1" name="rating" type="radio" value="1">
            <label for="star1" title="1 stella">&#9733;</label>
        </div>
        <div id="ratingError" class="text-danger" style="display: none;"></div>
    </div>

    <!-- Textbox per il titolo della recensione -->
    <div class="mb-3">
        <label for="reviewTitle" class="form-label">Titolo</label>
        <input name="title" type="text" class="form-control" id="reviewTitle" maxlength="100" placeholder="Scrivi il titolo..." <%= canComment ? "" : "disabled" %>>
        <small id="charCountTitle" class="form-text text-muted">Max 100 caratteri.</small>
        <div id="titleError" class="text-danger" style="display: none;"></div>
    </div>

    <!-- Textbox per il contenuto della recensione -->
    <div class="mb-3">
        <label for="reviewContent" class="form-label">Recensione</label>
        <textarea name="content" class="form-control" id="reviewContent" maxlength="800" rows="3" placeholder="Scrivi la tua recensione qui..." <%= canComment ? "" : "disabled" %>></textarea>
        <small id="charCountContent" class="form-text text-muted">Max 800 caratteri.</small>
        <div id="contentError" class="text-danger" style="display: none;"></div>
    </div>

    <% if (canComment) { %>
        <!-- Pulsante di invio -->
        <button type="submit" class="btn btn-success">Invia Recensione</button>
    <% } %>
</form>
        </div>
    </div>
<% } %>
  </div>
  
  
  <div class="container">
    <div id="reviews" class="review-section">
	<% if (listaRecensioni.size() > 0) {%>
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h4 class="m-0 font-italic"><%= listaRecensioni.size() %> Recensioni</h4>
        </div>
		
        <div class="review-list">
            <ul>
		<% for (ReviewBean recensione : listaRecensioni) {%>
			<li>
                    <div class="d-flex">
                        <div class="left">
                            <span>
                                <img src="https://bootdey.com/img/Content/avatar/avatar<%= (recensione.getUser().getId() % 9) + 1 %>.png" class="profile-pict-img img-fluid" alt="imgUser" />
                            </span>
                        </div>
                        <div class="right">
                            <h4><%= recensione.getTitolo() %>
                                <span class="gig-rating text-body-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                        <path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                    </svg> <%= recensione.getRating() %>
                                </span>
                            </h4>
                            <div class="review-description">
                                <p>
                                    <%= recensione.getContent() %>
                                </p>
                            </div>
                            <span class="publish py-3 d-inline-block w-100"><%= recensione.getUser().getNome() %> <%= recensione.getDate() %></span>
                        </div>
                    </div>
                </li>
                <hr>
		<%}%>
            </ul>
        </div>
	<%}
	else {%>
		<h1 class="font-italic font-weight-light">non sono presenti recensioni per questo prodotto</h1>
	<%}%>
            
    </div>
</div>
</div>

<script>
        // Funzione per aggiornare il contatore di caratteri
        function updateCharCount(element, countElement, maxLength) {
            const currentLength = element.value.length;
            countElement.textContent = "Caratteri usati: " + currentLength + " su " + maxLength + " (Max: " + maxLength + ")";
        }

        // Aggiungi eventi di input per aggiornare i contatori in tempo reale
        document.addEventListener('DOMContentLoaded', (event) => {
            const titleInput = document.getElementById('reviewTitle');
            const contentTextarea = document.getElementById('reviewContent');
            const titleCount = document.getElementById('charCountTitle');
            const contentCount = document.getElementById('charCountContent');

            // Aggiorna i contatori all'avvio
            updateCharCount(titleInput, titleCount, 100);
            updateCharCount(contentTextarea, contentCount, 800);

            // Aggiungi eventi di input per aggiornare i contatori in tempo reale
            titleInput.addEventListener('input', () => {
                updateCharCount(titleInput, titleCount, 100);
            });

            contentTextarea.addEventListener('input', () => {
                updateCharCount(contentTextarea, contentCount, 800);
            });
        });
        
        function validateForm() {
            let isValid = true;

            // Pulizia dei messaggi di errore precedenti
            document.getElementById("ratingError").style.display = "none";
            document.getElementById("titleError").style.display = "none";
            document.getElementById("contentError").style.display = "none";

            // Validazione del rating
            let rating = document.querySelector('input[name="rating"]:checked');
            if (!rating) {
                document.getElementById("ratingError").textContent = "Per favore, scegli una valutazione.";
                document.getElementById("ratingError").style.display = "block";
                isValid = false;
            }

            // Validazione del titolo
            let title = document.getElementById("reviewTitle").value;
            if (!title) {
                document.getElementById("titleError").textContent = "Per favore, inserisci un titolo.";
                document.getElementById("titleError").style.display = "block";
                isValid = false;
            } else if (title.length > 100) {
                document.getElementById("titleError").textContent = "Il titolo non può superare i 100 caratteri.";
                document.getElementById("titleError").style.display = "block";
                isValid = false;
            }

            // Validazione del contenuto
            let content = document.getElementById("reviewContent").value;
            if (!content) {
                document.getElementById("contentError").textContent = "Per favore, inserisci una recensione.";
                document.getElementById("contentError").style.display = "block";
                isValid = false;
            } else if (content.length > 800) {
                document.getElementById("contentError").textContent = "La recensione non può superare i 800 caratteri.";
                document.getElementById("contentError").style.display = "block";
                isValid = false;
            }

            return isValid;
        }
</script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var isFavorite = document.getElementById("isFavorite").value === "true";
        var form = document.getElementById("favoriteForm");
        var button = document.getElementById("heartButton");
        var buttonText = document.getElementById("buttonText");

        if (isFavorite) {
            form.action = "favorites?action=removeFavorite&id=<%= prodotto.getId() %>";
            button.classList.remove("btn-outline-danger");
            button.classList.add("btn-danger");
            buttonText.textContent = "Rimuovi Dai Preferiti";
        } else {
            form.action = "favorites";
        }
    });
</script>
<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha384-ZvpUoO/+PpLXR1lu4jmpXWu80pZlYUAfxl5NsBMWOEPSjUn/6Z/hRTt8+pR6L4N2" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<%@ include file="parts/footer.jsp" %>
</body>
</html>