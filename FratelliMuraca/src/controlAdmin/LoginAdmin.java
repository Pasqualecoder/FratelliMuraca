package controlAdmin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AdminBean;
import model.AdminModel;
import model.AdminModelDS;

/**
 * Servlet implementation class LoginAdmin
 */
@WebServlet("/admin/login")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminModel adminModel = new AdminModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView/LoginView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			AdminBean admin = adminModel.doRetrieveAdmin(username, password);
			if (admin == null) {
				throw new SQLException();
			}
			session.setAttribute("admin", admin);
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_FORBIDDEN, "Errore autenticazione");
			return;
		}
	
		response.sendRedirect(request.getContextPath() + "/admin");
	}

}
