package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		boolean emailExists = false;
		
		
		LinkedList<String> emails = new LinkedList<>();
		
		try {
			emails = (LinkedList<String>) model.doRetrieveAllEmail();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		for(String userEmail : emails) {
			if(email.startsWith(userEmail)) {
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
		doGet(request, response);
	}

}
