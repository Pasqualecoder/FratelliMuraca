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
		String subfolder = "/AdminView/";
		AdminBean adminBean = (AdminBean) request.getSession().getAttribute("admin");
		if (adminBean == null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(subfolder + "LoginView.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		// se sei un admin
		String redirect = "Dashboard.jsp";
		String action = request.getParameter("action");
		
		if (action == null) {
			action = "";
		}
		else if (action.equals("catalogo")) {
			try {
				Collection<ProductBean> prodotti = productModel.doRetrieveAllProducts(null);
				request.setAttribute("prodotti", prodotti);
				redirect = "CatalogoView.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			String operazione = request.getParameter("op");
			if (operazione == null) {
				operazione = "";
			}
			String id = request.getParameter("id");
			if (id == null) {
				id = "";
			}
			if(operazione.equals("delete")) {
				try {
					productModel.doDelete(id);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				response.sendRedirect(request.getContextPath() + "/admin?action=catalogo");
				return;
			}
			else if(operazione.equals("modifica")) {
				try {
					request.setAttribute("prodotto", productModel.doRetrieveProductByKey(Integer.parseInt(id)));
				} catch (NumberFormatException | SQLException e) {
					e.printStackTrace();
				}
				redirect = "ModificaView.jsp";
			}
			else if(operazione.equals("deleteImage")) {
				String img = request.getParameter("img");
				String id_prodotto = request.getParameter("prodotto");
				if (id_prodotto == null) {
					id_prodotto = "";
				}
				if (img == null) {
					img = "";
				}
				int img_id = Integer.parseInt(request.getParameter("img"));
				try {
					productModel.doDeleteImage(img_id);
					request.setAttribute("prodotto", productModel.doRetrieveProductByKey(Integer.parseInt(id_prodotto)));
				} catch (NumberFormatException | SQLException e) {
					e.printStackTrace();
				}
				redirect = "ModificaView.jsp";
			}
		}
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
	}

	/**
	 * usato per il solamente per il login
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminBean adminBean = new AdminBean(username, password);
		
		try {
			adminBean = adminModel.doRetrieveAdmin(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("admin", adminBean);
		doGet(request, response);
	}

}
