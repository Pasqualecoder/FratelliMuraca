package model;

import java.io.*;
import java.sql.*;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import model.*;

import com.mysql.cj.jdbc.Blob;

public class ProductModelDS implements ProductModel {

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

	private static final String TABLE_NAME = "prodotti";

	@Override
	public synchronized void doSaveProduct(ProductBean product, LinkedList<ImageBean> images) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet generatedKeys = null;

	    int id;
	    String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
	            + " (nome, descrizione, prezzo, sale_perc, iva_perc, quantita, dimensione, tipo, categoria, anno, ingredienti) "
	            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    try {
	        // Ottieni la connessione dal datasource
	        connection = ds.getConnection();
	        
	        // Configura il PreparedStatement per restituire le chiavi generate automaticamente
	        preparedStatement = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);

	        // Imposta i parametri del PreparedStatement
	        preparedStatement.setString(1, product.getNome());
	        preparedStatement.setString(2, product.getDescrizione());
	        preparedStatement.setFloat(3, product.getPrezzoNetto());
	        preparedStatement.setInt(4, product.getSalePerc());
	        preparedStatement.setInt(5, product.getIvaPerc());
	        preparedStatement.setInt(6, product.getQuantita());
	        preparedStatement.setString(7, product.getDimensione());
	        preparedStatement.setBoolean(8, product.getTipo());
	        preparedStatement.setString(9, product.getCategoria().toString());
	        preparedStatement.setString(10, product.getAnno());
	        preparedStatement.setString(11, product.getIngredienti());

	        // Esegui l'aggiornamento e recupera le chiavi generate
	        int affectedRows = preparedStatement.executeUpdate();
	        
	        if (affectedRows == 0) {
	            throw new SQLException("Inserimento prodotto fallito, nessuna riga affetta.");
	        }

	        // Recupera il nuovo ID generato
	        id = -1;
	        generatedKeys = preparedStatement.getGeneratedKeys();
	        if (generatedKeys.next()) {
	            long newProductId = generatedKeys.getLong(1);
	            id = (int) newProductId;

	            // Aggiorna l'ID nel product bean
	            product.setId(id);
	        } else {
	            throw new SQLException("Inserimento prodotto fallito, nessuna chiave generata.");
	        }

	        // Conferma la transazione
	        // connection.commit();
	    } catch (SQLException e) {
	        if (connection != null) {
	        }
	        throw e; // Rilancia l'eccezione dopo il rollback
	    } finally {
	        if (generatedKeys != null) {
	            try {
	                generatedKeys.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (preparedStatement != null) {
	            try {
	                preparedStatement.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    // Salva le immagini associate al prodotto
	    doSaveImages(id, images);
	}


	
	@Override
	public synchronized void doDelete(String id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int id_int = Integer.parseInt(id);

		List<Integer> imagesKey =  doRetrieveImagesKey(id_int);
		doDeleteImages(imagesKey);

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE ID = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id_int);

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
	public synchronized void doDeleteImage(int id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		if(id != 1)
		{
			String deleteSQL = "DELETE FROM images WHERE ID = ?";
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
	}
	
	// doSaveImages
	
	@Override
	public synchronized ProductBean doRetrieveProductByKey(int id) throws SQLException {
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
	public synchronized Collection<ProductBean> doRetrieveAllProducts(String order) throws SQLException {
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
	
	@Override
	public synchronized void doUpdateProduct(ProductBean product) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE " + TABLE_NAME + " SET nome = ?, descrizione = ?, prezzo = ?, sale_perc = ?, iva_perc = ?, quantita = ?, dimensione = ?, tipo = ?, categoria = ?, anno = ?, ingredienti = ?, WHERE id = ?"; 
		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setFloat(3, product.getPrezzoNetto());
			preparedStatement.setInt(4, product.getSalePerc());
			preparedStatement.setInt(5, product.getIvaPerc());
			preparedStatement.setInt(6, product.getQuantita());
			preparedStatement.setString(7, product.getDimensione());
			preparedStatement.setBoolean(8, product.getTipo());
			preparedStatement.setString(9, product.getCategoria().toString());
			preparedStatement.setString(10, product.getAnno());
			preparedStatement.setString(11, product.getIngredienti());
			preparedStatement.setInt(12, product.getId());

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
	
	
	private synchronized void doSaveImages(int prodottoFk, LinkedList<ImageBean> immagini) throws SQLException {
		if (immagini == null || immagini.size() == 0) {
			return;
		}

		Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    String insertSQL = "INSERT INTO " + "images " + "(imageblob, prod_fk) VALUES (?, ?)";

	    try {
	        connection = ds.getConnection();
	        preparedStatement = connection.prepareStatement(insertSQL);

	        for (ImageBean im : immagini) {
	            // Converti l'array di byte dei dati dell'immagine in un InputStream
	            byte[] imageData = im.getDati(); // Assumendo che ImageBean abbia un metodo getDati() che ritorna byte[]
	            ByteArrayInputStream inputStream = new ByteArrayInputStream(imageData);

	            // Imposta il Blob nell'istruzione preparata
	            preparedStatement.setBlob(1, inputStream);

	            // Imposta l'ID del prodotto esterno (prodottoFk)
	            preparedStatement.setInt(2, prodottoFk);

	            // Esegui l'inserimento
	            preparedStatement.executeUpdate();

	            // Ripulisci il Blob per la prossima iterazione
	            inputStream.close();
	            preparedStatement.clearParameters();
	        }

	        // connection.commit();
	    } catch (IOException e) {
	        // Gestione dell'eccezione di IO (chiusura stream)
	        e.printStackTrace();
	    } finally {
	        // Chiusura delle risorse
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            if (connection != null)
	                connection.close();
	        }
	    }
	}
	
	private synchronized void doDeleteImages(List<Integer> id_list) throws SQLException {
		PreparedStatement preparedStatement = null;
		Connection connection = null;

		String deleteSQL = "DELETE FROM images WHERE ID = ?";
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			for (int id : id_list) {
				if(id != 1)
				{
					preparedStatement.setInt(1, id);
					preparedStatement.executeUpdate();
					preparedStatement.clearParameters();
				}
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
	
	
}