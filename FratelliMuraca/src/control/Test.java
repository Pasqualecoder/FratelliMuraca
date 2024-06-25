package control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.*;

/**
 * Servlet implementation class Main
 */
@WebServlet("/test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DirectDb db = new DirectDb();
		try {
			db.doIt();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		// RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("home");
		// dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}


class DirectDb {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/fratellimuracadb");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String TABLE_NAME = "prodotti";

	public synchronized void doIt() throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE " + TABLE_NAME + " SET descrizione = ? WHERE id = 1"; 
		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, "L'olio extra vergine di oliva  � un olio di alta qualit� ottenuto dalla spremitura a freddo delle olive, senza l'uso di sostanze chimiche o processi industriali. Questo processo conserva tutte le propriet� organolettiche e nutrizionali dell'oliva, conferendo all'olio un gusto ricco e un profilo nutrizionale eccezionale." + '\r' + '\n' + 
					"- 100% Naturale: L'olio EVO � puro e non raffinato, mantenendo intatte tutte le sostanze nutritive e antiossidanti." + '\r' + '\n' + 
					"- Acidit� Bassa: L'acidit� dell'olio extra vergine di oliva � inferiore allo 0,8%, un indicatore di qualit� e freschezza." + '\r' + '\n' + 
					"- Gusto e Aroma: Possiede un sapore fruttato e leggermente piccante, con note di erba fresca, mandorla e a volte un retrogusto leggermente amaro, che varia a seconda della variet� di olive utilizzate e della regione di produzione." + '\r' + '\n');

			preparedStatement.executeUpdate();
			connection.commit();
			
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
}
