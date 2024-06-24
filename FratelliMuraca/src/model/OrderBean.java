
package model;

import java.io.*;
import java.sql.Timestamp;

public class OrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int id_cliente;
	private String details;
	private CartBean prodotti;
	private StatoOrdine stato;
	
	/**
	 * da riempire solo quando l'admin vuole vedere gli ultimi ordini
	 */
	private UserBean user;
	
	public OrderBean() {}
	
	public OrderBean(int id, int id_cliente, String details, CartBean prodotti, StatoOrdine stato) {
		this.id = id;
		this.id_cliente = id_cliente;
		this.details = details;
		this.prodotti = prodotti;
		this.stato = stato;
	}
	
	public OrderBean(int id, int id_cliente, UserBean user, String details, CartBean prodotti, StatoOrdine stato) {
		this.id = id;
		this.id_cliente = id_cliente;
		this.user = user;
		this.details = details;
		this.prodotti = prodotti;
		this.stato = stato;
	}
	
	public OrderBean(int id, UserBean user, String details, CartBean prodotti, StatoOrdine stato) {
		this.id = id;
		this.user = user;
		this.details = details;
		this.prodotti = prodotti;
		this.stato = stato;
	}
	
	public OrderBean(int id_cliente, String details, CartBean prodotti) {
		this(-1, id_cliente, details, prodotti, StatoOrdine.in_elaborazione);
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}
	public CartBean getProdotti() {
		return prodotti;
	}
	public void setProdotti(CartBean prodotti) {
		this.prodotti = prodotti;
	}
	public String getDetails() {
		return details;
	}
	
	public void setDetails(String details) {
		this.details = details;
	}
	public StatoOrdine getStato() {
		return stato;
	}
	public void setStato(StatoOrdine stato) {
		this.stato = stato;
	}
	public UserBean getUser() {
		return user;
	}
	public void setUser(UserBean user) {
		this.user = user;
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
		OrderBean other = (OrderBean) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", id_cliente=" + id_cliente + ", user=" + user + ", prodotti=" + prodotti + 
				"details=" + (!details.isBlank() ? "presenti" : "assenti") 
				+ ", stato=" + stato + "]";
	}
	
}
