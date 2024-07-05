package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class ProductFilter
 */
@WebServlet("/productFilter")
public class ProductFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProductModel productModel = new ProductModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sort = request.getParameter("sort");
        String priceMin = request.getParameter("priceMin");
        String priceMax = request.getParameter("priceMax");
        String productType = request.getParameter("productType");
		
        LinkedList<ProductBean> prodotti = null;
        StringBuilder productsJSON = new StringBuilder("[");
        
        try { 
        	prodotti = (LinkedList)productModel.doRetrieveAllProductsFiltered(sort, priceMin, priceMax, productType);
        }
        catch(Exception e){
        	e.printStackTrace();
        }
        
        if (prodotti != null) {
        	for(int i = 0; i < prodotti.size(); i++) {
        		productsJSON.append(prodotti.get(i).toJSONNoDesc());
        		if( i != prodotti.size() - 1) {
        			productsJSON.append(",");
        		}
        	}        	
        }
        
        
        
        productsJSON.append("]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(productsJSON.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
