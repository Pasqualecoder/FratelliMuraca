package controlAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
import utilities.StringEscapeUtil;

/**
 * Servlet implementation class ModificaProdotto
 */
@WebServlet("/admin/modificaProdotto")
public class ModificaProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProductModel productModel = new ProductModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaProdotto() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBean prodotto = null;
		
		// se questo parametro viene riempito allora si vuole modificare un prodotto esistente
		String idString = request.getParameter("id");
		int id;
		if (idString != null) {
			id = Integer.parseInt(idString);
			try {
				prodotto = productModel.doRetrieveProductByKey(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// altrimenti si vuole creare
		
		request.setAttribute("prodotto", prodotto);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView" + "/ModificaProdotto.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// se si vuole cancellare l'elemento
		if (Boolean.parseBoolean(request.getParameter("delete"))) {
			try {
				productModel.doDelete(request.getParameter("id"));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// modifica o cancellazione
		else {
			String strId = request.getParameter("id");
			String nome = request.getParameter("nome");
			String descrizione  = request.getParameter("descrizione");
			float prezzo = Float.parseFloat(request.getParameter("prezzo"));
			int ivaPerc = Integer.parseInt(request.getParameter("iva"));
			int scontoPerc = Integer.parseInt(request.getParameter("sconto"));
			int quantita = Integer.parseInt(request.getParameter("quantita"));
			String dimensione = request.getParameter("dimensione");
			boolean tipo = Boolean.getBoolean(request.getParameter("tipo"));
			ProductCategorie categoria = ProductCategorie.fromString(request.getParameter("categoria"));
			String anno = request.getParameter("anno");
			String ingredienti = request.getParameter("ingredienti");
			
			strId = StringEscapeUtil.escapeHtml(strId);
			nome = StringEscapeUtil.escapeHtml(nome);
			descrizione = StringEscapeUtil.escapeHtml(descrizione);
			dimensione = StringEscapeUtil.escapeHtml(dimensione);
			anno = StringEscapeUtil.escapeHtml(anno);
			ingredienti = StringEscapeUtil.escapeHtml(ingredienti);
			
			
			ProductBean prodotto = null;
			if (strId != null) { // vogliamo modificare
				int id = Integer.parseInt(strId);
				prodotto = new ProductBean(id, nome, descrizione, prezzo, ivaPerc, scontoPerc, quantita, dimensione, tipo, categoria, anno, ingredienti, null);
				try {
					productModel.doUpdateProduct(prodotto);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			else { // vogliamo creare
				prodotto = new ProductBean(nome, descrizione, prezzo, ivaPerc, scontoPerc, quantita, dimensione, tipo, categoria, anno, ingredienti, null);
				try {
					productModel.doSaveProduct(prodotto);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/admin/catalogo");
	}

}
