package model;

import java.sql.SQLException;
import java.util.Collection;

public interface OrderModel {

	/**
	 * saves a new order
	 * @param userId
	 * @param detailsJson
	 * @param cart
	 * @throws SQLException
	 */
	public void doSaveOrder(OrderBean order) throws SQLException;
	
	/**
	 * retreives all orders made by a user
	 * @param user
	 * @return 
	 * @throws SQLException
	 */
	public Collection<OrderBean> doRetrieveOrders(UserBean user) throws SQLException;
	
	/**
	 * retrives a single order given the id
	 * @param idOrdine
	 * @return
	 * @throws SQLException
	 */
	public OrderBean doRetrieveOrder(int idOrdine) throws SQLException;
	
	/**
	 * retrives a single order given the id and the owner (check incrociato)
	 * @param idOrdine
	 * @return
	 * @throws SQLException
	 */
	public OrderBean doRetrieveOrder(int idOrdine, int idCliente) throws SQLException;
	
	
	/**
	 * admin only: retrives all orders with the field user filled
	 * @return
	 * @throws SQLException
	 */
	public Collection<OrderBean> doRetrieveAllOrders() throws SQLException;
}
