<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Fratelli Muraca</title>
    <link rel="stylesheet" href="css/home-style.css">
	<%@ include file="parts/head.jsp" %>

</head>
<body>
<%@ include file="parts/navbar.jsp" %>
<!-- Banner with logo -->
<header class="banner">
    <div class="container">
        <div class="row justify-content-center">
			<!-- Centered Video -->
			<div class="container d-flex justify-content-center align-items-center">
			<h1 class="font-weight-light font-italic text-light" style="margin-right: 50px">Un'azienda familiare, basata su un lavoro collettivo ricco di <strong>passione</strong></h1>
			    <video loop autoplay controls muted width="640" height="360" class="border">
			        <source src="media/video.mp4" type="video/mp4">
			        Your browser does not support the video tag.
			    </video>
			</div>
    	</div>	
    </div>
</header>

<div class="card">
  <div class="card-body">
    <h5 class="card-title">Agricoltura biologica</h5>
    <p class="card-text">La Società applicando le linee guida dell’agricoltura biologica, priva dell’utilizzo di prodotti di sintesi, segue tutte le fasi produttive ovvero dalla coltivazione delle olive all’estrazione e confezionamento dell’olio.</p>
  </div>
  <img class="card-img-bottom img-fluid" src="media/fratelli_muraca_retro1.jpg" alt="fratelli_muraca_retro1.jpg" width="1%">
</div>


<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce cursus urna at mi consectetur sagittis. Mauris sodales aliquam ultrices. Duis ac odio vitae lectus dapibus eleifend. Aliquam vel tempus mi, eu vehicula ipsum. Sed ac malesuada metus, ut dignissim nibh. Integer non ex et risus finibus consectetur vitae eleifend ligula. Nam vitae lacinia urna.

Vivamus placerat augue et quam varius posuere. Proin molestie vulputate viverra. In pellentesque justo a consectetur viverra. Sed justo nulla, dignissim in facilisis eget, imperdiet eget nisl. Integer id venenatis ex, a tincidunt urna. Quisque in felis tincidunt, laoreet diam nec, ornare odio. Curabitur interdum, lectus non venenatis rutrum, est ipsum semper justo, non sodales ante massa vitae lacus. Quisque sit amet dapibus purus, eget tempor purus. Cras dignissim ultricies risus in pellentesque. Maecenas vitae est placerat, pharetra risus vel, eleifend urna. Quisque lobortis lacus a ullamcorper finibus.

Donec pharetra dolor eget felis luctus laoreet. Donec consequat, sem non porta congue, metus lacus laoreet felis, eget porttitor nulla sem quis dui. Nunc quam mauris, placerat id purus et, suscipit viverra erat. Ut vehicula rhoncus quam in interdum. Donec quis sem eget justo auctor bibendum in id ligula. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec dignissim id nibh quis euismod. Donec facilisis metus quis imperdiet facilisis. Ut orci lacus, mattis quis interdum nec, hendrerit quis odio. Nulla blandit quam a ante faucibus venenatis. Nam bibendum, nisi gravida rhoncus dapibus, tortor massa interdum velit, ac interdum sem urna ut massa. Duis ullamcorper massa non velit condimentum, vitae tristique velit luctus. Maecenas laoreet cursus euismod. Maecenas pharetra mattis ante nec condimentum. Cras nec quam bibendum, viverra arcu sit amet, elementum leo. Nam condimentum metus eget leo sodales lacinia.

Etiam justo velit, tempor non neque eget, convallis rhoncus est. Suspendisse in blandit lectus, in tristique sem. Phasellus iaculis, dolor ut consectetur vulputate, nunc sem ultricies eros, et gravida ante odio sed risus. Fusce commodo velit ut nibh congue convallis. Ut dapibus dui ullamcorper velit fermentum aliquet. In sed metus orci. Donec quis faucibus tellus. Vestibulum id ex tincidunt, venenatis felis in, ultrices massa. Morbi mattis semper convallis. Duis tincidunt turpis mi, nec dictum dolor porttitor vitae. Suspendisse potenti. Vestibulum posuere ipsum eu urna vulputate congue. Aliquam venenatis metus in purus feugiat, sed vulputate sapien gravida. Aliquam tincidunt nisl in diam tristique vehicula. Sed laoreet augue diam, vitae venenatis orci interdum eget. Vivamus feugiat malesuada pulvinar.

Fusce pharetra lacus nisi, vitae lobortis nisl ultricies sed. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla in urna erat. Proin id pellentesque sem. Nam in sem id erat finibus imperdiet. Pellentesque ultrices lorem vitae odio euismod, at mattis eros accumsan. Suspendisse sed lorem elit.</p>


<!-- Bootstrap JS and custom script -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<%@ include file="parts/footer.jsp" %>
</body>
</html>