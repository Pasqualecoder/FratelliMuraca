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
import model.ProductModelDS;
import model.UserModelDS;


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
	public synchronized void doSaveReview(ReviewBean reviewBean) throws SQLException {
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
	public synchronized void doDeleteReview(String idReview) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int id = Integer.parseInt(idReview);
		
		if(id > 0) //controllo id valido
		{
			String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE ID = ?";
			try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(deleteSQL);
				preparedStatement.setInt(1, id);
	
				preparedStatement.executeUpdate();
	
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
	}

	@Override
	public synchronized void doDeleteReview(ReviewBean reviewBean) throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non � ancora implementata.");
	}

	@Override
	public synchronized Collection<ReviewBean> doRetriveReviewsByProd(int idProdotto) throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non � ancora implementata.");
	}

	@Override
	public synchronized Collection<ReviewBean> doRetriveReviewsByUser(int idUser) throws SQLException {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Questa funzione non � ancora implementata.");
	}

	@Override
	public synchronized Collection<ReviewBean> doRetriveAllReviews() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		LinkedList<ReviewBean> reviews = new LinkedList<ReviewBean>();
		
		UserModel userModel = new UserModelDS();
		ProductModel productModel = new ProductModelDS();
		
		String insertSQL = "SELECT * FROM " + TABLE_NAME + ";";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				ReviewBean review = new ReviewBean(rs.getInt("id"), rs.getString("titolo"), rs.getString("content"), rs.getInt("rating"), (Date)rs.getDate("date"), userModel.doRetrieveUserByKey(rs.getInt("id_utente")), productModel.doRetrieveProductByKey(rs.getInt("id_prodotto")));
				reviews.add(review);
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
		
		return reviews;
	}

	@Override
	public synchronized int getAvgByProd(ProductBean prodotto) throws SQLException {
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
