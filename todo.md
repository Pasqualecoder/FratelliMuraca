# To-Do List Progetto

TOGLIERE I TAG STYLE DALLE PAGINE .JSP >:(

# Testare le vulnerabilita' di Spike


## Implementazione Account e Pagina Amministratore

2. **Pagina Amministratore**
	Struttura dell'amministratore:
		Webcontent:
			admin/login.jsp
			admin/dashboard.jsp
		Java:
			AdminControl.java
				doGet()
					se non loggato (reindirizza)-> admin/login.jsp
					se loggato
						if ?action="catalogo" -> admin/catalogo dove si può modificare o eliminare
						if ?action="orders" -> admin/orders.jsp visualizzare gli ordini e modificare lo stato
					
   - **Gestione Catalogo**
     - Aggiungere, modificare e rimuovere prodotti dal catalogo.
   - **Gestione Ordini**

## Utente
4. **Modifica Campi Utente**
   - Correggere i bug relativi alla modifica dei campi del profilo utente. (date salvato con un giorno in meno)

5. **Gestione Utente**
   - **Recensioni Prodotti**
     - Permettere agli utenti di lasciare recensioni sui prodotti acquistati direttamente dalla pagina dei dettagli del prodotto (implementare il backend (db) per le recensioni).

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


8. **Preferiti**
   - Implementare una funzionalità che permetta agli utenti di aggiungere prodotti ai preferiti. (Gia' iniziata vedere FavoriteBean, FavoriteModel, FavoriteView e le due servlet)


9. **Selezione Tipologia Prodotti**
   - Aggiungere la possibilità di selezionare la tipologia dei prodotti in `ProductView` utilizzando AJAX.
   - Filtraggio prodotti (valutare se far filtrare al db)


## Bug


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
