package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public interface UserModel {
	public void doSaveUser(UserBean user) throws SQLException;
	
	public UserBean doRetrieveUser(String email, String password) throws SQLException;
	
	public LinkedList<String> doRetrieveAllEmail() throws SQLException;
}
