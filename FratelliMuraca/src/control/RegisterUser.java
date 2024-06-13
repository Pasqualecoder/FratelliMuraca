package control;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Cart;
import model.ProductModel;
import model.ProductModelDS;
import model.UserBean;

/**
 * Servlet implementation class LoginUser
 */
@WebServlet("/register")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// ProductModelDS usa il DataSource
	// ProductModelDM usa il DriverManager	
	static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			// model = new ProductModelDM();
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/RegisterView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String redirectedPage = "/loginPage.jsp";

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		Date ddn = Date.valueOf(request.getParameter("ddn"));
		String telefono = request.getParameter("phone");
		
		// Controlla che tutti i parametri obbligatori siano forniti
		if (email == null || email.isEmpty() ||
				password == null || password.isEmpty() ||
				nome == null || nome.isEmpty() ||
				cognome == null || cognome.isEmpty() || ddn == null) {
			request.setAttribute("errorMessage", "Tutti i campi obbligatori devono essere compilati.");
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
		
		// Verifica se l'utente è maggiorenne
        if (!isMaggiorenne(ddn)) {
            request.setAttribute("errorMessage", "Devi essere maggiorenne per registrarti.");
            request.getRequestDispatcher("/error").forward(request, response);
            return;
        }
		
        password = encryptPassword(password);

        
        UserBean user = new UserBean(email, password, nome, cognome, ddn, telefono);
        try {
        	// model.doSaveUser(user);
        	// Reindirizza alla pagina del profilo utente in caso di successo
            request.setAttribute("user", user);
            request.getRequestDispatcher("/userProfilePage.jsp").forward(request, response);
        } catch (Exception e) {
            // Gestione dell'eccezione in caso di errore durante il salvataggio
            request.setAttribute("errorMessage", "Si è verificato un errore durante la registrazione. Riprova più tardi.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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
	

}
