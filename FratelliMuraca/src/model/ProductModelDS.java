package model;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.cj.jdbc.Blob;

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
	public synchronized List<Integer> doRetrieveImagesKey(int idProd) throws SQLException {
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
	
	public synchronized void doSaveOrder(int userId, Cart cart) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		byte[] cartSer = null;
		
		try {
			cartSer = cart.serialize();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        /*
		String filename = "C:\\Users\\Pasquale\\Desktop\\FratelliMuraca\\FratelliMuraca\\WebContent\\outputSerialized.txt";
        try (OutputStream os = new FileOutputStream(filename)) {
            byte[] bytes = cartSer;
            os.write(bytes);
            System.out.println("Dati scritti correttamente su " + filename);
        } catch (IOException e) {
            System.err.println("Errore durante la scrittura del file " + filename);
            e.printStackTrace();
        }
		*/
		String insertSQL = "INSERT INTO " + "ordini" 
				+ " (id_cliente, prodotti) "
				+ "VALUES (?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, userId);
			preparedStatement.setBytes(2, cartSer);
			preparedStatement.executeUpdate();
			//connection.commit();
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

	
	/**
	 * Solo per l'admin
	 */
	public synchronized Collection<Order> doRetrieveAllOrders() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Order> ordini = new LinkedList<Order>();

		String selectSQL = "SELECT * FROM " + "ordini" + "ORDER BY " + "datetime" + "DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				Cart prodotti = Cart.deserialize(rs.getBytes("prodotti"));
				Timestamp datetime = rs.getTimestamp("datetime");
				StatoOrdine stato = StatoOrdine.fromString(rs.getString("stato"));

				Order ordine = new Order(id, idCliente, prodotti, datetime, stato);
				ordini.add(ordine);
			}

		} catch (IOException | ClassNotFoundException e){
			e.printStackTrace();
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
		return ordini;
	}

	@Override
	public synchronized Collection<Order> doRetrieveOrders(int userOwner) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Order> ordini = new LinkedList<Order>();

		String selectSQL = "SELECT * FROM " + "ordini" + " WHERE id_cliente = ? ORDER BY " + "datetime " + "DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, userOwner);
			System.out.println(preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				int idCliente = rs.getInt("id_cliente");
				Cart prodotti = Cart.deserialize(rs.getBytes("prodotti"));
				Timestamp datetime = rs.getTimestamp("datetime");
				StatoOrdine stato = StatoOrdine.fromString(rs.getString("stato"));

				Order ordine = new Order(id, idCliente, prodotti, datetime, stato);
				ordini.add(ordine);
			}

		} catch (IOException | ClassNotFoundException e){
			e.printStackTrace();
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
		return ordini;
	}
	
}