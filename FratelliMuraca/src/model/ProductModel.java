package model;

import java.sql.SQLException;
import java.util.Collection;

public interface ProductModel {
	/* solo per l'admin consente la creazione di un nuovo prodotto
	public void doSaveProduct(ProductBean product) throws SQLException;
	*/

	/* solo per l'admin, consente l'eleminazione di un prodotto dal catalogo
	public boolean doDeleteProduct(int code) throws SQLException;
	*/
	
	/**
	 * retrive from db the product given the id
	 * @param code: id del prodotto
	 * @return bean del prodotto
	 * @throws SQLException
	 */
	public ProductBean doRetrieveProductByKey(int code) throws SQLException;

	/**
	 * retrives all products from db and sort by "order" parameter.
	 * for no sort pass an empty string or null
	 * @param order: string e.g. "DESC" "ASC" 
	 * @return
	 * @throws SQLException
	 */
	public Collection<ProductBean> doRetrieveAllProducts(String order) throws SQLException;

	
	
	public byte[] doRetrieveImage(int imgId) throws SQLException;
	
	//TODO: 	public synchronized LinkedList<Immagine> doSaveImages(LinkedList<Immagine> immagini) throws SQLException {

	
}
