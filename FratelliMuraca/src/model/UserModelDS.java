package model;

import java.io.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.cj.jdbc.Blob;

public class UserModelDS implements UserModel {

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

	private static final String TABLE_NAME = "utenti";

	
	@Override
	public synchronized void doSaveUser(UserBean user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + TABLE_NAME
				+ " (email, password, nome, cognome, ddn, phone) " 
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getNome());
			preparedStatement.setString(4, user.getCognome());
			preparedStatement.setDate(5, user.getDdn());
			preparedStatement.setString(6, user.getPhone());
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
	public synchronized UserBean doRetrieveUser(String email, String password) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		UserBean bean = null;
		
		String insertSQL = "SELECT * FROM " + TABLE_NAME + " WHERE email = ? AND password = ?;";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			preparedStatement.executeUpdate();

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String emailUser = rs.getString("email");
				String passwordUser = rs.getString("password");
				String nome = rs.getString("nome");
				String cognome = rs.getString("cognome");
				Date ddn = rs.getDate("ddn");
				String phone = rs.getString("phone");
				String ingredienti = rs.getString("ingredienti");

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
		
	}

	
	@Override
	public synchronized Set<String> doRetrieveAllEmail() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Set<String> emails = new HashSet<String>();
		
		String insertSQL = "SELECT email FROM " + TABLE_NAME + ";";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.executeUpdate();

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				emails.add(rs.getString("email"));
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
		
		return emails;
	}
	
	
	
	
}
