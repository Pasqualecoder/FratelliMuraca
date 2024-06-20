<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*"
    pageEncoding="UTF-8"%>
<% LinkedList<AdminBean> adminList = (LinkedList<AdminBean>) request.getAttribute("adminList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestisci Admin - Fratelli Muraca</title>
</head>
<body>
<h2> Gestione admin </h2>
<p> lista degli admin </p>

<% if(adminList != null && !adminList.isEmpty())
	{
	for(AdminBean externalAdmin : adminList)
		{%>
			<p> <%= externalAdmin %></p>
		<%}
	}
%>
<!-- 1 mostrare gli admin
 recuperarli dal bean
 fare una ul e mostrarla schermo -->

</body>
</html>