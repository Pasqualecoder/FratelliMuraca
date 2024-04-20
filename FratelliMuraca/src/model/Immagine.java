package model;

public class Immagine {
	private byte[] dati;
	
	public Immagine(byte[] dati) {
		this.dati = dati;
	}
	
	public byte[] getDati() {
		return dati;
	}
}