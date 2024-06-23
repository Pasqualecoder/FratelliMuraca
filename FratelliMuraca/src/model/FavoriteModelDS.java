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

public class FavoriteModelDS implements FavoriteModel {
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

	private static final String TABLE_NAME = "preferiti";

	

	@Override
	public synchronized void doAddFavorite(FavoriteBean favorite) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = ds.getConnection();

	        String insertSQL = "INSERT INTO " + TABLE_NAME + " (id_cliente, id_prodotto) VALUES (?, ?)";
	        preparedStatement = connection.prepareStatement(insertSQL);
	        preparedStatement.setInt(1, favorite.getUserId());
	        preparedStatement.setInt(2, favorite.getProductId());

	        preparedStatement.executeUpdate();
	    }
	    finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }
	}

	@Override
	public synchronized LinkedList<FavoriteBean> doRetrieveAllFavorites(int userId) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		LinkedList<FavoriteBean> preferiti = new LinkedList<FavoriteBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME +
				" WHERE id_cliente = ?";
		
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, userId);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				int idProdotto = rs.getInt("id_prodotto");
				
				FavoriteBean preferito = new FavoriteBean(id, idCliente, idProdotto);
				
				preferiti.add(preferito);
			}
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
		return preferiti;
		
	}

	@Override
	public synchronized FavoriteBean doRetrieveFavorite(int idFav) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		FavoriteBean preferito = null;

		String selectSQL = "SELECT * FROM " + TABLE_NAME +
				" WHERE id = ?";
		
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idFav);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
			
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				int idProdotto = rs.getInt("id_prodotto");
				
				
				preferito = new FavoriteBean(id, idCliente, idProdotto);
			}
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
		return preferito;
		
	}

	@Override
	public synchronized void doDeleteFavorite(int idFav) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = ds.getConnection();

	        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE id = ?";
	        preparedStatement = connection.prepareStatement(deleteSQL);
	        preparedStatement.setInt(1, idFav);

	        preparedStatement.executeUpdate();
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }
	}
	
	@Override
	public synchronized FavoriteBean doRetrieveFavorite(int userId, int productId) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet rs = null;

	    FavoriteBean preferito = null;

	    String selectSQL = "SELECT id, id_cliente, id_prodotto FROM " + TABLE_NAME +
	                       " WHERE id_prodotto = ? AND id_cliente = ?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setInt(1, productId);
	        preparedStatement.setInt(2, userId);

	        rs = preparedStatement.executeQuery();

	        if (rs.next()) {
	            int id = rs.getInt("id");
	            int idCliente = rs.getInt("id_cliente");
	            int idProdotto = rs.getInt("id_prodotto");

	            preferito = new FavoriteBean(id, idCliente, idProdotto);
	        }
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        try {
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return preferito;
	}
}
