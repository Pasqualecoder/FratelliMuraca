package model;

public class FavoriteBean {
	
	private int id;
	private int userId;
	private int productId;
	
	public FavoriteBean(int id, int userId, int productId) {
		this.id = id;
		this.userId = userId;
		this.productId = productId;
	}
	
	public FavoriteBean(int userId, int productId) {
		this.userId = userId;
		this.productId = productId;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int id) {
		this.userId = id;
	}
	
	public int getProductId() {
		return productId;
	}
	
	public void setProductId(int id) {
		this.productId = id;
	}
}
