<div id="navbar">
  <div class="nav-left">
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  </div>
  <div class="nav-right">
 			   <a href="login">Entra</a>
               <button class="cart-button btn btn-outline-light" type="submit">
                    <i class=" bi-cart-fill me-1"></i>
                    Cart
                     <span class="badge bg-light text-dark"><%= cart.getSize() %></span>
  	</div>
</div>
<script>// When the user scrolls the page, execute myFunction
window.onscroll = function() {myFunction()};

//Get the navbar
var navbar = document.getElementById("navbar");

//Get the offset position of the navbar
var sticky = navbar.offsetTop;

//Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
if (window.pageYOffset >= sticky) {
 navbar.classList.add("sticky")
} else {
 navbar.classList.remove("sticky");
}
}</script>
