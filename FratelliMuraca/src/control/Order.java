package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Map;

import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;
import model.ProductBean;
import model.ProductModel;
import model.ProductModelDS;

import java.io.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			// model = new ProductModelDM();
		}
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Metodo non consentito per questa risorsa.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* TODO:
		 * verificare che l'utente esista e sia loggato
		 * creare una copia del carrello identica del carrello ma con i dati presi dal db per evitare manomissioni
		 * svuotare il vecchio
		 * convertire questo nuovo carrello in un binario per salvarlo nel db insieme alle chiavi e il datetime e lo stato della consegna
		 * reindirizzare alla pagina ordini recenti con una scritta di successo se tutto va a buon fine (la pagina deve essere la stessa che si usa sempre per vedere gli ordini ma con una nota sopra per far vedere che l'op è riuscita)
		 */
		
		// controllo utente
		int idUtente = Integer.parseInt(request.getParameter("userId"));
		
		
		// Verifica dell correttezza del carrello
		Cart copia = null;
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null) {
			// errore
		}
		try {
			copia = copyValidateCart(cart);
		} catch (IOException | SQLException e) {
			e.printStackTrace();
		}
		cart = copia;

		
		// salvataggio nel db
		try {
			model.doSaveOrder(idUtente, cart);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		/*
		try {
			byte[] buff = request.getParameter("cart").getBytes();
			carrello = Cart.deserialize(buff);
			if (carrello == null) {
				throw new IOException("carrello passato nullo");
			}
		} catch (IOException | ClassNotFoundException e) {
			System.out.println("la conversione ha dato un errore");
			System.out.println(request.getParameter("cart"));
			e.printStackTrace();
			throw new RuntimeException();
		}
		
		String nome = request.getParameter("user");
		System.out.println(nome);
		System.out.println(carrello);
		*/

	}
	
	/**
	 * probabilmente neanche necessaria
	 * @param vecchio: carrello inviato dal post dell'utente non convalidato
	 * @return nuovo: carrello convalidato
	 */
	private Cart copyValidateCart(Cart vecchio) throws IOException, SQLException {
		Cart nuovo = new Cart();
		for (Map.Entry<ProductBean, Integer> entry : vecchio.getProducts().entrySet()) {
			ProductBean toCheck = entry.getKey();
			int quantita = entry.getValue();
			if (quantita < 1) {
				throw new IOException("quantita del prodotto "  + toCheck.getId() + ":" + toCheck.getNome() + " invalida");
			}
			

			ProductBean equivalent = model.doRetrieveByKey(toCheck.getId());
			for (int i = 0; i < quantita; i++) {
				nuovo.addProduct(equivalent);
			}
			
		}
		return nuovo;
	}

}
