package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

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
	private static ProductModel productModel = new ProductModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * usato per gestire dashboard e reindirizzare a login
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBean adminBean = (AdminBean) request.getSession().getAttribute("admin");
		if (adminBean == null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/login.jsp");
			dispatcher.forward(request, response);
			return;
		}
		
		String redirect = "dashboard.jsp";
		String action = request.getParameter("action");
		
		if (action == null) {
			action = "";
		}
		else if (action.equals("catalogo")) {
			try {
				Collection<ProductBean> prodotti = productModel.doRetrieveAllProducts(null);
				request.setAttribute("prodotti", prodotti);
				redirect = "catalogo.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/" + redirect);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("admin", adminBean);
		doGet(request, response);
	}

}
