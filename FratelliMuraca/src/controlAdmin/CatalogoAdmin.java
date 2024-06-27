package controlAdmin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductModel;
import model.ProductModelDS;

/**
 * Servlet implementation class CatalogoAdmin
 */
@WebServlet("/admin/catalogo")
public class CatalogoAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ProductModel productModel = new ProductModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CatalogoAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Collection<ProductBean> prodotti = productModel.doRetrieveAllProducts(null);
			request.setAttribute("prodotti", prodotti);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView" + "/CatalogoView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
