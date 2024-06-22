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
	 * @param password DEVE GI� ESSERE CIFRATA
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
	
	/**
	 * cambia dettagli utente senza modfiica la password
	 * @return null
	 * @throws SQLException
	 */
	public void doChangeUserNoPwd(UserBean userNuovo) throws SQLException;
	
	/**
	 * restituisce tutte le email. utilizzato in Ajax durante la registrazione per dire se l'email � stata gi� utilizzata
	 * @return
	 * @throws SQLException
	 */
	public Collection<String> doRetrieveAllEmail() throws SQLException;
	
	/**
	 * restituisce una collection di tutti gli user presenti nel db
	 * @return Collection<UserBean>
	 * @throws SQLException
	 */
	public Collection<UserBean> doRetrieveAllUsers() throws SQLException;
	
	/**
	 * rimuove l'user scelto
	 * @return null
	 * @throws SQLException
	 */
	public void doDeleteUser(UserBean userDaRimuovere) throws SQLException;
	
	/**
	 * rimuove l'user scelto (da id)
	 * @return null
	 * @throws SQLException
	 */
	public void doDeleteUserById(String id) throws SQLException;

	/*
	/**
	 * aggiunge l'user scelto
	 * @return null
	 * @throws SQLException
	 */
	//public void doDeleteUser(UserBean userDaAggiungere) throws SQLException;
	
}
