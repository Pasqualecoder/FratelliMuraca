package model;

import java.io.Serializable;
import java.sql.Date;

public class ReviewBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private String titolo;
	private String content;
	private int rating;
	private Date date;
	private UserBean user;
	private ProductBean product;
	
	public ReviewBean(int id, String titolo, String content, int rating, Date date, UserBean user, ProductBean product) {
		this.id = id;
		this.titolo = titolo;
		this.content = content;
		this.rating = rating;
		this.date = date;
		this.user = user;
		this.product = product;
	}
	
	public ReviewBean(String titolo, String content, int rating, Date date, UserBean user, ProductBean product) {
		this(-1, titolo, content, rating, date, user, product);
	}
	
	public ReviewBean(String titolo, String content, int rating, UserBean user, ProductBean product) {
		this(-1, titolo, content, rating, null, user, product);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public UserBean getUser() {
		return user;
	}

	public void setUser(UserBean user) {
		this.user = user;
	}

	public ProductBean getProduct() {
		return product;
	}

	public void setProductID(ProductBean  product) {
		this.product = product;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewBean other = (ReviewBean) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReviewBean [id=" + id + ", titolo=" + titolo + ", content=" + content + ", rating=" + rating + ", date="
				+ date + ", user=" + user + ", product=" + product + "]";
	}

}
