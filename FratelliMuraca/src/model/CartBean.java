package model;

import java.io.*;
import java.io.Serializable;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedList;

public class CartBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	// mappa dei prodotti, integer è il numero di quei prodotti nel carrello
	private Map<ProductBean, Integer> products;
	
	public CartBean() {
		products = new HashMap<>();
	}
	
	public boolean isEmpty() {
		return products.size() == 0;
	}
	
	public void addProduct(ProductBean nuovo) {
		if (nuovo == null) return;
        // Se il prodotto è già presente nel carrello, incrementa la sua quantità
        if (products.containsKey(nuovo)) {
            int quantity = products.get(nuovo);
            if (quantity < 99) {
            	products.put(nuovo, quantity + 1);
            }
        } else {
            // Se il prodotto non è presente nel carrello, aggiungilo con quantità 1
            products.put(nuovo, 1);
        }
	}
	
	public void addProduct(ProductBean nuovo, int quantita) {
		if (nuovo == null || quantita <= 0) return;
		if (quantita >= 100 ) quantita = 99;
		// Se il prodotto è già presente nel carrello, incrementa la sua quantità
        if (products.containsKey(nuovo)) {
            int quantitaPresente = products.get(nuovo);
            if (quantitaPresente + quantita < 100) {
            	products.put(nuovo, quantitaPresente + quantita);            	
            }
            else {
            	products.put(nuovo, 99);
            }
        } else {
            // Se il prodotto non è presente nel carrello, aggiungilo con quantità
            products.put(nuovo, quantita);
        }
	}
	
	public void deleteProduct(ProductBean vecchio) {
		if (vecchio == null) return;
        // Rimuovi il prodotto solo se è presente nel carrello
        if (products.containsKey(vecchio)) {
            int quantity = products.get(vecchio);
            // Se la quantità è maggiore di 1, decrementa la quantità, altrimenti rimuovi il prodotto dalla mappa
            if (quantity > 1) {
                products.put(vecchio, quantity - 1);
            } else {
                products.remove(vecchio);
            }
        }
 	}
	
	public void deleteProduct(ProductBean vecchio, int quantita) {
		if (vecchio == null || quantita <= 0) return;
		if (products.containsKey(vecchio)) {
			int quantityPrec = products.get(vecchio);
			int diff = quantityPrec - quantita;
			if (diff > 1) {
				products.put(vecchio, diff);
			}
			else {
				products.remove(vecchio);
			}
		}
	}
	
	public int getQuantity(ProductBean product) {
		// restituisce la quantità di quel prodotto nel carrello o 0 se non è presente
		return products.getOrDefault(product, 0);
	}
	
	public int getSize() {
		// Calcola la dimensione totale del carrello sommando tutte le quantità dei prodotti
        int size = 0;
        for (int quantity : products.values()) {
            size += quantity;
        }
        return size;
	}
	
	public Map<ProductBean, Integer> getProducts() {
        // Restituisce la mappa che rappresenta i prodotti nel carrello
        return products;
    }
	
	public LinkedList<ProductBean> retrieveProducts() {
		LinkedList<ProductBean> prodotti = new LinkedList<>();
		if(!(products.isEmpty()))
		{
			for (ProductBean product: products.keySet()) {
				prodotti.add(product);
			}
		}	
		
		return prodotti;
	}
	
	public boolean isProductPresent(ProductBean prodottoEsterno) {
		LinkedList<ProductBean> prodottiInterni = retrieveProducts();
		return prodottiInterni.contains(prodottoEsterno);
	}
	
	
	@Override
	public String toString() {
		StringBuilder str = new StringBuilder();
		for (Map.Entry<ProductBean, Integer> entry : products.entrySet()) {
		    ProductBean key = entry.getKey(); // Ottieni la chiave
		    Integer value = entry.getValue(); // Ottieni il valore
		    // Esegui le operazioni su ogni coppia chiave-valore
		    str.append("Chiave: " + key.toString() + ", Valore: " + value + "\n");
		}
		return str.toString();
	}
	
	
	public byte[] serialize() throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ObjectOutputStream oos = new ObjectOutputStream(baos);
        oos.writeObject(this);
        oos.close();
        return baos.toByteArray();
    }

    public static CartBean deserialize(byte[] serializedCart) throws IOException, ClassNotFoundException {
        ByteArrayInputStream bais = new ByteArrayInputStream(serializedCart);
        ObjectInputStream ois = new ObjectInputStream(bais);
        CartBean cart = (CartBean) ois.readObject();
        ois.close();
        return cart;
    }

}
