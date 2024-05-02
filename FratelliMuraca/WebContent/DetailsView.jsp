<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>


<%@ include file="init/cartinit.jsp" %>
<%
// inizializzo l'unico prodotto di cui si vogliono vedere le info
ProductBean prodotto = (ProductBean) request.getAttribute("prodotto");
%>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%@ include file="parts/header.jsp" %>

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
      <h3 class="text-uppercase font-italic"><%= prodotto.getDimensione() %></h3>
      
      <!-- Product price-->
	  <% if (prodotto.isOnSale()) { // controllo se ha un prezzo scontato per far vedere la percentuale e il vecchio prezzo %>
	  <h6 class="text-danger text-uppercase font-weight-bold font-italic"><%= prodotto.getSalePerc() %>% off</h6>
	  <span class="text-muted text-decoration-line-through" style="display: inline;">&euro;<%= prodotto.getPrezzoIva() %></span>
	  <%} //endif (prodotto.isOnSale()) %>
	  <h5 class="text-uppercase font-weight-bold" style="display: inline;">&euro;<%= prodotto.getPrezzoScontato() %> <%/* qui faccio vedere in ogni caso il prezzo scontato perché anche se non c'è sconto questa varibile è piena*/ %></h5>

	  <p class="text-muted">Disponibili in magazzino: <%= prodotto.getQuantita() %></p>

      <p><%= prodotto.getDescrizione() %></p>
      
      
      <form method="get" action="details">
      	<input type="hidden" id="action" name="action" value="addC">
      	<input type="hidden" id="id" name="id" value="<%= prodotto.getId() %>">
      	
        <div class="form-group">
          <label for="quantity">Quantità</label>
          <input type="number" id="quantity" name="quantity" class="form-control" value="1" min="1">
        </div>
        <button type="submit" class="btn btn-success">Add to Cart</button>
      </form>
    </div>
  </div>
</div>

<%= prodotto %>

<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<%@ include file="parts/footer.jsp" %>
</body>
</html>