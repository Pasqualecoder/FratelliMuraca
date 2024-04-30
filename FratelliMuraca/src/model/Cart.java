package model;

import java.util.Map;
import java.util.HashMap;

public class Cart {

	// mappa dei prodotti, integer è il numero di quei prodotti nel carrello
	private Map<ProductBean, Integer> products;
	
	public Cart() {
		products = new HashMap<>();
	}
	
	public void addProduct(ProductBean nuovo) {
		
        // Se il prodotto è già presente nel carrello, incrementa la sua quantità
        if (products.containsKey(nuovo)) {
            int quantity = products.get(nuovo);
            products.put(nuovo, quantity + 1);
        } else {
            // Se il prodotto non è presente nel carrello, aggiungilo con quantità 1
            products.put(nuovo, 1);
        }
	}
	
	public void deleteProduct(ProductBean vecchio) {
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
}
