<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="init/cartinit.jsp" %>
<html>
<head>
    <%@ include file="parts/head.jsp" %>
    <style>
        body {
            font-family: Tahoma, Arial, sans-serif; /* Font vecchio stile */
            background-color: #dcdcdc; /* Sfondo grigio chiaro */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; /* Layout colonna per centrare testo e pannello */
            height: 100vh;
            margin: 0;
        }
        .welcome-message {
            font-size: 18px;
            font-weight: bold; /* Testo in grassetto */
            color: #333333; /* Colore del testo grigio scuro */
            margin-bottom: 20px; /* Spazio tra testo e pannello */
        }
        .admin-panel {
            background-color: #f5f5f5; /* Sfondo bianco sporco */
            border: 2px solid #808080; /* Bordi grigio medio */
            width: 400px; /* Larghezza ridotta per un look più vecchio */
            padding: 20px;
            text-align: center;
            box-shadow: 4px 4px 0px #a9a9a9; /* Ombra grigia */
        }
        .admin-panel h2 {
            font-size: 18px;
            color: #555555; /* Testo grigio scuro */
            margin-bottom: 20px;
            border-bottom: 2px solid #808080; /* Sottolineatura grigia */
            padding-bottom: 10px;
        }
        .admin-panel ul {
            list-style-type: none;
            padding: 0;
        }
        .admin-panel li {
            margin-bottom: 10px;
        }
        .admin-panel a {
            text-decoration: none;
            color: #333333; /* Colore link grigio scuro */
        }
        .admin-panel a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <% 
    // Recupera l'oggetto utente dalla sessione
    UserBean user = (UserBean) session.getAttribute("user");
    %>
    <div class="welcome-message">
    <% if (user != null) { %>
        <!-- Stampa un messaggio di benvenuto con il nome dell'utente -->
        Ciao <%= user.getNome() %>!
    <% } else { %>
        <!-- Stampa un messaggio alternativo se l'utente non è autenticato -->
        Ciao! Non sei loggato.
    <% } %>
    </div>
    <div class="admin-panel">
        <h2>Pannello di Amministrazione</h2>
        <ul>
            <li><a href="/gestioneCatalogo">Gestione Catalogo</a></li>
            <li><a href="/gestioneUtenti">Gestione Utenti</a></li>
            <li><a href="/gestioneOrdini">Gestione Ordini</a></li>
            <!-- Puoi aggiungere altre azioni secondo le necessità -->
        </ul>
    </div>
</body>
</html>

