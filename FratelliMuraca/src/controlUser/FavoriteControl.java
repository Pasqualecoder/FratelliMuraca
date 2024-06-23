package controlUser;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.LinkedList;
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
	static ProductModel productModel = new ProductModelDS();
       
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
		
		
		UserBean user = (UserBean) request.getSession().getAttribute("user");		
		
		String action = request.getParameter("action");
		if(action == null) {
			action = "";
		}
		String id = null;

		try {
			int userId = user.getId();
			int requestId = Integer.parseInt(request.getParameter("id"));
			FavoriteBean favorite = favoriteModel.doRetrieveFavorite(userId, requestId);
			int favoriteId = favorite.getId();
			id = String.valueOf(favoriteId);
		} catch (SQLException | NumberFormatException e ) {
			e.printStackTrace();
		}
		
		
		if(id == null) {
			id = "";
		}
		
		if(action.equals("removeFavorite")) {
			int id_favorite = Integer.parseInt(id);
			try {
				favoriteModel.doDeleteFavorite(id_favorite);
				response.sendRedirect(request.getContextPath() + "/favorites");
				return;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				LinkedList<FavoriteBean> preferiti = favoriteModel.doRetrieveAllFavorites(user.getId());
				LinkedList<ProductBean> prodottiPreferiti = new LinkedList<>();
				for(FavoriteBean pref : preferiti) {
					int prodId = pref.getProductId();
					ProductBean prod = productModel.doRetrieveProductByKey(prodId);
					prodottiPreferiti.add(prod);
				}
				request.removeAttribute("prodotti_preferiti");
				request.setAttribute("prodotti_preferiti", prodottiPreferiti);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserView/FavoriteView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserBean user = (UserBean) request.getSession().getAttribute("user");	
		int prod_id = Integer.parseInt(request.getParameter("id_prodotto"));
		FavoriteBean favorite = new FavoriteBean(user.getId(), prod_id);
		
		try {
			favoriteModel.doAddFavorite(favorite);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}
	
}
