<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8"%>
<%
	Collection<ProductBean> products = (Collection<ProductBean>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
%>