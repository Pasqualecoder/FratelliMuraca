package model;

import java.sql.SQLException;
import java.util.Collection;

public interface ReviewModel {
	
	public void doSaveReview(ReviewBean reviewBean) throws SQLException;

	public void doDeleteReview(int idReview) throws SQLException;

	public void doDeleteReview(ReviewBean reviewBean) throws SQLException;
	
	public Collection<ReviewBean> doRetriveReviewsByProd(int idProdotto) throws SQLException;
	
	public Collection<ReviewBean> doRetriveReviewsByUser(int idUser) throws SQLException;

	public Collection<ReviewBean> doRetriveAllReviews() throws SQLException;

	public int getAvgByProd(ProductBean prodotto) throws SQLException;
	
	public ReviewBean doRetrieveReview(int userId, int productId) throws SQLException;
	
}
