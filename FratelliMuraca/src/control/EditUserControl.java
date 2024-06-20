package control;
import  model.*;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Calendar;
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

	private static UserModel userModel = new UserModelDS();
	
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
		response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "Metodo GET non previsto");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		HttpSession session = request.getSession();
		UserBean userVecchio = (UserBean)session.getAttribute("user");
		if (userVecchio == null) {
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Non sei loggato");
			return;
		}
		
		int id = userVecchio.getId();
		String email = request.getParameter("email");
		String nome = request.getParameter("name");
		String surname = request.getParameter("surname");
		String passwordNuova = request.getParameter("password");
		String passwordVecchia = userVecchio.getPassword();
		Date ddn = Date.valueOf(request.getParameter("birthdate"));
		String phone = request.getParameter("phone");
		
		if (isNullOrEmpty(email) || isNullOrEmpty(nome) || isNullOrEmpty(surname) || 
			    isNullOrEmpty(passwordNuova) || isNullOrEmpty(passwordVecchia) || 
			    isNullOrEmpty(phone) || id < 1 || isUnderage(ddn)) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Bad request, non tutti i campi sono stati compilati");
		    return;
		}
		
		
		if (passwordNuova.equals(passwordVecchia)) {
			UserBean nuovoUser = new UserBean(id, email, passwordVecchia, nome, surname, ddn, phone);
			
			try {
				userModel.doChangeUserNoPwd(nuovoUser);
				session.setAttribute("user", nuovoUser);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			UserBean nuovoUser = new UserBean(id, email, passwordNuova, nome, surname, ddn, phone);
			try {
				userModel.doChangeUser(userVecchio);
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
		
		private static boolean isNullOrEmpty(String str) {
		    return str == null || str.trim().isEmpty();
		}
		
		private static boolean isUnderage(Date birthdate) {
		    Calendar current = Calendar.getInstance(); // Ottiene la data e ora correnti
		    Calendar birthCal = Calendar.getInstance();
		    birthCal.setTime(birthdate); // Imposta la data di nascita
		    
		    int age = current.get(Calendar.YEAR) - birthCal.get(Calendar.YEAR);
		    
		    // Regola l'età se il compleanno non è ancora arrivato quest'anno
		    if (current.get(Calendar.DAY_OF_YEAR) < birthCal.get(Calendar.DAY_OF_YEAR)) {
		        age--;
		    }
		    
		    return age < 18;
		}
		
}
