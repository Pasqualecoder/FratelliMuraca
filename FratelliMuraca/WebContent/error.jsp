<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- Recupera il codice di errore e il testo dal request --%>
<% int errorCode = (Integer) request.getAttribute("javax.servlet.error.status_code"); %>
<% String errorMessage = (String) request.getAttribute("javax.servlet.error.message"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fratelli Muraca - <%= errorCode %></title>
</head>
<body>
<h1>Error <%= errorCode %></h1>
<p><%= errorMessage %></p>
<img alt="huh?" src="https://i.kym-cdn.com/entries/icons/original/000/046/895/huh_cat.jpg" width="500px">
</body>
</html>