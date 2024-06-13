<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>
<%
// inizializzo l'unico prodotto di cui si vogliono vedere le info
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
%>

<!DOCTYPE html>
<html>
<head>
<style>
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
        }
        .star-rating input[type="radio"] {
            display: none;
        }
        .star-rating label {
            color: #ddd;
            font-size: 2em;
            padding: 0.1em;
            cursor: pointer;
            transition: color 0.2s;
        }
        .star-rating input[type="radio"]:checked ~ label {
            color: #f7bf17;
        }
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #f7bf17;
        }
        
        .review-list ul li .left span {
     width: 32px;
     height: 32px;
     display: inline-block;
}
 .review-list ul li .left {
     flex: none;
     max-width: none;
     margin: 0 10px 0 0;
}
 .review-list ul li .left span img {
     border-radius: 50%;
}
 .review-list ul li .right h4 {
     font-size: 16px;
     margin: 0;
     display: flex;
}
 .review-list ul li .right h4 .gig-rating {
     display: flex;
     align-items: center;
     margin-left: 10px;
     color: #ffbf00;
}
 .review-list ul li .right h4 .gig-rating svg {
     margin: 0 4px 0 0px;
}
 .country .country-flag {
     width: 16px;
     height: 16px;
     vertical-align: text-bottom;
     margin: 0 7px 0 0px;
     border: 1px solid #fff;
     border-radius: 50px;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}
 .country .country-name {
     color: #95979d;
     font-size: 13px;
     font-weight: 600;
}
 .review-list ul li {
     border-bottom: 1px solid #dadbdd;
     padding: 0 0 30px;
     margin: 0 0 30px;
}
 .review-list ul li .right {
     flex: auto;
}
 .review-list ul li .review-description {
     margin: 20px 0 0;
}
 .review-list ul li .review-description p {
     font-size: 14px;
     margin: 0;
}
 .review-list ul li .publish {
     font-size: 13px;
     color: #95979d;
}

.review-section h4 {
     font-size: 20px;
     color: #222325;
     font-weight: 700;
}
 .review-section .stars-counters tr .stars-filter.fit-button {
     padding: 6px;
     border: none;
     color: #4a73e8;
     text-align: left;
}
 .review-section .fit-progressbar-bar .fit-progressbar-background {
     position: relative;
     height: 8px;
     background: #efeff0;
     -webkit-box-flex: 1;
     -ms-flex-positive: 1;
     flex-grow: 1;
     box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
     background-color: #ffffff;
    ;
     border-radius: 999px;
}
 .review-section .stars-counters tr .star-progress-bar .progress-fill {
     background-color: #ffb33e;
}
 .review-section .fit-progressbar-bar .progress-fill {
     background: #2cdd9b;
     background-color: rgb(29, 191, 115);
     height: 100%;
     position: absolute;
     left: 0;
     z-index: 1;
     border-radius: 999px;
}
 .review-section .fit-progressbar-bar {
     display: flex;
     align-items: center;
}
 .review-section .stars-counters td {
     white-space: nowrap;
}
 .review-section .stars-counters tr .progress-bar-container {
     width: 100%;
     padding: 0 10px 0 6px;
     margin: auto;
}
 .ranking h6 {
     font-weight: 600;
     padding-bottom: 16px;
}
 .ranking li {
     display: flex;
     justify-content: space-between;
     color: #95979d;
     padding-bottom: 8px;
}
 .review-section .stars-counters td.star-num {
     color: #4a73e8;
}
 .ranking li>span {
     color: #62646a;
     white-space: nowrap;
     margin-left: 12px;
}
 .review-section {
     border-bottom: 1px solid #dadbdd;
     padding-bottom: 24px;
     margin-bottom: 34px;
     padding-top: 64px;
}
 .review-section select, .review-section .select2-container {
     width: 188px !important;
     border-radius: 3px;
}
ul, ul li {
    list-style: none;
    margin: 0px;
}
.helpful-thumbs, .helpful-thumb {
    display: flex;
    align-items: center;
    font-weight: 700;
}
        
    </style></head>
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
    
    
    <div class="container mt-5 mb-4">
    	<div class="card p-3">
        <form>
            <!-- Dropdown per scegliere il prodotto -->
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


<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<%@ include file="parts/footer.jsp" %>
</body>
</html>