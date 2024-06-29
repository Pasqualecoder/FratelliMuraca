package controlAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class AdminControl
 */
@WebServlet("/admin")
public class AdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static AdminModel adminModel = new AdminModelDS();
	private static UserModel userModel = new UserModelDS();
	private static ProductModel productModel = new ProductModelDS();
	private static ReviewModel reviewModel = new ReviewModelDS();
	private static OrderModel orderModel = new OrderModelDS();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminControl() {
        super();
    }

	/**
	 * usato per gestire dashboard e reindirizzare a login
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath() + "/admin/dashboard");
	}

	/**
	 * usato per il solamente per il login
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
