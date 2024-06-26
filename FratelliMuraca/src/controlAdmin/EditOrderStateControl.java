package controlAdmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class EditOrderStateControl
 */
@WebServlet("/editOrderState")
public class EditOrderStateControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static OrderModel orderModel = new OrderModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOrderStateControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String order_id =  request.getParameter("id");
        String state = request.getParameter("state");
		
        try { 
        	OrderBean order = orderModel.doRetrieveOrder(Integer.parseInt(order_id));
        	orderModel.doChangeOrderState(order, state);
        	
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
