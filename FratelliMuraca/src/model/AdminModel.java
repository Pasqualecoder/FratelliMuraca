package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public interface AdminModel {
	
	/**
	 * usare durante la creazione dell'utente, si occupa della crittografia della password
	 * @param user
	 * @throws SQLException
	 */
	public void doSaveUser(AdminBean admin) throws SQLException;
	
	/**
	 * per il login
	 * @param email
	 * @param password DEVE GIà ESSERE CIFRATA
	 * @return
	 * @throws SQLException
	 */
	public AdminBean doRetrieveAdmin(String username, String password) throws SQLException;
	
	/**
	 * UPDATE delle info dell'utente tra cui la password
	 * @param userNuovo
	 * @throws SQLException
	 */
	public void doChangeAdmin(AdminBean adminNuovo) throws SQLException;
	
	/**
	 * restituisce tutte le email. utilizzato in Ajax durante la registrazione per dire se l'email è stata già utilizzata
	 * @return
	 * @throws SQLException
	 */
	public LinkedList<String> doRetrieveAllUsername() throws SQLException;
	
	
	public LinkedList<UserBean> doRetrieveAllAdmins() throws SQLException;
}
