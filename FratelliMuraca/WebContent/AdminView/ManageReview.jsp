<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<ReviewBean> reviewList = (LinkedList<ReviewBean>) request.getAttribute("reviewList"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="central-container" id="dashboard-container">
	<a class="go-back" href="admin">&#171; Dashboard</a>

	<h2> Gestione Review </h2>
	<p> lista Review</p>
	<table border="1">
	    <tr>
	        <th>Id</th>
	        <th>Titolo</th>
	        <th>Content</th>
	        <th>Rating</th>
	        <th>Date</th>
	        <th>UserID</th>
	        <th>UserEmail</th>
	        <th>ProductID</th>
	        <th>ProductName</th>
	        <th>ELIMINA RECENSIONE</th>
	    </tr>
	    <% if (reviewList != null && !reviewList.isEmpty()) {
	          for (ReviewBean externalReview : reviewList) 
	          {%>
	    <tr>
	        <td><%= externalReview.getId() %></td>
	        <td><%= externalReview.getTitolo() %></td>
	        <td><%= externalReview.getContent() %></td>
	        <td><%= externalReview.getRating() %></td>
	        <td><%= externalReview.getDate() %></td>
	        <td><%= externalReview.getUser().getId() %></td>
	        <td><%= externalReview.getUser().getEmail() %></td>
	        <td><%= externalReview.getProduct().getId() %></td>
	        <td><%= externalReview.getProduct().getNome() %></td>
            <td><a href="admin?action=review&op=remove&id=<%= externalReview.getId() %> ">ELIMINA RECENSIONE</a></td>
	    </tr>
	    <% } %>
	    <% } %>	 
	</table>
	
</div>
</body>
</html>