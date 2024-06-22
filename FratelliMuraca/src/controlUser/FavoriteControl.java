package controlUser;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.Map;

import javax.management.RuntimeErrorException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CartControl;
import model.*;

import java.io.*;

/**
 * Servlet implementation class Order
 */
@WebServlet("/favorites")
public class FavoriteControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static FavoriteModel favoriteModel = new FavoriteModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartControl.cartSetup(request, response);

		// prendere l'id dell'utente
		UserBean user = (UserBean) request.getSession().getAttribute("user");			

		try {
			request.removeAttribute("preferiti");
			request.setAttribute("preferiti, favoriteModel.doRetrieveAllFavorites(user.getId()));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserView/FavoriteView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
