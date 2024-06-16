<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="../init/cartinit.jsp" %>
<html>
<head>
    <%@ include file="../parts/head.jsp" %>
     <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Tahoma, Arial, sans-serif;
            background-color: #dcdcdc; /* Colore di sfondo grigio chiaro */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-panel {
            background-color: #f5f5f5; /* Sfondo bianco sporco */
            border: 2px solid #808080; /* Bordi grigio medio */
            width: 300px;
            padding: 20px;
            text-align: center;
            box-shadow: 4px 4px 0px #a9a9a9; /* Ombra grigia */
        }
        .login-panel h2 {
            font-size: 20px;
            color: #555555; /* Testo grigio scuro */
            margin-bottom: 20px;
            border-bottom: 2px solid #808080; /* Sottolineatura grigia */
            padding-bottom: 10px;
        }
        .login-panel form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-panel form input {
            margin-bottom: 15px;
            padding: 10px;
            width: 90%; /* Larghezza del 90% del contenitore */
            border: 1px solid #808080; /* Bordi grigi */
            background-color: #f0f0f0; /* Sfondo grigio chiaro */
            color: #555555; /* Testo grigio scuro */
            font-size: 14px;
        }
        .login-panel form button {
            padding: 10px;
            width: 100%;
            font-size: 14px;
            background-color: #808080; /* Colore di sfondo grigio medio */
            color: #ffffff;
            border: none;
            cursor: pointer;
        }
        .login-panel form button:hover {
            background-color: #696969; /* Grigio più scuro al passaggio del mouse */
        }
    </style>
</head>
<body>
    <div class="login-panel">
        <h2>Login</h2>
        <form action="admin" method="POST">
            <input type="text" name="username" placeholder="Nome utente" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Accedi</button>
        </form>
    </div>
</body>
</html>

