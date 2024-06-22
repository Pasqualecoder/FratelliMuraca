package controlUser;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.DetailsControl;
import model.*;


/**
 * Servlet implementation class AddReview
 */
@WebServlet("/addReview")
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static ProductModel productModel = new ProductModelDS();
	private static ReviewModel reviewModel = new ReviewModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Metodo GET non permesso");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBean prodotto = null;
		UserBean user = (UserBean) request.getSession().getAttribute("user"); // gia filtrato
		
		int idProdotto = 0;
		int rating = 0;
		String titolo = null;
		String content = null;
		
		// leggo i parametri della richiesta e sanifico
		try {
			idProdotto = Integer.parseInt(request.getParameter("idProdotto"));
			rating = Integer.parseInt(request.getParameter("rating"));
			if (idProdotto < 1 || rating < 1 || rating > 5) throw new NumberFormatException("numeri oltre il range");
			titolo = request.getParameter("title");
			content = request.getParameter("content");
			if (titolo == null || titolo.isEmpty() || content == null || content.isEmpty()) throw new NumberFormatException("titolo o contenuto non validi");
			if (titolo.length() > 100 || content.length() > 800) throw new NumberFormatException("lunghezza campi non valida");
		} catch (NumberFormatException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "bad request");
			return;
		}
		
		
		// controllo se l'id inserito corrisponde a un prodotto nel db
		try {
			prodotto = productModel.doRetrieveProductByKey(idProdotto);
			if (prodotto == null) throw new SQLException("prodotto non esistente");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		String status = "failure"; // like my life
		if (DetailsControl.checkBought(user, prodotto)) {
			ReviewBean review = new ReviewBean(titolo, content, rating, user, prodotto);
			try {
				reviewModel.doSaveReview(review);
				status = "success";
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "non sei autorizzato scrivere la review per questo prodotto");
			return;
		}
		
		response.sendRedirect(request.getContextPath() + "/details?id=" + prodotto.getId() + "&status=" + status);
	}
	

}
