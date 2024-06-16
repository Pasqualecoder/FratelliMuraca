<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*,model.*" pageEncoding="UTF-8" %>
<%@ include file="../init/cartinit.jsp" %>
<html>
<head>
    <%@ include file="../parts/head.jsp" %>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', Tahoma, Arial, sans-serif; /* Preferiamo il font Roboto */
            background-color: #dcdcdc; /* Sfondo grigio chiaro */
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; /* Layout colonna per centrare testo e pannello */
            height: 100vh;
            margin: 0;
        }
        .welcome-message {
            font-size: 24px;
            font-weight: bold; /* Testo in grassetto */
            color: #333333; /* Colore del testo grigio scuro */
            margin-bottom: 20px; /* Spazio tra testo e pannello */
        }
        .admin-panel {
            background-color: #f5f5f5; /* Sfondo bianco sporco */
            border: 2px solid #808080; /* Bordi grigio medio */
            max-width: 100%; /* Larghezza massima per adattarsi al contenuto */
            padding: 20px;
            text-align: center;
            box-shadow: 4px 4px 0px #a9a9a9; /* Ombra grigia */
            margin-top: 20px; /* Spazio sopra il pannello */
            overflow: auto; /* Gestisce lo scorrimento se il contenuto supera la larghezza */
        }
        .admin-panel h2 {
            font-size: 18px;
            color: #555555; /* Testo grigio scuro */
            margin-bottom: 20px;
            border-bottom: 2px solid #808080; /* Sottolineatura grigia */
            padding-bottom: 10px;
        }
        .admin-panel table {
            width: 100%; /* Tabella larga al 100% del pannello */
            margin-bottom: 20px; /* Spazio sotto la tabella */
            border-collapse: collapse; /* Bordi tabella separati */
            table-layout: auto; /* Imposta la larghezza delle colonne in base al contenuto */
            overflow-x: auto; /* Gestisce lo scorrimento orizzontale se la tabella è troppo ampia */
        }
        .admin-panel th, .admin-panel td {
            border: 1px solid #808080; /* Bordi grigi per celle */
            padding: 8px; /* Spazi interni delle celle */
            text-align: left; /* Allinea il testo a sinistra nelle celle */
            white-space: nowrap; /* Evita che il testo venga spezzato su più righe */
        }
        .admin-panel th {
            background-color: #f2f2f2; /* Sfondo grigio chiaro per celle di testata */
        }
        .admin-panel td:last-child {
            white-space: nowrap; /* Evita che il testo venga spezzato e che il link venga diviso su più righe */
        }
        .admin-panel a {
            text-decoration: none;
            color: #333333; /* Colore link grigio scuro */
        }
        .admin-panel a:hover {
            text-decoration: underline;
        }

        /* Media query per schermi di larghezza inferiore a 768px (ad esempio, dispositivi mobili) */
        @media (max-width: 768px) {
            .admin-panel table {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
                margin-bottom: 10px; /* Aggiungiamo un margine inferiore per separare la tabella dal testo */
            }
            .admin-panel th, .admin-panel td {
                padding: 6px; /* Riduciamo lo spazio interno delle celle */
                border: 1px solid #ddd;
            }
            .admin-panel th {
                min-width: 120px; /* Larghezza minima delle celle di testata */
            }
            .admin-panel td:last-child {
                white-space: nowrap;
            }
        }
    </style>
</head>
<body>
    <div class="welcome-message">
        <h1>Elenco Utenti</h1>
    </div>
    <div class="admin-panel">
        <h2>Tabella Utenti</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Cognome</th>
                    <th>Email</th>
                    <th>Data di Nascita</th>
                    <th>Numero di Telefono</th>
                    <th>Ruolo</th>
                    <th>Azioni</th>
                </tr>
            </thead>
            <tbody>
                <% 
                Collection<UserBean> users = (Collection<UserBean>) request.getAttribute("users");
                if (users == null || users.isEmpty()) { %>
                    <tr>
                        <td colspan="8">Nessun utente trovato.</td>
                    </tr>
                <% } else {
                    for (UserBean user : users) { %>
                        <tr>
                            <td><%= user.getId() %></td>
                            <td><%= user.getNome() %></td>
                            <td><%= user.getCognome() %></td>
                            <td><%= user.getEmail() %></td>
                            <td><%= user.getDdn() %></td>
                            <td><%= user.getPhone() %></td>
                            <td></td> <!-- Colonna vuota per il ruolo -->
                            <td><a href="gestioneUtente.jsp?id=<%= user.getId() %>">Gestisci Utente</a></td>
                        </tr>
                    <% }
                } %>
            </tbody>
        </table>
    </div>
</body>
</html>

