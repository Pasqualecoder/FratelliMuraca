package model;

import java.sql.SQLException;
import java.util.Collection;

public interface OrderModel {

	/**
	 * TODO
	 * @param userId
	 * @param cart
	 * @throws SQLException
	 */
	public void doSaveOrder(int userId, CartBean cart) throws SQLException;
	
	/**
	 * retreives all orders made by a user
	 * @param user
	 * @return 
	 * @throws SQLException
	 */
	public Collection<OrderBean> doRetrieveOrders(UserBean user) throws SQLException;
	
	
	/**
	 * admin only: retrives all orders sorted by the latest
	 * @return
	 * @throws SQLException
	 */
	public Collection<OrderBean> doRetrieveAllOrders() throws SQLException;
}
