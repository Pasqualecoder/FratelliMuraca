<link rel="stylesheet" href="./css/nav-style.css">

<head>
<meta charset="UTF-8">
</head>
<body>
<header>


<ul>
<li><a href="#">Home</a></li>
<li><a href="#">Prodotti</a></li>
<li><a href="#">Chi Siamo</a></li>
<li><a href="#">Contattaci</a></li>
</ul>
<form class="cart">
                <button class="btn btn-outline-light" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-light text-dark"><%= cart.getSize() %></span>
                </button>
       </form>
</header>
<section class="banner"><img src="./media/logo.png"></img></section>
<script type="text/javascript">
window.addEventListener("scroll", function(){
var header = document.querySelector("header");
header.classList.toggle("sticky", window.scrollY > 0);
})
</script>
</body>
</html>





<!--             < -->