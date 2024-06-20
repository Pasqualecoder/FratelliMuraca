package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserModel;
import model.UserModelDS;

/**
 * Servlet implementation class UserManagerView
 */
@WebServlet("/admin/gestioneUtenti")
public class UserManagerView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserModel userModel = new UserModelDS();;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagerView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setAttribute("users", userModel.doRetrieveAllUsers());
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/gestioneUtenti.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
