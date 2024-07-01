package controlUser;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CartControl;
import model.*;

import utilities.StringEscapeUtil;


/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/register")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static UserModel userModel = new UserModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartControl.cartSetup(request, response);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserView/RegisterView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartControl.cartSetup(request, response);
		
		String email = request.getParameter("email");
		String password = request.getParameter("pwd");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		Date ddn = Date.valueOf(request.getParameter("ddn"));
		String telefono = request.getParameter("phone");
		
		email = StringEscapeUtil.escapeHtml(email);
		nome = StringEscapeUtil.escapeHtml(nome);
		cognome = StringEscapeUtil.escapeHtml(cognome);
		telefono = StringEscapeUtil.escapeHtml(telefono);
		
		// Controlla che tutti i parametri obbligatori siano forniti
		if (isNullOrEmpty(email) || isNullOrEmpty(password) 
				|| isNullOrEmpty(nome) || isNullOrEmpty(cognome) || ddn == null || isNullOrEmpty(telefono)) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Campi mancanti");
			return;
		}
		
		// Verifica se l'utente è maggiorenne
        if (!isMaggiorenne(ddn)) {
        	response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Devi essere maggiorenne");
            return;
        }
		
        UserBean user = new UserBean(email, password, nome, cognome, ddn, telefono);
        String creationState;
        try {
        	userModel.doSaveUser(user);
        	creationState = "success";
        } catch (SQLException e) {
        	creationState = "failure";
        	e.printStackTrace();
        }
        	
        response.sendRedirect(request.getContextPath() + "/login?creationState=" + creationState);
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
	
	private static boolean isMaggiorenne(Date ddn) {
        if (ddn == null) {
            return false; // Se la data di nascita è null, considera l'utente non maggiorenne.
        }
        
        LocalDate birthDate = ddn.toLocalDate(); // Converte Date in LocalDate
        LocalDate currentDate = LocalDate.now(); // Ottiene la data corrente
        
        // Calcola la differenza in anni tra la data di nascita e la data corrente
        int age = Period.between(birthDate, currentDate).getYears();
        
        // Verifica se l'età è almeno 18 anni
        return age >= 18;
    }
	
	private static boolean isNullOrEmpty(String str) {
	    return str == null || str.trim().isEmpty();
	}

}
