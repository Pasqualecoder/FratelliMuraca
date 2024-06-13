package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Set;

import model.UserModel;
import model.UserModelDS;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VerifyEmail
 */
@WebServlet("/verify")
public class VerifyEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static UserModel model = new UserModelDS();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		boolean emailExists = false;
		
		Set<String> emails = null;
		try {
			emails = model.doRetrieveAllEmail();
			System.out.println(emails);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
		}
		
		
		for(String user_email : emails) {
			if(user_email.equalsIgnoreCase(email)) {
				emailExists = true;
	            break;
			}
		}
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // Prepare JSON response
        PrintWriter out = response.getWriter();
        out.println("{ \"exists\": " + emailExists + " }");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
