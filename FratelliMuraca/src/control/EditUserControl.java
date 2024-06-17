package control;
import  model.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditUserControl
 */
@WebServlet("/modificaDati")
public class EditUserControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UserModelDS model = new UserModelDS();
		UserBean userVecchio = (UserBean)session.getAttribute("user");
		String passwordNuova = (String)request.getParameter("password");
		String passwordVecchia = userVecchio.getPassword();
		Date ddn = Date.valueOf(request.getParameter("birthdate"));
		
		if (passwordNuova.equals(passwordVecchia)) {
			UserBean nuovoUser = new UserBean(userVecchio.getId(), request.getParameter("email"), passwordVecchia, request.getParameter("name"), request.getParameter("surname"), ddn,request.getParameter("phone"));
			
			try {
				model.doChangeUserNoPwd(nuovoUser);
				session.setAttribute("user", nuovoUser);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			UserBean nuovoUser = new UserBean(userVecchio.getId(), request.getParameter("email"), passwordNuova, request.getParameter("nome"), request.getParameter("cognome"), ddn,request.getParameter("phone"));
			try {
				model.doChangeUser(userVecchio);
				session.setAttribute("user", nuovoUser);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ProductView.jsp");
			dispatcher.forward(request, response);
		
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
