package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/login")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LoginView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// Esempio di autenticazione (sostituisci con la tua logica reale)
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		
		//TODO: autenticazione
		if (email.equals("abc@gmail.com") && password.equals("abc")) {
		    // Autenticazione riuscita
		    session.setAttribute("email", email);
		    
		    session.setAttribute("user_id", 1);
		    response.sendRedirect("product"); 
		} else {
		    
		    response.sendRedirect("login?error=1"); 
		}
	}

}
