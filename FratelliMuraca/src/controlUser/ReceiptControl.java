package controlUser;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminBean;
import model.OrderBean;
import model.OrderModel;
import model.OrderModelDS;
import model.UserBean;

/**
 * Servlet implementation class Receipt
 */
@WebServlet("/receipt")
public class ReceiptControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	OrderModel orderModel = new OrderModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceiptControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserBean user = (UserBean) request.getSession().getAttribute("user");
		AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
		int idOrdine = 0;

		// check sul parametro
		Integer integer = null;
		try {
			integer = Integer.parseInt(request.getParameter("id"));
			if (integer == null || integer < 1) {
				throw new NumberFormatException("id nullo o fuori range");
			}			
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "bad request");
			return;
		}
		
		
		idOrdine = integer;
		// controllo che l'ordine sia effettivamente associato all'utente richiedente (altrimenti chiunque potrebbe accedere alle ricevute di altre persone)
		OrderBean order = null;
		try {
			if(admin == null) {
				order = orderModel.doRetrieveOrder(idOrdine, user.getId());
				order.setUser(user);
			}
			else {
				order = orderModel.doRetrieveOrder(idOrdine);
			}
			if (order == null) {
				throw new SQLException();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "non e' una tua ricevuta!");
			return;
		}
		
		request.setAttribute("order", order);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserView/ReceiptView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
