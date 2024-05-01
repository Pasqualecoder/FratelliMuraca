package control;

import java.io.IOException; 
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;
import model.ProductModel;
import model.ProductModelDS;
import model.ProductBean;
import model.ProductCategorie;

/**
 * Servlet implementation class ProductControl
 */
public class ProductControl extends HttpServlet {
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
	
	public ProductControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				// ADD TO CART
				if (action.equalsIgnoreCase("addC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(model.doRetrieveByKey(id));
				} 
				
				// REMOVE FROM CART
				else if (action.equalsIgnoreCase("deleteC")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetrieveByKey(id));
				}
				
				// DETAILS
				/*
				else if (action.equalsIgnoreCase("read")) {
					int id = Integer.parseInt(request.getParameter("id"));
					request.removeAttribute("product");
					request.setAttribute("product", model.doRetrieveByKey(id));
				} 
				*/
				
				// DELETE FROM DB
				else if (action.equalsIgnoreCase("delete")) {
					int id = Integer.parseInt(request.getParameter("id"));
					model.doDelete(id);
				} 
				
				// INSERT INTO DB
				else if (action.equalsIgnoreCase("insert")) {
					String nome = request.getParameter("nome");
					String descrizione = request.getParameter("descrizione");
					float prezzo = Float.parseFloat(request.getParameter("prezzo"));
					int quantita = Integer.parseInt(request.getParameter("quantita"));
					String dimensione = request.getParameter("dimensione");
					boolean tipo = Boolean.parseBoolean(request.getParameter("tipo"));
					ProductCategorie categoria = ProductCategorie.fromString(request.getParameter("categoria"));
					String anno = request.getParameter("anno");
					String ingredienti = request.getParameter("ingredienti");
					String image = request.getParameter("image");
					
					// TODO: save images
					ProductBean bean = null; // new ProductBean(nome, descrizione, prezzo, quantita, dimensione, tipo, categoria, anno, ingredienti, image);
					model.doSave(bean);
				}
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
