package model;

import java.sql.SQLException;
import java.util.LinkedList;

public interface FavoriteModel {
	
	public void doDeleteFavorite(FavoriteBean favorite) throws SQLException;
	
	public void doAddFavorite() throws SQLException;
	
	public LinkedList<FavoriteBean> doRetrieveAllFavorites(UserBean user) throws SQLException;
	
	
}
