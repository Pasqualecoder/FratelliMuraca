package model;
import java.io.Serializable;
import java.util.Objects;
import java.util.LinkedList;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String nome;
	private String descrizione;
	private float prezzoNetto; // senza iva ne sconti
	private float prezzoIva; // con iva
	private float prezzoScontato; // con iva e sconti
	private int salePerc; // percentuale di sconto
	private boolean isOnSale;
	private int ivaPerc; // percentuale di iva (4% olio, 22% cosmetici) per i fini dell'esame viene preso dal db
	private int quantita; // disponibile in magazzino
	private String dimensione; // in litri o grammi
	private boolean tipo; // 0: olio, 1: cosmetico
	private ProductCategorie categoria;
	private String anno;
	private String ingredienti;
	private LinkedList<Integer> immagini;
	

	public static float arrotondaDueDecimali(double numero) {
        return Math.round(numero * 100) / 100.0f;
    }
	
	private static float calculateIva(float netto, int perc) {
		float iva = (netto / 100) * perc;
		float prezzoiva = netto + iva;
		return arrotondaDueDecimali(prezzoiva);
	}
	
	private static float calculateDiscount(float prezzo, int perc) {
		float sconto = (prezzo * perc) / 100;
		float prezzoscontato = prezzo - sconto;
		return arrotondaDueDecimali(prezzoscontato);
	}
	

	// Getter e setter per ogni attributo

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public float getPrezzoNetto() {
		return prezzoNetto;
	}

	public void setPrezzoNetto(float prezzoNetto) {
		this.prezzoNetto = prezzoNetto;
	}
	
	public float getPrezzoIva() {
		return prezzoIva;
	}

	public void setPrezzoIva(float prezzoIva) {
		this.prezzoIva = prezzoIva;
	}

	public float getPrezzoScontato() {
		return prezzoScontato;
	}

	public void setPrezzoScontato(float prezzoScontato) {
		this.prezzoScontato = prezzoScontato;
	}

	public int getSalePerc() {
		return salePerc;
	}

	public void setSalePerc(int salePerc) {
		this.salePerc = salePerc;
	}

	public boolean isOnSale() {
		return isOnSale;
	}

	public void setOnSale(boolean isOnSale) {
		this.isOnSale = isOnSale;
	}

	public int getIvaPerc() {
		return ivaPerc;
	}

	public void setIvaPerc(int ivaPerc) {
		this.ivaPerc = ivaPerc;
	}
	
	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public String getDimensione() {
		return dimensione;
	}

	public void setDimensione(String dimensione) {
		this.dimensione = dimensione;
	}

	public boolean getTipo() {
		return tipo;
	}

	public void setTipo(boolean tipo) {
		this.tipo = tipo;
	}

	public ProductCategorie getCategoria() {
		return categoria;
	}

	public void setCategoria(ProductCategorie categoria) {
		this.categoria = categoria;
	}

	public String getAnno() {
		return anno;
	}

	public void setAnno(String anno) {
		this.anno = anno;
	}

	public String getIngredienti() {
		return ingredienti;
	}

	public void setIngredienti(String ingredienti) {
		this.ingredienti = ingredienti;
	}
	
	public void setImmagini(LinkedList<Integer> immagini) {
		this.immagini = immagini;
	}
	
	public LinkedList<Integer> getImmagini() {
		return immagini;
	}
	
	

	// Costruttore con tutti i parametri
	public ProductBean(int id, String nome, String descrizione, float prezzoNetto, int ivaPerc, int salePerc, int quantita, String dimensione,
			boolean tipo, ProductCategorie categoria, String anno, String ingredienti, LinkedList<Integer> immagini) {
		this.id = id;
		this.nome = nome;
		this.descrizione = descrizione;
		
		this.prezzoNetto = prezzoNetto;
		this.ivaPerc = ivaPerc;
		this.salePerc = salePerc;
		this.isOnSale = salePerc > 0; // true se la percentuale di sconto è maggiore di 0
		this.prezzoIva = calculateIva(prezzoNetto, ivaPerc);
		prezzoScontato = isOnSale ? calculateDiscount(prezzoIva, salePerc) : prezzoIva; // se è in sconto fai il calcolo sennò lascia il prezzoIva
		
		this.quantita = quantita;
		this.dimensione = dimensione;
		this.tipo = tipo;
		this.categoria = categoria;
		this.anno = anno;
		this.ingredienti = ingredienti;
		
		// se non sono state trovate immagini per prod_fk si mette l'immagine placeholder che è associata con la prod_fk 0
		if (immagini == null || immagini.size() == 0) {
			immagini = new LinkedList<Integer>();
			immagini.add(1);
		}
		
		this.immagini = immagini;
	}
	
	// Costruttore senza id
	public ProductBean(String nome, String descrizione, float prezzoNetto, int ivaPerc, int salePerc, int quantita, String dimensione,
			boolean tipo, ProductCategorie categoria, String anno, String ingredienti, LinkedList<Integer> immagini) {
		// chiamo il costruttore sopra con id settato a -1
		this(-1, nome, descrizione, prezzoNetto, ivaPerc, salePerc, quantita, dimensione, tipo, categoria, anno, ingredienti, immagini);
	}


	// Costruttore vuoto
	public ProductBean() {
	}
	
	public String toJSON() {
	    StringBuilder json = new StringBuilder();
	    json.append("{");
	    
	    json.append("\"id\":").append(id).append(",");
	    json.append("\"nome\":\"").append(nome).append("\",");
	    json.append("\"descrizione\":\"").append(descrizione).append("\",");
	    json.append("\"prezzoNetto\":").append(prezzoNetto).append(",");
	    json.append("\"prezzoIva\":").append(prezzoIva).append(",");
	    json.append("\"prezzoScontato\":").append(prezzoScontato).append(",");
	    json.append("\"salePerc\":").append(salePerc).append(",");
	    json.append("\"isOnSale\":").append(isOnSale).append(",");
	    json.append("\"ivaPerc\":").append(ivaPerc).append(",");
	    json.append("\"quantita\":").append(quantita).append(",");
	    json.append("\"dimensione\":\"").append(dimensione).append("\",");
	    json.append("\"tipo\":").append(tipo).append(",");
	    json.append("\"categoria\":\"").append(categoria != null ? categoria.name() : null).append("\",");
	    json.append("\"anno\":\"").append(anno).append("\",");
	    json.append("\"ingredienti\":\"").append(ingredienti).append("\",");
	    
	    json.append("\"immagini\": [");
	    for (int i = 0; i < immagini.size(); i++) {
	        json.append(immagini.get(i));
	        if (i < immagini.size() - 1) {
	            json.append(",");
	        }
	    }
	    json.append("]");
	    
	    json.append("}");
	    
	    return json.toString();
	}

	

	/**
	 * due prodotti sono uguali se hanno lo stesso id
	 * utile ai fini del carrello
	 */
	@Override
	public boolean equals(Object obj) {
	    if (this == obj) {
	        return true;
	    }
	    if (obj == null || getClass() != obj.getClass()) {
	        return false;
	    }
	    ProductBean other = (ProductBean) obj;
	    return id == other.id;
	}

	@Override
	public int hashCode() {
	    return Objects.hash(id);
	}
	

	@Override
	public String toString() {
		return "ProductBean [id=" + id + ", nome=" + nome + ", descrizione=" + descrizione + ", prezzoNetto="
				+ prezzoNetto + ", prezzoIva=" + prezzoIva + ", prezzoScontato=" + prezzoScontato + ", salePerc="
				+ salePerc + ", isOnSale=" + isOnSale + ", ivaPerc=" + ivaPerc + ", quantita=" + quantita
				+ ", dimensione=" + dimensione + ", tipo=" + tipo + ", categoria=" + categoria + ", anno=" + anno
				+ ", ingredienti=" + ingredienti + ", immagini=" + immagini + "]";
	}


}
