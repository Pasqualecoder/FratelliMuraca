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
	public void doSaveUser(AdminBean admin) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void doChangeAdmin(AdminBean adminNuovo) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public LinkedList<String> doRetrieveAllUsername() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public LinkedList<UserBean> doRetrieveAllAdmins() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	
	
	
	
}
