package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public interface AdminModel {
	
	/**
	 * usare durante la creazione dell'admin, si occupa della crittografia della password
	 * @param admin
	 * @throws SQLException
	 */
	public void doSaveAdmin(AdminBean admin) throws SQLException;
	
	/**
	 * per il login
	 * @param email
	 * @param password
	 * @return admin
	 * @throws SQLException
	 */
	public AdminBean doRetrieveAdmin(String username, String password) throws SQLException;
	
	
	/**
     * @param id admin da trovare
     * @return admin
     * @throws SQLException
     */
	public AdminBean doRetrieveAdmin(int code) throws SQLException;
	
	
	/**
	 * UPDATE delle info dell'Admin tra cui la password
	 * @param adminNuovo
	 * @throws SQLException
	 */
	public void doChangeAdmin(AdminBean adminNuovo) throws SQLException;
	
	/**
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Collection<AdminBean> doRetrieveAllAdmins() throws SQLException;
	
	/**
	 * Rimuove l'admin indicato dall utente.
	 * @param adminDaRimuovere
	 * @throws SQLException
	 */
	public void doDeleteAdmin(AdminBean adminDaRimuovere) throws SQLException;
	
	/**
	 * Rimuove l'admin indicato dall utente (tramite id).
	 * @param adminDaRimuovere
	 * @throws SQLException
	 */
	public void doDeleteAdminById(String idAdminDaRimuovere) throws SQLException;

	/**
	 * Aggiunge l'admin indicato dall utente.
	 * @param adminDaAggiungere
	 * @throws SQLException
	 */
	public void doAddAdmin(AdminBean adminDaAggiungere) throws SQLException;
	
	/**
	 * Aggiunge l'admin indicato dall utente (tramite username e password)
	 * @param String nome, String password
	 * @throws SQLException
	 */
	public void doAddAdminByNameAndPwd(String nome, String password) throws SQLException;
	

	
}
