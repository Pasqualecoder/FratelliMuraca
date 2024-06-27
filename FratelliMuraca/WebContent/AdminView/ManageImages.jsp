<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<%
LinkedList<ImageBean> listaImmagini = (LinkedList<ImageBean>) request.getAttribute("listaImmagini");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestione immagini</title>
</head>
<body>

<form action="manageImages" method="POST" enctype="multipart/form-data">
	ID PRODOTTO <input name="idProdotto" type="number">
	inserisci immagine <input name="immagine" type="file" id="immagine" class="form-control-file" name="" accept="image/png, image/gif, image/jpeg">
	<input type="submit">
</form>




<br><br><br>
	<table>
	<thead>
		<tr>
			<th>id_immagine</th>
			<th>immagine</th>
			<th>id_prodotto</th>
			<th>action</th>	
		</tr>
	</thead>
	<tbody>
	<% 
		for (ImageBean immagine : listaImmagini) {%>
		<tr>
			<td><%= immagine.getId() %></td>		
			<td><img src="/FratelliMuraca/imageServlet?img=<%= immagine.getId() %>"></td>
			<td><%= immagine.getProductId() %></td>
			<td><a href="./manageImages?id=<%= immagine.getId() %>">Rimuovi</a></td>	
		</tr>
	<%	}%>
	</tbody>
	</table>
</body>
</html>