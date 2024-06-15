package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderModelDS implements OrderModel {
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/fratellimuracadb");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String TABLE_NAME = "ordini";


	public synchronized void doSaveOrder(int userId, CartBean cart) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		byte[] cartSer = null;
		
		try {
			cartSer = cart.serialize();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String insertSQL = "INSERT INTO " + TABLE_NAME 
				+ " (id_cliente, prodotti) "
				+ "VALUES (?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, userId);
			preparedStatement.setBytes(2, cartSer);
			preparedStatement.executeUpdate();
			//connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}
	
	
	public synchronized Collection<OrderBean> doRetrieveAllOrders() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> ordini = new LinkedList<OrderBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + "ORDER BY " + "datetime" + "DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				CartBean prodotti = CartBean.deserialize(rs.getBytes("prodotti"));
				Timestamp datetime = rs.getTimestamp("datetime");
				StatoOrdine stato = StatoOrdine.fromString(rs.getString("stato"));

				OrderBean ordine = new OrderBean(id, idCliente, prodotti, datetime, stato);
				ordini.add(ordine);
			}

		} catch (IOException | ClassNotFoundException e){
			e.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return ordini;
	}
	
	
	@Override
	public synchronized Collection<OrderBean> doRetrieveOrders(UserBean user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> ordini = new LinkedList<OrderBean>();
		int userOwner = user.getId();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_cliente = ? ORDER BY " + "datetime " + "DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, userOwner);
			
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				CartBean prodotti = CartBean.deserialize(rs.getBytes("prodotti"));
				Timestamp datetime = rs.getTimestamp("datetime");
				StatoOrdine stato = StatoOrdine.fromString(rs.getString("stato"));

				OrderBean ordine = new OrderBean(id, idCliente, prodotti, datetime, stato);
				ordini.add(ordine);
			}

		} catch (IOException | ClassNotFoundException e){
			e.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return ordini;
	}
	
	
}
