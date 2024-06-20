package control;

import java.io.IOException;
import java.sql.SQLException;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import model.CartBean;
import model.OrderModel;
import model.ProductBean;
import model.ProductModel;
import model.ProductModelDS;

/**
 * Servlet implementation class CartControl
 */
@WebServlet("/cart")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static ProductModel productModel = new ProductModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		cartAction(request, response);
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	public static void cartSetup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartBean cart = (CartBean) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new CartBean();
			request.getSession().setAttribute("cart", cart);
		}
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
	}
	
	public static void cartAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
					} catch (NumberFormatException e) {
						quantity = 1;
					}
					
					ProductBean toAdd = productModel.doRetrieveProductByKey(id);
					if (toAdd != null) {
						cart.addProduct(toAdd, quantity);							
					} else {
						response.sendError(HttpServletResponse.SC_NOT_FOUND, "Prodotto con id=" + id + " non trovato");
						return;
					}
				} 
				
				// REMOVE FROM CART
				else if (action.equalsIgnoreCase("deleteC")) {
					int quantity = 1;
					int id = Integer.parseInt(request.getParameter("id"));
					try {
						quantity = Integer.parseInt(request.getParameter("quantity"));		
					} catch (NumberFormatException e) {
						quantity = 1;
					}
					cart.deleteProduct(productModel.doRetrieveProductByKey(id), quantity);					
				}
				
				else if(action.equalsIgnoreCase("svuotaC")) {
					cart = new CartBean();
				}
			}
				
		} catch (NumberFormatException e) { // errore nella conversione dell'id (l'utente ha provato a manomettere l'url)
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "id prodotto non valido");
			return;
		}
		catch (SQLException e) {
			e.printStackTrace();
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
	}

}
