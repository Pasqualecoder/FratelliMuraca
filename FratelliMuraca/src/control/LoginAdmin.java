package control;
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

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/admin")
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static UserModel userModel = new UserModelDS();
	static AdminModel adminModel = new AdminModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = encryptPassword(request.getParameter("password"));
		
		
		
		try {
			AdminBean admin = adminModel.doRetrieveAdmin(username, password);
			if(admin != null) {
				
				session.setAttribute("admin", admin);
				
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/dashboard");
				dispatcher.forward(request, response); 
			}
			else {
			    
			    response.sendRedirect("login?error=1"); 
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
