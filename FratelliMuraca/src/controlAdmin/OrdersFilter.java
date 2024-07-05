package controlAdmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.OrderBean;
import model.OrderModel;
import model.OrderModelDS;
import model.ProductBean;

/**
 * Servlet implementation class OrdersFilter
 */
@WebServlet("/admin/ordersFilter")
public class OrdersFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static OrderModel orderModel = new OrderModelDS();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersFilter() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LinkedList<OrderBean> listaOrdini = null;;
		try {
			listaOrdini = (LinkedList<OrderBean>) orderModel.doRetrieveAllOrders();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		StringBuilder ordersJSON = new StringBuilder("[");
		
		if (listaOrdini != null) {
			OrderBean ordine = null;
			int size = listaOrdini.size();
		
			for (int i = 0; i < size; i++) {
				ordine = listaOrdini.get(i);
				ordersJSON.append(orderToJSON(ordine));
				
				if (i < size-1) {
					ordersJSON.append(",");
				}
			}
		}
		
		ordersJSON.append("]");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println(ordersJSON.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private String orderToJSON(OrderBean ordine) {
		StringBuilder json = new StringBuilder();
		json.append("{");
		
		json.append("\"id\":").append(ordine.getId()).append(",");
		json.append("\"id_cliente\":").append(ordine.getId_cliente()).append(",");
		json.append("\"details\":").append(ordine.getDetails()).append(",");
		
		
		json.append("\"prodotti\":[");
		
		Map<ProductBean, Integer> mappa = ordine.getProdotti().getProducts();
		int mappaSize = mappa.entrySet().size();
		int i = 0;
		
		for (Map.Entry<ProductBean, Integer> entry : mappa.entrySet()) {
			ProductBean prodotto = entry.getKey();
			int quantita = entry.getValue();
			
			json.append("{");
			json.append("\"idProdotto\":").append(prodotto.getId()).append(",");
			json.append("\"nome\":\"").append(prodotto.getNome()).append("\",");
			json.append("\"quantita\":").append(quantita);

			json.append("}");

			if (i < mappaSize-1) {
				json.append(",");
			}
			i++;
		}
		
		json.append("]");
		json.append("}");
		return json.toString();
	}
	
}
