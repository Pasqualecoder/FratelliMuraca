<header>
<ul>
<li><a href="product">Home</a></li>
<li><a href="product">Prodotti</a></li>
<li><a href="#">Chi Siamo</a></li>
<li><a href="#">Contattaci</a></li>
</ul>

<a class="btn btn-outline-light" href="cart">
    <i class="bi-cart-fill me-1"></i>
    Cart
    <span class="badge bg-light text-dark"><%= cart.getSize() %></span>
</a>

</header>
<section class="banner"><img src="./media/logo.png"></img></section>
<script type="text/javascript">
window.addEventListener("scroll", function(){
var header = document.querySelector("header");
header.classList.toggle("sticky", window.scrollY > 0);
})
</script>