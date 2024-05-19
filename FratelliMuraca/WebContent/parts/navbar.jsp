<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Responsive Navbar</title>
  <link rel="stylesheet" href="nav-style.css">
</head>
<body>

<nav id="navbar">
  <ul class="sidebar">
    <div class="main-content">
      <li onclick="hideSidebar()"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="26" viewBox="0 96 960 960" width="26"><path d="m249 849-42-42 231-231-231-231 42-42 231 231 231-231 42 42-231 231 231 231-42 42-231-231-231 231Z"/></svg></a></li>
      <li><a href="#">Blog</a></li>
      <li><a href="#">Products</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Forum</a></li>
    </div>
    <div class="bottom-content">
      <li class="cart"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="26" viewBox="0 0 24 24" width="26"><path d="M7 4h-2l-3 9v2h3v8h2v-8h8v8h2v-8h3v-2l-3-9h-2zm5 10h-8.973l2.896-7h6.142l2.896 7z"/></svg></a></li>
      <li><a class="login" href="#">Login</a></li>
    </div>
  </ul>
  <ul class="desktop-nav">
    <li class="hideOnMobile"><a href="#">Home</a></li>
    <li class="hideOnMobile"><a href="#">Prodotti</a></li>
    <li class="hideOnMobile"><a href="#">Chi Siamo</a></li>
    </ul>
    <ul>  
    <li class="hideOnMobile align-right"><button class="btn btn-light">Log In</button></li>
    <li class="align-right"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="26" viewBox="0 0 24 24" width="26"><path d="M7 4h-2l-3 9v2h3v8h2v-8h8v8h2v-8h3v-2l-3-9h-2zm5 10h-8.973l2.896-7h6.142l2.896 7z"/></svg></a></li>
    <li class="menu-button" onclick="showSidebar()"><a href="#"><svg xmlns="http://www.w3.org/2000/svg" height="26" viewBox="0 96 960 960" width="26"><path d="M120 816v-60h720v60H120Zm0-210v-60h720v60H120Zm0-210v-60h720v60H120Z"/></svg></a></li>
  	</ul>
</nav>

<script>
  function showSidebar(){
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display = 'flex'
  }
  function hideSidebar(){
    const sidebar = document.querySelector('.sidebar')
    sidebar.style.display = 'none'
  }

  window.onscroll = function() {stickyNavbar()};

  var navbar = document.getElementById("navbar");
  var sticky = navbar.offsetTop;

  function stickyNavbar() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }
</script>
</body>
</html>

