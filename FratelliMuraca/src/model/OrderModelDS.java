package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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


	public synchronized void doSaveOrder(OrderBean order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		byte[] cartSer = null;
		int userId = order.getId_cliente();
		String detailsJson = order.getDetails();
		CartBean cart = order.getProdotti();
		
		try {
			cartSer = cart.serialize();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String insertSQL = "INSERT INTO " + TABLE_NAME 
				+ " (id_cliente, details, prodotti) "
				+ "VALUES (?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, userId);
			preparedStatement.setString(2, detailsJson);
			preparedStatement.setBytes(3, cartSer);
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

		String selectSQL = "SELECT * " + "FROM ordini, utenti " + 
				"WHERE id_cliente = utenti.id";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				// campi ordine
				int id = rs.getInt("ordini.id");
				int idCliente = rs.getInt("id_cliente");
				String details = rs.getString("details");
				CartBean prodotti = CartBean.deserialize(rs.getBytes("prodotti"));
				StatoOrdine stato = StatoOrdine.fromString(rs.getString("stato"));
				
				// campi utente
				int idUser = rs.getInt("utenti.id");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				Date ddn = rs.getDate("ddn");
				String phone = rs.getString("phone");
				
				UserBean user = new UserBean(idUser, email, password, nome, cognome, ddn, phone);
				OrderBean ordine = new OrderBean(id, idCliente, user, details, prodotti, stato);
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

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_cliente = ? " + 
				"ORDER BY id" + " DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, userOwner);
			
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				String details = rs.getString("details");
				CartBean prodotti = CartBean.deserialize(rs.getBytes("prodotti"));
				StatoOrdine stato = StatoOrdine.fromString(rs.getString("stato"));

				OrderBean ordine = new OrderBean(id, idCliente, user, details, prodotti, stato);
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
