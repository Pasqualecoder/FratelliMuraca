package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public interface UserModel {
	
	/**
	 * usare durante la creazione dell'utente, si occupa della crittografia della password
	 * @param user
	 * @throws SQLException
	 */
	public void doSaveUser(UserBean user) throws SQLException;
	
	/**
	 * per il login
	 * @param email
	 * @param password DEVE GIà ESSERE CIFRATA
	 * @return
	 * @throws SQLException
	 */
	public UserBean doRetrieveUser(String email, String password) throws SQLException;
	
	/**
	 * UPDATE delle info dell'utente tra cui la password
	 * @param userNuovo
	 * @throws SQLException
	 */
	public void doChangeUser(UserBean userNuovo) throws SQLException;
	
	
	public void doChangeUserNoPwd(UserBean userNuovo) throws SQLException;
	
	/**
	 * restituisce tutte le email. utilizzato in Ajax durante la registrazione per dire se l'email è stata già utilizzata
	 * @return
	 * @throws SQLException
	 */
	public Collection<String> doRetrieveAllEmail() throws SQLException;
	
	
	public Collection<UserBean> doRetrieveAllUsers() throws SQLException;
}
