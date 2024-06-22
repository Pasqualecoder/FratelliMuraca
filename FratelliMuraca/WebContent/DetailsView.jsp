<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>
<%
// inizializzo l'unico prodotto di cui si vogliono vedere le info
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/details-style.css">
 </head>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>

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
      
      <!-- Product price-->
	  <% if (prodotto.isOnSale()) { // controllo se ha un prezzo scontato per far vedere la percentuale e il vecchio prezzo %>
	  <h6 class="text-danger text-uppercase font-weight-bold font-italic"><%= prodotto.getSalePerc() %>% off</h6>
	  <span class="text-muted text-decoration-line-through" style="display: inline;">&euro;<%= prodotto.getPrezzoIva() %></span>
	  <%} //endif (prodotto.isOnSale()) %>
	  <h5 class="text-uppercase font-weight-bold" style="display: inline;">&euro;<%= prodotto.getPrezzoScontato() %> <%/* qui faccio vedere in ogni caso il prezzo scontato perché anche se non c'è sconto questa varibile è piena*/ %></h5>

	  <p class="text-muted">Disponibili in magazzino: <%= prodotto.getQuantita() %></p>

      <p><%= prodotto.getDescrizione() %></p>
      
       <form method="POST" action="favorites">
    <input type="hidden" id="id" name="id_prodotto" value="<%= prodotto.getId() %>">
    <button id="heartButton" type="submit" class="btn btn-outline-danger">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16" id="heartIcon">
            <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"></path>
        </svg>
        Aggiungi Ai Preferiti
    </button>
</form>
	
      <form method="get" action="cart">
      	<input type="hidden" id="action" name="action" value="addC">
      	<input type="hidden" id="id" name="id" value="<%= prodotto.getId() %>">
      	
        <div class="form-group">
          <label for="quantity">Quantità</label>
          <input type="number" id="quantity" name="quantity" class="form-control" value="1" min="1">
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
    
    <% 
    UserBean user = (UserBean)session.getAttribute("user");
    if (user != null) { %>
    <div class="container mt-5 mb-4" id="review-panel">
    	<div class="card p-3">
        <form id="review-panel">
            <% 
            	Boolean canCommentBool = (Boolean) request.getAttribute("canComment"); // dont use me 
            	boolean canComment = (canCommentBool != null) ? canCommentBool.booleanValue() : false; // use me
            	if (canComment) {%>
            		<h1 class="text-success">SEI AUTORIZZATO A COMMENTARE</h1>
            		<p>metti qui tutto il codice per commentare con il form e la roba</p>
            	<%}
            	else {%>
            		<h1 class="text-danger">rip non puoi commentare :-(</h1>
            		<p>fai che non si riesca a scrivere nell'input box (è sempre necessario fare il controllo backend 
            		se l'utente puo effettivamente scrivere il commento perché il frontend può essere manomesso facilmente)</p>
            	<%}
            %>
			<%= prodotto.getNome() %>
			<br>
            <!-- Star Rating -->
            <div class="mb-3">
                <label class="form-label">Valutazione</label>
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
                
            </div>
            

            <!-- Textbox per il contenuto della recensione -->
            <div class="mb-3">
                <label for="reviewContent" class="form-label">Recensione</label>
                <textarea class="form-control" id="reviewContent" rows="3" placeholder="Scrivi la tua recensione qui..."></textarea>
            </div>

            <!-- Pulsante di invio -->
            <button type="submit" class="btn btn-primary" style="background-color: #5f720f;">Invia Recensione</button>
        </form>
        </div>
    </div>
	<% } %>
    
  </div>
  
  
  <div class="container">
    <div id="reviews" class="review-section">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h4 class="m-0">4 Reviews</h4>
        </div>

        <div class="review-list">
            <ul>
                <!-- Review 1 -->
                <li>
                    <div class="d-flex">
                        <div class="left">
                            <span>
                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="profile-pict-img img-fluid" alt="" />
                            </span>
                        </div>
                        <div class="right">
                            <h4>Askbootstrap
                                <span class="gig-rating text-body-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                        <path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                    </svg> 5.0
                                </span>
                            </h4>
                            <div class="review-description">
                                <p>
                                    The process was smooth, after providing the required info, Pragyesh sent me an outstanding packet of wireframes. Thank you a lot!
                                </p>
                            </div>
                            <span class="publish py-3 d-inline-block w-100">Published 4 weeks ago</span>
                        </div>
                    </div>
                </li>
                <hr>

                <!-- Review 2 -->
                <li>
                    <div class="d-flex">
                        <div class="left">
                            <span>
                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="profile-pict-img img-fluid" alt="" />
                            </span>
                        </div>
                        <div class="right">
                            <h4>Jane Doe
                                <span class="gig-rating text-body-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                        <path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                    </svg> 4.0
                                </span>
                            </h4>
                            <div class="review-description">
                                <p>
                                    I received quick and efficient service. The quality was good but could use some improvements. Overall, a positive experience.
                                </p>
                            </div>
                            <span class="publish py-3 d-inline-block w-100">Published 2 weeks ago</span>
                        </div>
                    </div>
                </li>
                <hr>

                <!-- Review 3 -->
                <li>
                    <div class="d-flex">
                        <div class="left">
                            <span>
                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="profile-pict-img img-fluid" alt="" />
                            </span>
                        </div>
                        <div class="right">
                            <h4>John Smith
                                <span class="gig-rating text-body-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                        <path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                    </svg> 3.0
                                </span>
                            </h4>
                            <div class="review-description">
                                <p>
                                    The service was average. It took longer than expected to get the final product, and there were some issues with the initial design.
                                </p>
                            </div>
                            <span class="publish py-3 d-inline-block w-100">Published 1 week ago</span>
                        </div>
                    </div>
                </li>
                <hr>

                <!-- Additional Review -->
                <li>
                    <div class="d-flex">
                        <div class="left">
                            <span>
                                <img src="https://bootdey.com/img/Content/avatar/avatar4.png" class="profile-pict-img img-fluid" alt="" />
                            </span>
                        </div>
                        <div class="right">
                            <h4>Mary Johnson
                                <span class="gig-rating text-body-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1792 1792" width="15" height="15">
                                        <path fill="currentColor" d="M1728 647q0 22-26 48l-363 354 86 500q1 7 1 20 0 21-10.5 35.5t-30.5 14.5q-19 0-40-12l-449-236-449 236q-22 12-40 12-21 0-31.5-14.5t-10.5-35.5q0-6 2-20l86-500-364-354q-25-27-25-48 0-37 56-46l502-73 225-455q19-41 49-41t49 41l225 455 502 73q56 9 56 46z"></path>
                                    </svg> 4.5
                                </span>
                            </h4>
                            <div class="review-description">
                                <p>
                                    Excellent service overall. The communication was clear, and the final product exceeded my expectations. Highly recommended!
                                </p>
                            </div>
                            <span class="publish py-3 d-inline-block w-100">Published 3 days ago</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

</div>

<script>
$("#myForm :input").prop('readonly', true);



</script>
<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="parts/footer.jsp" %>
</body>
</html>