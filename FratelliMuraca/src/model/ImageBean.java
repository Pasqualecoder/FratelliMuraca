package model;

public class ImageBean {
	private int id;
	private byte[] dati;
	private int productId;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public byte[] getDati() {
		return dati;
	}

	public void setDati(byte[] dati) {
		this.dati = dati;
	}

	public ImageBean() {}
	
	public ImageBean(int id, byte[] dati, int productId) {
		this.id = id;
		this.dati = dati;
		this.productId = productId;
	}
	
	// not useful rn
	public ImageBean(byte[] dati) {
		id = 0;
		this.dati = dati;
		productId = 0;
	}
	
}