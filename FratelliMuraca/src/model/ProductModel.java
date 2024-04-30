package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public interface ProductModel {
	public void doSave(ProductBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ProductBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException;
	
	public byte[] doRetrieveImage(int imgId) throws SQLException;

	
	// TODO: aggiungere le interfacce mancanti
	
}
