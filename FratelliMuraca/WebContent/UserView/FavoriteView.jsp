<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>

<%@ include file="../init/cartinit.jsp" %>
<% UserBean user = (UserBean)session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<%@ include file="../parts/head.jsp" %>

<body>

<%@ include file="../parts/navbar.jsp" %>
<%
	LinkedList<FavoriteBean> preferiti = (LinkedList<FavoriteBean>) request.getAttribute("preferiti");
if (preferiti == null || preferiti.size() <= 0) {
%>
Nessun preferito

<%@ include file="../parts/footer.jsp" %>
</body>
</html>