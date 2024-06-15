package control;

import java.io.IOException; 
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartBean;
import model.ProductModel;
import model.ProductModelDS;
import model.ProductBean;
import model.ProductCategorie;

/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProductModel productModel = new ProductModelDS();
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CartBean cart = (CartBean) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new CartBean();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				// ADD TO CART
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					int quantity = 1;
					try {
						quantity = Integer.parseInt(request.getParameter("quantity"));						
					} catch (NumberFormatException e) {}
					
					
					for (int i = 0; i < quantity; i++)
						cart.addProduct(productModel.doRetrieveProductByKey(id));
				} 
				
				// REMOVE FROM CART
				else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(productModel.doRetrieveProductByKey(id));
				}
			}		
		} catch (NumberFormatException e) { // errore nella conversione dell'id (l'utente ha provato a manomettere l'url)
			response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
		catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", productModel.doRetrieveAllProducts(sort));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
