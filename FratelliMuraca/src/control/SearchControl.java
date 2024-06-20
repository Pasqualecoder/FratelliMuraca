package control;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchControl
 */
@WebServlet("/search")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static ProductModel productModel = new ProductModelDS();
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String query = request.getParameter("query");
	    
	    List<ProductBean> productsSearched = searchProducts(query.toLowerCase());

	    response.setContentType("application/json");
	    PrintWriter out = response.getWriter();

	    StringBuilder jsonOutput = new StringBuilder();
	    jsonOutput.append("[");

	    // Utilizzo di un for-each per iterare sulla lista dei prodotti
	    for (ProductBean product : productsSearched) {
	        jsonOutput.append(product.toJSON()).append(",");
	    }

	    // Rimuovere l'ultima virgola se ci sono elementi
	    if (!productsSearched.isEmpty()) {
	        jsonOutput.setLength(jsonOutput.length() - 1);
	    }

	    jsonOutput.append("]");

	    // Scrivere l'intera stringa JSON sull'output alla fine
	    out.print(jsonOutput.toString());
	    out.flush();
	}


	private List<ProductBean> searchProducts(String query) {
        List<ProductBean> productsName = new LinkedList<ProductBean>();
        try {
            for (ProductBean prodotto : new LinkedList<>(productModel.doRetrieveAllProducts(null))) {
                if (prodotto.getNome().toLowerCase().startsWith(query)) {
                	prodotto.setDescrizione("");
                	prodotto.setIngredienti("");
                    productsName.add(prodotto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productsName;
    }

}
