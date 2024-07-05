package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.*;


/**
 * Servlet implementation class Main
 */
@WebServlet("/test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderModelDS orderModelDS = new OrderModelDS();
		LinkedList<OrderBean> ordini = null;		
		try {
			ordini = (LinkedList<OrderBean>) orderModelDS.doRetrieveAllOrders();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.getWriter().append("[");
		for (int i = 0; i < ordini.size(); i++) {
			OrderBean orderBean = ordini.get(0);
			response.getWriter().append(orderBean.toJSON());
			
			if (i != ordini.size()-1) {
				response.getWriter().append(",");
			}
		}
		response.getWriter().append("]");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

