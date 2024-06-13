package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;
import model.ProductBean;
import model.ProductModel;
import model.ProductModelDS;

/**
 * Servlet implementation class DetailsControl
 */
@WebServlet("/details")
public class DetailsControl extends HttpServlet {
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
    public DetailsControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		int id = -1;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			// Determina che la risorsa richiesta non è stata trovata
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
						cart.addProduct(model.doRetrieveByKey(id));
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
		// IMPORTANTE
		try {
			ProductBean prodotto = model.doRetrieveByKey(id);
			if (prodotto == null) {
				// Determina che la risorsa richiesta non è stata trovata
			    response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
			    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
				dispatcher.forward(request, response);
			}
			
			request.removeAttribute("prodotto");
			request.setAttribute("prodotto", prodotto);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DetailsView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
