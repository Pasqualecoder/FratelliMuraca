package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public interface AdminModel {
	
	/**
	 * usare durante la creazione dell'admin, si occupa della crittografia della password
	 * @param user
	 * @throws SQLException
	 */
	public void doSaveUser(AdminBean admin) throws SQLException;
	
	/**
	 * per il login
	 * @param email
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public AdminBean doRetrieveAdmin(String username, String password) throws SQLException;
	
	
	/**
	 * per il manager
	 * @param email
	 * @param password
	 * @return
	 * @throws SQLException
	 */
	public AdminBean doRetrieveAdmin(int code) throws SQLException;
	
	
	/**
	 * UPDATE delle info dell'utente tra cui la password
	 * @param userNuovo
	 * @throws SQLException
	 */
	public void doChangeAdmin(AdminBean adminNuovo) throws SQLException;
	
	/**
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Collection<AdminBean> doRetrieveAllAdmins() throws SQLException;
}
