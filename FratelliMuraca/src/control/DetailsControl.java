package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * Servlet implementation class DetailsControl
 */
@WebServlet("/details")
public class DetailsControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static ProductModel productModel = new ProductModelDS();
	static OrderModel orderModel = new OrderModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailsControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartBean cart = (CartBean) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new CartBean();
			request.getSession().setAttribute("cart", cart);
		}

		int id = -1;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			// Determina che la risorsa richiesta non � stata trovata
			response.sendError(HttpServletResponse.SC_NOT_FOUND); // 404
		    response.sendRedirect("error.jsp");
		}

		
		String action = request.getParameter("action");
		try {
			if (action != null) {
				// ADD TO CART
				if (action.equalsIgnoreCase("addC")) {
					int quantity = 1;
					try {
						quantity = Integer.parseInt(request.getParameter("quantity"));						
					} catch (NumberFormatException e) {}
					
					
					for (int i = 0; i < quantity; i++)
						cart.addProduct(productModel.doRetrieveProductByKey(id));
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
		// IMPORTANTE
		ProductBean prodotto = null;
		try {
			prodotto = productModel.doRetrieveProductByKey(id);
			if (prodotto == null) {
				// Determina che la risorsa richiesta non � stata trovata
			    response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
			    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
				dispatcher.forward(request, response);
			}
			
			request.removeAttribute("prodotto");
			request.setAttribute("prodotto", prodotto);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// sezione per l'abilitazione al commento
		/* 
		 * se l'utente � loggato e ha effettuato l'acquisto del prodotto con lo stesso id
		 * � autorizzato a commentare
		 * l'attributo request.getAttribute("canComment") da usare nel frontend
		 */
		boolean canComment = false;
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		if (user != null) {
			canComment = checkBought(user, prodotto);
		}
		
		request.setAttribute("canComment", canComment);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
		dispatcher.forward(request, response);
	}
	
	// TODO: scrivere funzione per vedere se l'utente ha comprato il prodotto
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	


	/**
	 * per ogni ordine effettuato dall'utente
	 * controlla se � presente quel prodotto
	 * @param user
	 * @param prodotto
	 * @return
	 */
	private boolean checkBought(UserBean user, ProductBean prodotto) {
		LinkedList<OrderBean> listaOrdini = null;
		try {
			listaOrdini = (LinkedList<OrderBean>) orderModel.doRetrieveOrders(user);			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		boolean toReturn = false; // valore restituito dall funzione
		for (OrderBean or : listaOrdini) {
			CartBean vecchioCart = or.getProdotti();
			if (vecchioCart.isProductPresent(prodotto)) {
				toReturn = true;
				break;
			}
		}
		
		return toReturn;
	}
	
}
