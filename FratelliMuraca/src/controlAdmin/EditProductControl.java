package controlAdmin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;

/**
 * Servlet implementation class EditProductControl
 */
@WebServlet("/editProduct")
public class EditProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProductControl() {
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
		
		
		ProductModel productModel = new ProductModelDS();
		
		int id = Integer.parseInt(request.getParameter("id_prodotto"));
		String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        float prezzo = Float.parseFloat(request.getParameter("prezzo"));
        int sconto = Integer.parseInt(request.getParameter("sconto"));
        int iva = Integer.parseInt(request.getParameter("iva"));
        int quantita = Integer.parseInt(request.getParameter("quantita"));
        String dimensione = request.getParameter("dimensione");
        boolean tipo = request.getParameter("tipo") != null;
        ProductCategorie categoria = ProductCategorie.fromString(request.getParameter("categoria"));
        String anno = request.getParameter("anno");
        String ingredienti = request.getParameter("ingredienti");
		
		ProductBean nuovoProdotto = new ProductBean(id, nome, descrizione, prezzo, iva, sconto, quantita, dimensione, tipo, categoria, anno, ingredienti, null);		
		
		// TODO: gestione immagini @PASKU
		
		try {
			productModel.doUpdateProduct(nuovoProdotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
