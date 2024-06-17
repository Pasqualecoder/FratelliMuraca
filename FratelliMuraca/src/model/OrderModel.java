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
	 * admin only: retrives all orders with the field user filled
	 * @return
	 * @throws SQLException
	 */
	public Collection<OrderBean> doRetrieveAllOrders() throws SQLException;
}