package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public interface ProductModel {
	// solo per l'admin consente la creazione di un nuovo prodotto
	/**
	 * viene ignorato il campo product.immagini (LinkedList<Integer>) in favore della linked list di vere immagini
	 * in binario da caricare nel db
	 * @param product
	 * @param images
	 * @throws SQLException
	 */
	public void doSaveProduct(ProductBean product, LinkedList<ImageBean> images) throws SQLException;
	

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

	
	public void doUpdateProduct(ProductBean product) throws SQLException;
	
	
	public byte[] doRetrieveImage(int imgId) throws SQLException;
	
	
	public void doDelete(String id) throws SQLException;
	
	public void doDeleteImage(int id) throws SQLException;
	
	public List<Integer> doRetrieveImagesKey(int idProd) throws SQLException;
	
	// private LinkedList<ImageBean> doSaveImages(int prodottoFk, LinkedList<ImageBean> immagini) throws SQLException; 
	
}
