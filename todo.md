# To-Do List Progetto

TOGLIERE I TAG STYLE DALLE PAGINE .JSP >:(

# Testare le vulnerabilita' di Spike


## Implementazione Account e Pagina Amministratore

2. **Pagina Amministratore**

						
	if ?action="orders" -> admin/orders.jsp visualizzare gli ordini e modificare lo stato
   - **Gestione Ordini**

## Utente
4. **Modifica Campi Utente**
   - Correggere i bug relativi alla modifica dei campi del profilo utente. (date salvato con un giorno in meno)

## Sito Responsive
6. **Responsive Design**
   - Assicurarsi che le seguenti sezioni del sito siano responsive:
     - Footer
     - Carrello
     - Login
     - Registrazione

# Pagina Registrazione/Login

# Sicurezza
1. **Content-Security Policy**
2. **Rimuovere le info di debug da error.jsp**
3. **Nascondere le pagine di errore di default sempre per nascondere le info di debug**

## Funzionalità Aggiuntive
PDF negli ordini

9. **Selezione Tipologia Prodotti**
   - Aggiungere la possibilità di selezionare la tipologia dei prodotti in `ProductView` utilizzando AJAX.
   - Filtraggio prodotti (valutare se far filtrare al db)

## Grafica
3. **Aggiornare pagina home**
  - inserire pulsante all'inzio per andare ai prodotti(shop.oliocirulli.com)
4. **Fixare footer**
fixare la distanza tra icona del carrello e numero


# prima della presentazione
- mostrare meno info di debug in error.jsp
- rimuovere /Main.java /ErrorControl.java

#### a tempo perso
- in verifyEmail passare l'onere del controllo dell'inizio dell'email a mysql
- stessa cosa probabilmente ai prodotti ricercati con ajax
