# To-Do List Progetto

TOGLIERE I TAG STYLE DALLE PAGINE .JSP >:(

mettere un filtro per tutte le pagine .JSP
non vanno mostrate. bisogna sempre passare dalle Control

togliere tutti i System.out utilizzati per il debug

# Testare le vulnerabilita' di Spike


## Implementazione Account e Pagina Amministratore

1. **Account Amministratore**
   - Creazione di un account amministratore.

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
						if ?action= o non settato -> admin/dashboard
						if ?action="catalogo" -> admin/catalogo dove si può modificare o eliminare
						if ?action="users" -> admin/manageUsers.jsp visualizzare gli utenti
						if ?action="admins" -> admin/manageAdmins.jsp Permettere di creare e eliminare profili admin (solo all'admin con id1 che)
						if ?action="orders" -> admin/orders.jsp visualizzare gli ordini e modificare lo stato
					
   - **Gestione Catalogo**
     - Aggiungere, modificare e rimuovere prodotti dal catalogo.
   - **Gestione Ordini**
   - **Assegnazione admin**
     - Permettere di creare e eliminare profili admin (solo all'admin con id1 che) assicurarsi che a livello di sicurezza durante il redirect sia fatto il controllo sull'id

## Utente


4. **Modifica Campi Utente**
   - Correggere i bug relativi alla modifica dei campi del profilo utente.

5. **Gestione Utente**
   - **Recensioni Prodotti**
     - Permettere agli utenti di lasciare recensioni sui prodotti acquistati direttamente dalla pagina dei dettagli del prodotto (implementare il backend per le recensioni).

## Sito Responsive

6. **Responsive Design**
   - Assicurarsi che le seguenti sezioni del sito siano responsive:
     - Footer
     - Carrello
     - Login
     - Registrazione

# Pagina Registrazione/Login

# Sicurezza
1. **Non Permettere ad un utente loggato di accedere alla pagina di login e register**
2. **Rimuovere le info di debug da error.jsp**
3. **Nascondere le pagine di errore di default sempre per nascondere le info di debug**

## Funzionalità Aggiuntive
PDF negli ordini


8. **Preferiti**
   - Implementare una funzionalità che permetta agli utenti di aggiungere prodotti ai preferiti. (Gia' iniziata vedere FavoriteBean, FavoriteModel, FavoriteView e le due servlet)


9. **Selezione Tipologia Prodotti**
   - Aggiungere la possibilità di selezionare la tipologia dei prodotti in `ProductView` utilizzando AJAX.
   - Filtraggio prodotti


## Bug

1. **Fix Registrazione**
  - Giorno di nascita nella registrazione viene salvato con un giorno in meno


## Grafica
1. **Fixare sidebar** 
2. **Fixare navbar**
3. **Aggiornare pagina home**
  - inserire pulsante all'inzio per andare ai prodotti(shop.oliocirulli.com)
4. **Fixare footer**
fixare la distanza tra icona del carrello e numero


# prima della presentazione
- mostrare meno info di debug in error.jsp
- rimuovere /Main.java /ErrorControl.java