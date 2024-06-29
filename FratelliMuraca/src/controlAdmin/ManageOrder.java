package controlAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrderBean;
import model.OrderModel;
import model.OrderModelDS;

/**
 * Servlet implementation class ManageOrder
 */
@WebServlet("/admin/manageOrder")
public class ManageOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static OrderModel orderModel = new OrderModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageOrder() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LinkedList<OrderBean> listaOrdini = null;
		try {
			listaOrdini = (LinkedList<OrderBean>) orderModel.doRetrieveAllOrders();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("listaOrdini", listaOrdini);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView/ManageOrder.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
