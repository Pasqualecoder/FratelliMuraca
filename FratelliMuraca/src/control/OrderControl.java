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
		UserBean user = (UserBean) request.getSession().getAttribute("user");			
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
		
		// prendere l'id dell'utente
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		if (user == null) {
			response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
		}
		
		// Recupera i dettagli dal form
        String detailsJson = request.getParameter("details");
        if (detailsJson == null || detailsJson.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            return;
        }
		

		CartBean cart = (CartBean) request.getSession().getAttribute("cart");
		if(cart == null || cart.isEmpty()) {
			doGet(request, response);
		}
	
			
		// salvataggio nel db
		try {
			OrderBean order = new OrderBean(user.getId(), detailsJson, cart);
			orderModel.doSaveOrder(order);
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
