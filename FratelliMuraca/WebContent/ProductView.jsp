<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<%@ include file="init/productsinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>


<%
if (products == null || products.size() == 0) {%> 
    <h1>Store attualmente non disponibile! Torna più tardi</h1>    
<%return;
}%>
<div class="container-fluid px-0">
    <div class="row">
        <!-- Sidebar with filter form -->
        <div class="col-lg-3 bg-light">
            <div class="p-4">
                <h3>Filtri</h3>
                <form id="filterForm">
                    <div class="mb-3">
                        <label for="productType" class="form-label">Ordina Per</label>
                        <select class="form-select" id="productType" name="sort">
                            <option value="">Rilevanza</option>
                            <option value="prezzo DESC">Prezzo Decrescente</option>
                            <option value="prezzo ASC">Prezzo Crescente</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="priceMin" class="form-label">Prezzo Min</label>
                        <input type="number" class="form-control" id="priceMin" name="priceMin" min="0" step="0.01">
                    </div>
                    <div class="mb-3">
                        <label for="priceMax" class="form-label">Prezzo Max</label>
                        <input type="number" class="form-control" id="priceMax" name="priceMax" min="0" step="0.01">
                    </div>
                    <div class="mb-3">
                        <label for="productType" class="form-label">Tipologia</label>
                        <select class="form-select" id="productType" name="productType">
                            <option value="">Tutte</option>
                            <option value="cosmetici">Cosmetici</option>
                            <option value="classici">Classici</option>
                            <option value="aromatizzati">Aromatizzati</option>
                        </select>
                    </div>
                </form>
            </div>
        </div>
        <!-- End Sidebar with filter form -->

        <!-- Main Content Section -->
       <div class="col-lg-9">
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4 justify-content-start" id="productContainer">
                <% for (ProductBean prodotto : products) { %>
                    <!-- CARD -->
                    <div class="col mb-3">
    <a href="details?id=<%=prodotto.getId()%>" class="text-decoration-none text-dark">
        <div class="card h-100">
            <% if (prodotto.isOnSale()) { %>
                <!-- Sale badge-->
                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
            <% } %>
            <!-- Product image-->
            <img src="imageServlet?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" class="card-img-top">
            <!-- Product details-->
            <div class="card-body p-3"> <!-- Adjusted padding -->
                <!-- Product name-->
                <h5 class="card-title fw-bolder text-center"><%= prodotto.getNome() %></h5>
                <!-- Product price-->
                <div class="text-center">
                    <% if (prodotto.isOnSale()) { %>
                        <h6 class="card-subtitle mb-2 text-danger font-weight-bold"><%= prodotto.getSalePerc() %>% off</h6>
                        <p class="card-text"><span class="text-muted text-decoration-line-through">&euro;<%= prodotto.getPrezzoIva() %></span></p>
                    <% } %>
                    <p class="card-text">&euro;<%= prodotto.getPrezzoScontato() %></p>
                </div>
            </div>
            <!-- Product actions-->
            <div class="card-footer p-3 border-top-0 bg-transparent"> <!-- Adjusted padding and removed mt-auto -->
                <div class="text-center">
                    <a class="btn btn-success" href="cart?action=addC&id=<%=prodotto.getId()%>">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"></path>
                        </svg>
                        Add to Cart
                    </a>
                </div>
            </div>
            
        </div>
    </a>
</div>
                <% } %>
            </div>
        </div>
    </section>
</div>
        <!-- End Main Content Section -->
    </div>
</div>

<%@ include file="parts/footer.jsp" %>

<script>
function clearProducts() {
    var productContainer = document.getElementById("productContainer");
    while (productContainer.firstChild) {
        productContainer.removeChild(productContainer.firstChild);
    }
}

var xhr = new XMLHttpRequest();
var productsJSON;

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('filterForm').addEventListener('change', function() {
        var formData = new FormData(this);
        var params = new URLSearchParams(formData).toString();

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                productsJSON = xhr.responseText;
                clearProducts(); // Pulisce i prodotti attualmente visualizzati
                
                var productContainer = document.getElementById("productContainer");
                var products = JSON.parse(productsJSON);
                
                products.forEach(function(prodotto) {
                    var card = document.createElement("div");
                    card.className = "col mb-5";
                    
                    var cardContent = '<a href="details?id=' + prodotto.id + '">' +
                                          '<div class="card h-100">';
                    
                    if (prodotto.isOnSale) {
                        cardContent += '<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>';
                    }
                    
                    cardContent += '<img src="imageServlet?img=' + encodeURIComponent(prodotto.immagini[0]) + '" alt="' + prodotto.nome + '" width="100%">' +
                                   '<div class="card-body p-4">' +
                                       '<div class="text-center">' +
                                           '<h5 class="fw-bolder">' + prodotto.nome + '</h5>';
                    
                    if (prodotto.isOnSale) {
                        cardContent += '<h6 class="text-danger text-uppercase font-weight-bold font-italic">' + prodotto.salePerc + '% off</h6>' +
                                       '<span class="text-muted text-decoration-line-through">&euro;' + prodotto.prezzoIva + '</span>';
                    }
                    
                    cardContent += '<h6 class="text-uppercase font-weight-bold">&euro;' + prodotto.prezzoScontato + '</h6>' +
                                   '</div>' +
                                   '</div>' +
                                   '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">' +
                                       '<div class="text-center"><a class="btn btn-success mt-auto" href="cart?action=addC&id=' + prodotto.id + '">Add to cart</a></div>' +
                                   '</div>' +
                                   '</div>' +
                                   '</a>';
                    
                    card.innerHTML = cardContent;
                    productContainer.appendChild(card);
                });
            }
        };
        
        xhr.open('GET', 'productFilter?' + params, true);
        xhr.send();
    });
});


</script>

</body>
</html>