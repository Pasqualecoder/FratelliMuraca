<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<head>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/56e0e93fe4.js" crossorigin="anonymous"></script>
  <style>
  	.navbar-nav .nav-link .fa-user fa-home {
  	font-size: 1.5rem; /* Increase size */
  	color: white; /* Color of the icon */
	}
  	body {
  		padding-top: 56px; /* Adjust this value based on the height of your navbar */
	}
    .navbar {
      background-color: #607244; /* Green background */
    }
      color: white !important; /* White text for links */
    }
    .navbar-brand:hover, .nav-link:hover {
      color:  !important; /* Lighter green on hover */
    }
    .navbar-brand {
    padding: 8px; /* Adjust the padding to reduce space around the icons */
    margin-right: 10px; /* Optional: Adjust margin if needed */
	}

	.navbar-brand.position-relative {
	    padding-right: 0; /* Remove padding on the right for position-relative elements */
	}
	
	.nav-link.ml-auto {
	    margin-left: 5px; /* Adjust margin to separate user icon from search bar */
	}

    /* Side panel styles */
    .sidepanel {
      text-align: right;
      height: 100%; /* Full-height */
      width: 0; /* Initial width 0 */
      position: fixed; /* Fixed side panel */
      z-index: 30000; /* Stay on top */
      top: 0;
      right: 0;
      background-color: #607244; /* Green background */
      overflow-x: hidden; /* Disable horizontal scroll */
      transition: 0.5s; /* Smooth transition */
      padding-top: 60px; /* Place content below the navbar */
    }
    .sidepanel a {
      padding: 8px 8px 8px 32px;
      text-decoration: none;
      font-size: 25px;
      color: white;
      display: block;
      transition: 0.3s;
    }
    .sidepanel a:hover {
      color: #8eb027;
      background-color: white;
    }
    .sidepanel .closebtn {
      position: absolute;
      top: 0;
      right: 25px;
      font-size: 36px;
    }
    .sidepanel .form-control {
      width: 80%; /* Control width */
      margin: 10px 20px;
    }
    .sidepanel .btn {
      margin: 10px 20px;
    }
    
    

    /* Badge styles */
    .badge {
      position: absolute;
      top: -5px;
      right: -10px;
      color: white;
    }
    
    .nav-link {
    	color: white; 
    	text-decoration: none; 
    }
    
     .nav-link:hover {
    	color: 	#8eb027; 
    	text-decoration: none; 
    }
    
    .nav-item {
   	  
      position: relative;
      padding: 0 10px !important;
    }
    
    .nav-item::before {
      content: '';
      position: absolute;
      width: 100%;
      height: 0.5px;
      border-radius: 0px;
      background-color: white;
      bottom: 0;
      left: 0;
      transform-origin: right;
      transform: scaleX(0);
      transition: transform .3s ease-in-out;
    }
    
    .nav-item:hover::before {
      transform-origin: left;
      transform: scaleX(1);
    }
    
	.search-results {
	    background-color: white;
	    border: 1px solid #ccc;
	    padding: 20px;
	    border-radius: 4px;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    overflow-y: auto;
	    display: none;
	    position: absolute;
	    top: 50px;
	    z-index: 1;
	    transition: max-height 0.3s ease-in-out;
	    width: 400px;
	   
	}

	

	.search-result:hover {
	    background-color: #f0f0f0; /* Cambia il colore di sfondo al passaggio del mouse */
	}


	.search-result:last-child {
	    border-bottom: none;
	}
	
	.search-result:hover {
	    background-color: #f0f0f0;
	}
	
	.product-image {
	    width: 80px; /* Larghezza desiderata per l'immagine */
	    height: auto;
	    border-radius: 4px;
	    margin-right: 10px;
	    
	}
	
	.product-name {
	    font-weight: bold;
	    color: #333;
	    text-decoration: none;
	    margin-bottom: 5px; /* Spazio inferiore tra nome del prodotto e prezzo */
	}
	
	.product-price {
	    color: #666;
	    font-size: 14px;
	    margin: 0;
	}


