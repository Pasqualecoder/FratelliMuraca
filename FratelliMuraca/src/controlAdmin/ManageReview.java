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

import model.ReviewBean;
import model.ReviewModel;
import model.ReviewModelDS;

/**
 * Servlet implementation class ManageReview
 */
@WebServlet("/admin/manageReview")
public class ManageReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ReviewModel reviewModel = new ReviewModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageReview() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("delete");
		if (idStr != null && !idStr.isEmpty()) {
			try {
				reviewModel.doDeleteReview(idStr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		LinkedList<ReviewBean> listaReview = null;
		try {
			listaReview = (LinkedList<ReviewBean>) reviewModel.doRetriveAllReviews();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("listaReview", listaReview);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView/ManageReview.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
