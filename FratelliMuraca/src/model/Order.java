package model;

import java.io.*;
import java.sql.Timestamp;

public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int id_cliente;
	private Cart prodotti;
	private Timestamp datetime;
	private StatoOrdine stato;
	
	public Order() {}
	
	public Order(int id, int id_cliente, Cart prodotti, Timestamp datetime, StatoOrdine stato) {
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
	public Cart getProdotti() {
		return prodotti;
	}
	public void setProdotti(Cart prodotti) {
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
	public String toString() {
		return "Order [id=" + id + ", id_cliente=" + id_cliente + ", prodotti=" + prodotti + ", datetime=" + datetime
				+ ", stato=" + stato + "]";
	}
	
}