/* Mostra il div quando ci sono risultati di ricerca */
	.search-results.active {
	    display: block;
	}
	
	.user-dropdown {
    display: none;
    position: absolute;
    background-color: #fff;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    top: 50px;
    
}

@media screen and (max-width: 1000px) {
    .user-dropdown {
        left: 265px; /* Adjust for smaller screens */
    }
}




	.user-dropdown a {
	    color: #000;
	    padding: 12px 16px;
	    text-decoration: none;
	    display: block;
	}
	
	.user-dropdown a:hover {
	    background-color: #f1f1f1;
	}
	
	
	#searchResults {
	    position: absolute;
	    top: 100%; /* Position below the search input */
	    z-index: 1000; /* Ensure results are on top of other elements */
	}
	
	/* Search bar styles from CodePen */
	.search {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  height: 40px;
	  width: 200px;
	  background: white;
	  border-radius: 50px;
	  padding: 10px;
	  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	  position: relative;
	}
	
	.search input {
	  border: none;
	  outline: none;
	  background: none;
	  font-size: 16px;
	  color: #333;
	  width: 100%;
	  margin-left: 10px;
	}
	
	.search button {
	  border: none;
	  background: none;
	  cursor: pointer;
	  font-size: 16px;
	  color: #333;
	}
	
	.user-icon {
		positon: relative;
	}
	
	.hamburger-button {
		
		background: transparent;
    border: none;
    color: white; /* Color of the hamburger icon */
    
    margin-right: 8px; /* Optional: Adjust margin if needed */
    display: none; /* Hide initially */
	}
	
	.hamburger-button {
    
}

@media (max-width: 991.98px) {
    /* Show hamburger button for smaller screens */
    .hamburger-button {
        display: block;
    }
}
  </style>
</head>
<% UserBean user1 = (UserBean)session.getAttribute("user"); %>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
	
	<a class="navbar-brand position-relative nav-link" href="home">
    	<i class="fa fa-home" aria-hidden="true"></i>
    </a>
	<div class="collapse navbar-collapse justify-content-start">
        <ul class="navbar-nav">
            
            <li class="nav-item">
                <a class="nav-link" href="product">Prodotti</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="home?page=ricette">Ricette</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="home?page=about">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="home?page=contacts">Contatti</a>
            </li>
        </ul>
    </div>
	
	<!-- Home Icon -->
  	
    
    
    <!-- Cart Icon with Badge -->
   <a class="navbar-brand position-relative nav-link" href="cart">
    <div class="position-relative">
        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
        <span id="cartBadge" class="badge badge-warning" style="font-size: 12px; color: white; position: absolute; top: -8px; right: -8px;">
            <%= cart.getSize() %>
        </span>
    </div>
</a>


    
    <div class="nav-link ml-auto">
        <i class="fa fa-user fa-lg user-icon" aria-hidden="true"></i>
        <div class="user-dropdown">
            <% if(user1 == null) { %>
                <a href="login">Log In</a>
                <a href="register">Registrati</a>
            <% } else { %>
                <a href="account">Account</a>
                <a href="order">Ordini</a>
                <a href="favorites">Preferiti</a>
                <a href="logout">Log Out</a>
            <% } %> 
        </div>
    </div>
    <!-- Search Bar -->
    <div class="search mr-3">
    <input id="searchInput" type="search" placeholder="Search..." aria-label="Search" onkeyup="searchProducts()">
    <button type="button"><i class="fas fa-search"></i></button>
    <!-- Div for Search Results -->
    <div id="searchResults" class="search-results"></div>
</div>
    <!-- User Icon -->
    
   
    
    <!-- Toggler Button for Side Panel -->
    
    <button class="hamburger-button" type="button" onclick="openCloseNav()">
    <i class="fa-solid fa-bars fa-xl"></i>
	</button>
    
    
