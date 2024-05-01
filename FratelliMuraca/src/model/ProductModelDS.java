package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductModelDS implements ProductModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/fratellimuracadb");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "prodotti";

	public synchronized void doSave(ProductBean product) throws SQLException {/* TODO */}
	/*
	@Override
	public synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (nome, descrizione, prezzo, quantita, dimensione, tipo, categoria, anno, ingredienti) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setFloat(3, product.getPrezzo());
			preparedStatement.setInt(4, product.getQuantita());
			preparedStatement.setString(5, product.getDimensione());
			preparedStatement.setBoolean(6, product.getTipo());
			preparedStatement.setString(7, product.getCategoria().toString());
			preparedStatement.setString(8, product.getAnno());
			preparedStatement.setString(9, product.getIngredienti());
			
			// TODO: save images
			
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
	*/

	@Override
	public synchronized ProductBean doRetrieveByKey(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = null;

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				float prezzo = rs.getFloat("prezzo");
				int salePerc = rs.getInt("sale_perc");
				int ivaPerc = rs.getInt("iva_perc");
				int quantita = rs.getInt("quantita");
				String dimensione = rs.getString("dimensione");
				boolean tipo = rs.getBoolean("tipo");
				ProductCategorie categoria = ProductCategorie.fromString(rs.getString("categoria"));
				String anno = rs.getString("anno");
				String ingredienti = rs.getString("ingredienti");
				LinkedList<Integer> immagini = (LinkedList<Integer>) doRetrieveImagesKey(id);

				bean = new ProductBean(id, nome, descrizione, prezzo, ivaPerc, salePerc, quantita, dimensione, tipo, categoria, anno, ingredienti, immagini);
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
	public synchronized boolean doDelete(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE ID = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String nome = rs.getString("nome");
				String descrizione = rs.getString("descrizione");
				float prezzo = rs.getFloat("prezzo");
				int salePerc = rs.getInt("sale_perc");
				int ivaPerc = rs.getInt("iva_perc");
				int quantita = rs.getInt("quantita");
				String dimensione = rs.getString("dimensione");
				boolean tipo = rs.getBoolean("tipo");
				ProductCategorie categoria = ProductCategorie.fromString(rs.getString("categoria"));
				String anno = rs.getString("anno");
				String ingredienti = rs.getString("ingredienti");
				LinkedList<Integer> immagini = (LinkedList<Integer>) doRetrieveImagesKey(id);

				ProductBean bean = new ProductBean(id, nome, descrizione, prezzo, ivaPerc, salePerc, quantita, dimensione, tipo, categoria, anno, ingredienti, immagini);
				products.add(bean);
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
		return products;
	}

	/**
	 * restituisce una SINGOLA immagine, deve essere usato da ImageServlet
	 * @param imgId
	 * @return
	 * @throws SQLException
	 */
	public synchronized byte[] doRetrieveImage(int imgId) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		byte[] imageData = null;

		String selectSQL = "SELECT * FROM " + "images" + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, imgId);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				// Recupera l'immagine dal risultato della query
                imageData = rs.getBytes("imageblob");
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
		
		return imageData;
	}
	
	public synchronized LinkedList<Immagine> doRetrieveImages(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		LinkedList<Immagine> lista = new LinkedList<Immagine>();

		String selectSQL = "SELECT * FROM " + "images" + " WHERE prod_fk = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				byte[] buffer = rs.getBytes("imageblob");
				lista.add(new Immagine(buffer));
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
		
		return lista;
	}
	
	/**
	 * restituisce una lista di chiavi di immagini di un prodotto. Serviranno poi per il ImageServlet.java
	 * @param id del prodotto del quale si vogliono sapere le chiavi delle foto
	 * @return
	 * @throws SQLException
	 */
	public List<Integer> doRetrieveImagesKey(int idProd) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		List<Integer> lista = new LinkedList<Integer>();

		String selectSQL = "SELECT id FROM " + "images" + " WHERE prod_fk = ?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, idProd);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int chiave = rs.getInt("id");
				lista.add(chiave);
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
		
		return lista;
	}
	
	//TODO: save images
	/*
	public synchronized LinkedList<Immagine> doSaveImages(LinkedList<Immagine> immagini) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		LinkedList<Immagine> lista = new LinkedList<Immagine>();

		String selectSQL = "SELECT * FROM " + "images" + " WHERE prod_fk = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				byte[] buffer = rs.getBytes("imageblob");
				lista.add(new Immagine(buffer));
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
		
		return lista;
	}
	*/
}