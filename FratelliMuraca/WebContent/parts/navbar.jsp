<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Responsive Navbar with Side Panel and Cart Badge</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
  
  	.navbar-nav .nav-link .fa-user {
  	font-size: 1.5rem; /* Increase size */
  	color: white; /* Color of the icon */
	}
  	body {
  		padding-top: 56px; /* Adjust this value based on the height of your navbar */
	}
    .navbar {
      background-color: #5f720f; /* Green background */
    }
      color: white !important; /* White text for links */
    }
    .navbar-brand:hover, .nav-link:hover {
      color: #d4edda !important; /* Lighter green on hover */
    }
    /* Side panel styles */
    .sidepanel {
      height: 100%; /* Full-height */
      width: 0; /* Initial width 0 */
      position: fixed; /* Fixed side panel */
      z-index: 1; /* Stay on top */
      top: 0;
      right: 0;
      background-color: #5f720f; /* Green background */
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
      color: #d4edda;
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
    .navbar-toggler {
      border-color: rgba(255, 255, 255, 0.1);
    }
    /* Badge styles */
    .badge {
      position: absolute;
      top: -5px;
      right: -10px;
      background-color: red;
      color: white;
      border-radius: 50%;
    }
    
    .nav-link {
    	color: white; !important
    	text-decoration: none; !important
    }
    
     .nav-link:hover {
    	color: yellow; !important
    	text-decoration: none; !important
    }
    
    .nav-item {
      position: relative;
    }
    
    .nav-item::before {
      content: '';
      position: absolute;
      width: 100%;
      height: 4px;
      border-radius: 4px;
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
   
  </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <!-- Cart Icon with Badge -->
    <a class="navbar-brand position-relative" href="cart">
        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 16 16">
            <path fill="white" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607L1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4a2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4a2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2a1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2a1 1 0 0 1 0-2"/>
        </svg>
        <span id="cartBadge" class="badge badge badge-warning" style="font-size: 12px; color: white;">0</span>
    </a>
    <!-- Search Bar -->
    <form class="form-inline mr-auto">
        <input id="searchInput" class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
        <!-- Div for Search Results -->
        <div id="searchResults" class="search-results"></div>
    </form>
    <!-- User Icon -->
    <a class="nav-link ml-auto" href="cart">
        <i class="fas fa-user"></i>
    </a>
    <!-- Toggler Button for Side Panel -->
    <button class="navbar-toggler" type="button" onclick="openCloseNav()">
        <span class="navbar-toggler-icon">
            <!-- Add an icon inside the span for custom icon (optional) -->
            <!-- Example using Bootstrap's icon -->
            <img src="https://img.icons8.com/ios-filled/24/ffffff/menu.png" alt="Menu">
        </span>
    </button>
    <!-- Navbar links (hidden on smaller screens) -->
    <div class="collapse navbar-collapse justify-content-end">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="home">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="product">Prodotti</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Side Panel -->
<div id="mySidepanel" class="sidepanel">
    <a href="javascript:void(0)" class="closebtn" onclick="openCloseNav()">&times;</a>
    <!-- User Icon in Sidebar -->
  
    <a class="nav-link" href="#">Home</a>
    <a class="nav-link" href="#">Features</a>
    <a class="nav-link" href="#">Pricing</a>
    <a class="nav-link" href="#">Contact</a>
    <!-- Search Bar in Side Panel -->

</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    /* Open the side panel */
    function openCloseNav() {
        console.log("opening")
        if(document.getElementById("mySidepanel").style.width == "250px"){
            document.getElementById("mySidepanel").style.width = "0px";
        }
        else {
            document.getElementById("mySidepanel").style.width = "250px";
        }
    }

    const searchInput = document.getElementById('searchInput');
    const searchResults = document.getElementById('searchResults');
    const cartBadge = document.getElementById('cartBadge');

    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.trim();

        if (searchTerm !== '') {
            // Make AJAX request
            const xhr = new XMLHttpRequest();
            xhr.open('GET', `search.php?q=${searchTerm}`, true);
            xhr.onload = function() {
                if (xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    // Display search results
                    displayResults(response);
                }
            };
            xhr.send();
        } else {
            // Clear search results
            searchResults.innerHTML = '';
        }
    });

    // Function to display search results
    function displayResults(results) {
        if (results.length > 0) {
            // Clear previous results
            searchResults.innerHTML = '';
            // Create a list to hold the results
            const resultList = document.createElement('ul');
            // Add a class to the list for styling
            resultList.classList.add('search-results-list');
            // Loop through the results and create list items
            results.forEach(result => {
                const listItem = document.createElement('li');
                listItem.textContent = result;
                // Append each list item to the list
                resultList.appendChild(listItem);
            });
            // Append the list of results to the search results div
            searchResults.appendChild(resultList);
        } else {
            // If no results found, display a message
            searchResults.innerHTML = '<p>No results found</p>';
        }
    }
</script>

</body>
</html>
