package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CartBean;

/**
 * Servlet implementation class HomeView
 */
@WebServlet("/home")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartControl.cartSetup(request, response);
		
		String requestedPage = request.getParameter("page");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(setRedirect(requestedPage));
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private String setRedirect(String requestedPage) {
		String redirect = null;
		if (requestedPage == null || requestedPage.equals("home")) {
			redirect = "/home.jsp";
		}
		else if (requestedPage.equals("product")) { // preferibilmente non utilizzabile
			redirect = "/product"; // reindirizzo alla servlet
		}
		else if (requestedPage.equals("about")) {
			redirect = "/about.jsp";
		}
		else if (requestedPage.equals("contacts")) {
			redirect = "/contacts.jsp";
		}
		else {
			redirect = "/home.jsp";
		}
		return redirect;
	}
	
}
