package model;

import java.sql.SQLException;
import java.util.LinkedList;

public interface FavoriteModel {
	
	public void doAddFavorite(FavoriteBean favorite) throws SQLException;
	
	public LinkedList<FavoriteBean> doRetrieveAllFavorites(int userId) throws SQLException;
	
	public FavoriteBean doRetrieveFavorite(int idFav) throws SQLException;
	
	public void doDeleteFavorite(int idFav) throws SQLException;
	
	public FavoriteBean doRetrieveFavorite(int userId, int productId) throws SQLException;
}
