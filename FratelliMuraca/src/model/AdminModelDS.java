package model;

import java.io.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.management.RuntimeErrorException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.cj.jdbc.Blob;

public class AdminModelDS implements AdminModel {

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

	private static final String TABLE_NAME = "admin";


	@Override
	public synchronized AdminBean doRetrieveAdmin(String username, String password) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		AdminBean bean = null;
		
		String insertSQL = "SELECT * FROM " + TABLE_NAME + " WHERE username = ? AND password = SHA2(?, 256);";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String usernameAdmin = rs.getString("username");
				String passwordAdmin = rs.getString("password");
				bean = new AdminBean(id, usernameAdmin, passwordAdmin);
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
		
		return bean;
	}


	@Override
	public synchronized void doSaveAdmin(AdminBean admin) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (username, password) " 
				+ "VALUES (?, SHA2(?, 256));";

		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, admin.getUsername());
			preparedStatement.setString(2, admin.getPassword());
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
	public synchronized void doChangeAdmin(AdminBean adminNuovo) throws SQLException {
		// TODO: Implementare la logica per cambiare i dettagli dell'amministratore.

	    // Per ora, lancia un'eccezione specifica per indicare che il metodo non � implementato.
	    throw new UnsupportedOperationException("Il metodo AdminModelDS.doChangeAdmin() non � ancora implementato.");
	}

	@Override
	public synchronized Collection<AdminBean> doRetrieveAllAdmins() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<AdminBean> list = new LinkedList<AdminBean>();
		
		String insertSQL = "SELECT * FROM " + TABLE_NAME;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String usernameAdmin = rs.getString("username");
				String passwordAdmin = rs.getString("password");
				list.add(new AdminBean(id, usernameAdmin, passwordAdmin));
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
		
		return list;
	}


	@Override
	public synchronized AdminBean doRetrieveAdmin(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		AdminBean bean = null;
		
		String insertSQL = "SELECT * FROM " + TABLE_NAME + " WHERE id = ?;";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, code);
			

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String usernameAdmin = rs.getString("username");
				String passwordAdmin = rs.getString("password");
				bean = new AdminBean(id, usernameAdmin, passwordAdmin);
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
		
		return bean;
	}
	
	@Override
	public synchronized void doDeleteAdmin(AdminBean adminDaRimuovere) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int id = (adminDaRimuovere.getId());
		if(id <= 1) {return;} //controllo id invalidi
		
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
	
	@Override
	public synchronized void doDeleteAdminById(String idAdminDaRimuovere) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		if(idAdminDaRimuovere == null || idAdminDaRimuovere.isEmpty())
		{
			return; //controllo stringa
		}
		int id = Integer.parseInt(idAdminDaRimuovere);
		if(id <= 1) {return;} //controllo id invalidi
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
	
	@Override
	public synchronized void doAddAdmin(AdminBean adminDaAggiungere) throws SQLException{
		Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    int id;
	    String insertSQL = "INSERT INTO " + TABLE_NAME
	            + " (username, password) "
	            + "VALUES (?, SHA2(?,256))";

	    try {
	        // Ottieni la connessione dal datasource
	        connection = ds.getConnection();

	        // Imposta i parametri del PreparedStatement
	        preparedStatement = connection.prepareStatement(insertSQL);
	        preparedStatement.setString(1, adminDaAggiungere.getUsername());
	        preparedStatement.setString(2, adminDaAggiungere.getPassword());

	        // Inserimento admin
	        preparedStatement.executeUpdate();

	        // Conferma la transazione
	        // connection.commit();
	    }
	    finally {
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
	public synchronized void doAddAdminByNameAndPwd(String nome, String password) throws SQLException{
		Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    int id;
	    String insertSQL = "INSERT INTO " + TABLE_NAME
	            + " (username, password) "
	            + "VALUES (?, SHA2(?,256))";

	    try {
	        // Ottieni la connessione dal datasource
	        connection = ds.getConnection();

	        // Imposta i parametri del PreparedStatement
	        preparedStatement = connection.prepareStatement(insertSQL);
	        preparedStatement.setString(1, nome);
	        preparedStatement.setString(2, password);

	        // Inserimento admin
	        preparedStatement.executeUpdate();

	        // Conferma la transazione
	        // connection.commit();
	    }
	    finally {
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
