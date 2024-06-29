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

import model.AdminBean;
import model.AdminModel;
import model.AdminModelDS;

/**
 * Servlet implementation class ManageAdmin
 */
@WebServlet("/admin/manageAdmin")
public class ManageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static AdminModel adminModel = new AdminModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
		if (admin.getId() != 1) { // controllo se è super-admin
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		
		try {
			// id del sotto-admin da eliminare
			adminModel.doDeleteAdminById(request.getParameter("id"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		LinkedList<AdminBean> listaAdmin = null;
		try {
			listaAdmin = (LinkedList<AdminBean>) adminModel.doRetrieveAllAdmins();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("listaAdmin", listaAdmin);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView/ManageAdmin.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBean admin = (AdminBean) request.getSession().getAttribute("admin");
		if (admin.getId() != 1) {
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminBean nuovo = new AdminBean(username, password);
		try {
			adminModel.doAddAdmin(nuovo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
