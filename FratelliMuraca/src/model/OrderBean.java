
package model;

import java.io.*;
import java.sql.Timestamp;

public class OrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int id_cliente;
	private CartBean prodotti;
	private Timestamp datetime;
	private StatoOrdine stato;
	
	public OrderBean() {}
	
	public OrderBean(int id, int id_cliente, CartBean prodotti, Timestamp datetime, StatoOrdine stato) {
		this.id = id;
		this.id_cliente = id_cliente;
		this.prodotti = prodotti;
		this.datetime = datetime;
		this.stato = stato;
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
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public StatoOrdine getStato() {
		return stato;
	}
	public void setStato(StatoOrdine stato) {
		this.stato = stato;
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
		return "Order [id=" + id + ", id_cliente=" + id_cliente + ", prodotti=" + prodotti + ", datetime=" + datetime
				+ ", stato=" + stato + "]";
	}
	
}
