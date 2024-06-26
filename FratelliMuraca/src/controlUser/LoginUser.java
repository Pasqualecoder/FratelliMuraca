package controlUser;
import model.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CartControl;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/login")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UserModel userModel = new UserModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartControl.cartSetup(request, response);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserView/LoginView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String password = encryptPassword(request.getParameter("pwd"));
		
		try {
			UserBean user = userModel.doRetrieveUser(email, password);
			if(user != null && user.isDisabled() == false) {
				session.setAttribute("user", user);
				response.sendRedirect(request.getContextPath() + "/account");
			}
			else {
				request.setAttribute("error", true);
				doGet(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	private static String encryptPassword(String psw) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(psw.getBytes());

            // Convert byte array to hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

}
