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
		/*
		String subfolder = "/AdminView/";
		if (1==1) {}
		else if(action.equals("modificaAdmin")){
			try {
				redirect = "ModificaAdmin.jsp";
				
				String opModifica = request.getParameter("op");
				String id = request.getParameter("id");
				
				
				if(opModifica != null){
					if( (id != null) && opModifica.equals("remove")){						
						adminModel.doDeleteAdminById(id);
					}
				}
				
				//importante, dopo if sennò non carica l'update
				Collection <AdminBean> adminList  = (Collection<AdminBean>) adminModel.doRetrieveAllAdmins();
				request.setAttribute("adminList", adminList);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(action.equals("users")){
			try {
				redirect = "ManageUsers.jsp";
				
				String opModifica = request.getParameter("op");
				String id = request.getParameter("id");
				
				
				if(opModifica != null){
					if( (id != null) && opModifica.equals("remove")){
						userModel.doDeleteUserById(id);
						//response.sendRedirect(request.getContextPath() + "admin?users");
					}
				}
				
				//importante, dopo if sennò non carica l'update
				Collection <UserBean> userList  = (Collection<UserBean>) userModel.doRetrieveAllUsers();
				request.setAttribute("userList", userList);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(action.equals("review")){
			try {
				redirect = "ManageReview.jsp";
				
				String opModifica = request.getParameter("op");
				String id = request.getParameter("id");
				
				
				if(opModifica != null){
					if( (id != null) && opModifica.equals("remove")){
						reviewModel.doDeleteReview(id);
						//response.sendRedirect(request.getContextPath() + "admin?users");
					}
				}
				
				//importante, dopo if sennò non carica l'update
				Collection <ReviewBean> reviewList  = (Collection<ReviewBean>) reviewModel.doRetriveAllReviews();
				request.setAttribute("reviewList", reviewList);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(action.equals("orders")) {
			redirect = "VisualizzaOrdini.jsp";
			
			LinkedList<OrderBean> orderList = null;
			try {
				orderList = (LinkedList<OrderBean>) orderModel.doRetrieveAllOrders();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("orderList", orderList);
		}
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(subfolder + redirect);
		dispatcher.forward(request, response);
		*/
	}

	/**
	 * usato per il solamente per il login
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
