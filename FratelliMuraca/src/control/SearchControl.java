package control;
import model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

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
       
static boolean isDataSource = true;
	
	static ProductModel model;
	
	static {
		if (isDataSource) {
			model = new ProductModelDS();
		} else {
			// model = new ProductModelDM();
		}
	}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        
        List<String> products = searchProducts(query.toLowerCase());

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("[");
        for (int i = 0; i < products.size(); i++) {
            out.print("\"" + products.get(i) + "\"");
            if (i < products.size() - 1) {
                out.print(",");
            }
        }
        out.print("]");
        out.flush();
    }

    
	private List<String> searchProducts(String query) {
    	List<String> productsName = new LinkedList<>(); 
    	try {
    		for(ProductBean prodotto : new LinkedList<>(model.doRetrieveAll(""))) {
    			if(prodotto.getNome().toLowerCase().startsWith(query)) {
    				productsName.add(prodotto.getNome().toLowerCase());
    			}
            }
            
    	}
    	catch (Exception e) {
    		
    	}
    	System.out.println(productsName);
    	return productsName;
        
    }

}
