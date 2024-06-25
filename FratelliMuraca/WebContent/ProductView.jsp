<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<%@ include file="init/productsinit.jsp" %>

<!DOCTYPE html>
<html>
<%@ include file="parts/head.jsp" %>

<body>
<%@ include file="parts/navbar.jsp" %>
<%= "ProductView.jsp row13 " + session.getAttribute("user") %>

<%
if (products == null || products.size() == 0) {%> 
    <h1>Store attualmente non disponibile! Torna più tardi</h1>    
<%return;
}%>

<div class="container px-4 px-lg-5 mt-5">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-lg-3">
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
        <!-- End Sidebar -->

        <!-- SEZIONE PRODOTTI -->
        <div class="col-lg-9">
            <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="productContainer">
                        <%
                        for (ProductBean prodotto : products) { %>
                            <!-- CARD -->            
                            <div class="col mb-5">
                                <a href="details?id=<%=prodotto.getId()%>">
                                <div class="card h-100">
                                
                            <%
                            if (prodotto.isOnSale()) {%> 
                                <!-- Sale badge-->
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>                                        
                            <%
                            } %>
                            
                            <!-- Product image-->
                            <img src="imageServlet?img=<%= prodotto.getImmagini().getFirst() %>" alt="<%= prodotto.getNome() %>" width="100%">
                            
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%= prodotto.getNome() %></h5>
                                    
                                    <!-- Product price-->
                                    <%
                                    if (prodotto.isOnSale()) { %>
                                    <h6 class="text-danger text-uppercase font-weight-bold font-italic"><%= prodotto.getSalePerc() %>% off</h6>
                                    <span class="text-muted text-decoration-line-through" style="display: inline;">&euro;<%= prodotto.getPrezzoIva() %></span>
                                    <%
                                    } %>
                                    <h6 class="text-uppercase font-weight-bold" style="display: inline;">&euro;<%= prodotto.getPrezzoScontato() %></h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-success mt-auto" href="cart?action=addC&id=<%=prodotto.getId()%>">Add to cart</a></div> <br>
                            </div>
                                </div>
                                </a>
                            </div>
                        <%
                        } %>
                    </div>
                </div>
            </section> 
        </div>
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