package controlAdmin;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserBean;
import model.UserModel;
import model.UserModelDS;

/**
 * Servlet implementation class ManageUser
 */
@WebServlet("/admin/manageUser")
public class ManageUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static UserModel userModel = new UserModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageUser() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("delete");
		if (idStr != null) {
			try {
				userModel.doDeleteUserById(idStr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		LinkedList<UserBean> listaUtenti = null;
		try {
			listaUtenti = (LinkedList<UserBean>) userModel.doRetrieveAllUsers();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("listaUtenti", listaUtenti);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView/ManageUsers.jsp");
		dispatcher.forward(request, response);
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
			userModel.doSaveUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		doGet(request, response);
	}

}
