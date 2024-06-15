package control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Map;

import javax.management.RuntimeErrorException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

import java.io.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/order")
public class OrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static ProductModel productModel = new ProductModelDS();
	static OrderModel orderModel = new OrderModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// prendere l'id dell'utente
		UserBean user = (UserBean) request.getSession().getAttribute("user_bean");			
		if (user == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
		
		
		CartBean cart = (CartBean) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new CartBean();
			request.getSession().setAttribute("cart", cart);
		}
		
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		try {
			request.removeAttribute("ordini");
			request.setAttribute("ordini", orderModel.doRetrieveOrders(user));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean opStatus = false;
		
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
		CartBean copia = null;
		CartBean cart = (CartBean) request.getSession().getAttribute("cart");
		if(cart == null || cart.isEmpty()) {
			doGet(request, response);
		}
		else {
			try {
				copia = copyValidateCart(cart);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
			}
			cart = copia;
	
			
			// salvataggio nel db
			try {
				orderModel.doSaveOrder(idUtente, cart);
				opStatus = true;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("opStatus", opStatus);
			
			if (opStatus) {
				request.getSession().setAttribute("cart", new CartBean());
			}
		
			
			doGet(request, response);
		}
	}
	
	/**
	 * probabilmente neanche necessaria
	 * @param vecchio: carrello inviato dal post dell'utente non convalidato
	 * @return nuovo: carrello convalidato
	 */
	private static CartBean copyValidateCart(CartBean vecchio) throws IOException, SQLException {
		CartBean nuovo = new CartBean();
		for (Map.Entry<ProductBean, Integer> entry : vecchio.getProducts().entrySet()) {
			ProductBean toCheck = entry.getKey();
			int quantita = entry.getValue();
			if (quantita < 1) {
				throw new IOException("quantita del prodotto "  + toCheck.getId() + ":" + toCheck.getNome() + " invalida");
			}
			

			ProductBean equivalent = productModel.doRetrieveProductByKey(toCheck.getId());
			for (int i = 0; i < quantita; i++) {
				nuovo.addProduct(equivalent);
			}
			
		}
		return nuovo;
	}

}
