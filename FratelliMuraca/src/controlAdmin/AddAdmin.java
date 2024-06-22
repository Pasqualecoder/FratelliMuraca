package controlAdmin;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AdminModel;
import model.AdminModelDS;

/**
 * Servlet implementation class ModifyAdmin
 */
@WebServlet("/admin/addAdmin")
public class AddAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static AdminModel adminModel = new AdminModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			adminModel.doAddAdminByNameAndPwd(username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/admin?action=modificaAdmin");

		
	}

}
