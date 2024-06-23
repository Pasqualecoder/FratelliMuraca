package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ReviewModelDS implements ReviewModel {
	
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

	private static final String TABLE_NAME = "recensioni";
	
	
	@Override
	public void doSaveReview(ReviewBean reviewBean) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME + "(titolo, content, rating, date, id_utente, id_prodotto)" + 
				"VALUES (?, ?, ?, NOW(), ?, ?);";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1, reviewBean.getTitolo());
			preparedStatement.setString(2, reviewBean.getContent());
			preparedStatement.setInt(3, reviewBean.getRating());
			preparedStatement.setInt(4, reviewBean.getUser().getId());
			preparedStatement.setInt(5, reviewBean.getProduct().getId());
			
			preparedStatement.executeUpdate();

			connection.commit();
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

	@Override
	public void doDeleteReview(int idReview) throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non è ancora implementata.");
	}

	@Override
	public void doDeleteReview(ReviewBean reviewBean) throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non è ancora implementata.");
	}

	@Override
	public Collection<ReviewBean> doRetriveReviewsByProd(int idProdotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		LinkedList<ReviewBean> recensioni = new LinkedList<ReviewBean>();
		
		String insertSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id_prodotto = ?;";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, idProdotto);
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int idRec = rs.getInt("id");
				String titolo = rs.getString("titolo");
				String content = rs.getString("content");
				int rating = rs.getInt("rating");
				Date date = rs.getDate("date");
				int idUser = rs.getInt("id_utente");
				int idProd = rs.getInt("id_prodotto");
				
				UserBean userBean = (new UserModelDS()).doRetrieveUserByKey(idUser);
				ProductBean prodottoBean = (new ProductModelDS()).doRetrieveProductByKey(idProd);
				
				ReviewBean review = new ReviewBean(idRec, titolo, content, rating, date, userBean, prodottoBean);
				recensioni.add(review);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return recensioni;
	}

	@Override
	public Collection<ReviewBean> doRetriveReviewsByUser(int idUser) throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non è ancora implementata.");
	}

	@Override
	public Collection<ReviewBean> doRetriveAllReviews() throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non è ancora implementata.");
	}
	
	public ReviewBean doRetrieveReview(int userId, int productId) throws SQLException {
		Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet rs = null;

	    ReviewBean review = null;

	    String selectSQL = "SELECT * FROM " + TABLE_NAME +
	                       " WHERE id_prodotto = ? AND id_utente = ?";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setInt(1, productId);
	        preparedStatement.setInt(2, userId);

	        rs = preparedStatement.executeQuery();

	        if (rs.next()) {
	            int id = rs.getInt("id");
	            String titolo = rs.getString("titolo");
	            String content = rs.getString("content");
	            int rating = rs.getInt("rating");
	            Date date = rs.getDate("date");
	            int idUtente = rs.getInt("id_utente");
	            int idProdotto = rs.getInt("id_prodotto");
	            
	            UserBean user = new UserModelDS().doRetrieveUserByKey(idUtente);
	            ProductBean product = new ProductModelDS().doRetrieveProductByKey(idProdotto);
	            review= new ReviewBean(id, titolo, content, rating, date, user, product);
	        }
	        else {
	        	return null;
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
	    return review;
	}

	@Override
	public int getAvgByProd(ProductBean prodotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int media = 0;
		
		String sqlString = "SELECT id_prodotto, AVG(rating) AS media_rating FROM " + TABLE_NAME
				+ " WHERE id_prodotto = ? " + "GROUP BY id_prodotto;";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(sqlString);
			
			preparedStatement.setInt(1, prodotto.getId());
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				media = rs.getInt("media_rating");
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
		return media;
	}

}
