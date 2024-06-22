package controlAdmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserBean;
import model.UserModel;
import model.UserModelDS;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

/**
 * Servlet implementation class modifyUser
 */
@WebServlet("/modifyUser")
public class ModifyUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static UserModel userModel = new UserModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyUser() {
        super();    
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "metodo get non supportato");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		Date DDN = Date.valueOf(request.getParameter("DDN"));
		String telefono = request.getParameter("telefono");
		
		UserBean user = new UserBean(email, password, nome, cognome, DDN, telefono);

		try {
			userModel.doChangeUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		response.sendRedirect(request.getContextPath() + "/admin?action=users");
		return;
	}
}