</nav>

<!-- Side Panel -->
<div id="mySidepanel" class="sidepanel">
    <a style="background-color: clear;" href="javascript:void(0)" class="closebtn" onclick="openCloseNav()">&times;</a>
    
  	
    <ul style="list-style-type: none;">
            
            <li> 
                <a class="nav-link" style="text-decoration:none;" href="product">Prodotti</a>
            </li>
            <li>
                <a class="nav-link" style="text-decoration:none;" href="home?page=ricette">Ricette</a>
            </li>
            <li >
                <a class="nav-link" style="text-decoration:none;"href="home?page=about">About</a>
            </li>
            <li >
                <a class="nav-link" style="text-decoration:none;"href="home?page=contacts">Contatti</a>
            </li>
        </ul>
	
</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js" integrity="sha384-Oz7lgvFTBmF2tgUbWhi+UbVpO6A2ZHxrXxggo99/YCCTr3eeRtYstVqatDifOd5I" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
	const userIcon = document.querySelector(".fa-user");
    const userDropdown = document.querySelector(".user-dropdown");
    const searchInput = document.getElementById('searchInput');
    const searchResults = document.getElementById('searchResults');

    	
    if (userIcon && userDropdown) {
        userIcon.addEventListener("click", function() {
            userDropdown.style.display = userDropdown.style.display === "block" ? "none" : "block";
        });

        // Close dropdown if user clicks outside of it
        document.addEventListener("click", function(event) {
            if (!userDropdown.contains(event.target) && event.target !== userIcon) {
                userDropdown.style.display = "none";
            }
        });
    }

    if (searchInput && searchResults) {
        searchInput.addEventListener("focus", function() {
            if (searchResults.innerHTML !== '') {
                searchResults.classList.add('active');
            }
        });

        // Close search results if user clicks outside of it
        document.addEventListener("click", function(event) {
            if (!searchResults.contains(event.target) && event.target !== searchInput) {
                searchResults.classList.remove('active');
                searchResults.innerHTML = '';
            }
        });
    }
});

/* Open the side panel */
function openCloseNav() {
    if(document.getElementById("mySidepanel").style.width == "200px"){
        document.getElementById("mySidepanel").style.width = "0px";
    }
    else {
        document.getElementById("mySidepanel").style.width = "200px";
    }
}

function searchProducts() {
    var query = document.getElementById('searchInput').value;

    if (query.length === 0) {
        searchResults.classList.remove('active');
        document.getElementById('searchResults').innerHTML = '';
        return;
    }

    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'search?query=' + encodeURIComponent(query), true);

    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var products = JSON.parse(xhr.responseText);
            var results = document.getElementById('searchResults');
            results.innerHTML = '';

            if (products.length === 0) {
                results.innerHTML = '<p>Nessun prodotto trovato</p>';
                searchResults.classList.add('active');
                return;
            }
            
            for (var i = 0; i < products.length; i++) {
                var product = products[i];

                // Create a link element that wraps the product div
                var productLink = document.createElement('a');
                productLink.href = 'details?id=' + product.id;
                productLink.className = 'product-link';

                // Create product element
                var productDiv = document.createElement('div');
                productDiv.className = 'search-result';

                // Create product image
                var img = document.createElement('img');
                img.src = 'imageServlet?img=' + product.immagini[0]; // Use the first image
                img.alt = product.nome;
                img.className = 'product-image';

                // Create product name as a span
                var nameSpan = document.createElement('span');
                nameSpan.innerText = product.nome;
                nameSpan.className = 'product-name';

                // Append image and name span to product div
                productDiv.appendChild(img);
                productDiv.appendChild(nameSpan);

                // Append product div to the link
                productLink.appendChild(productDiv);

                // Append the link to results
                results.appendChild(productLink);
            }

            searchResults.classList.add('active');
        }
    };

    xhr.send();
}
   	
</script>
</body>
</html>
