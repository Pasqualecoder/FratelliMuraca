package model;
import java.io.Serializable;
import java.util.List;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String nome;
	private String descrizione;
	private float prezzo;
	private int quantita;
	private String dimensione;
	private boolean tipo; // 0: olio, 1: cosmetico
	private ProductCategorie categoria;
	private String anno;
	private String ingredienti;
	private String image;

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

	public float getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(float prezzo) {
		this.prezzo = prezzo;
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

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage() {
		return image;
	}
	

	// Costruttore con tutti i parametri
	public ProductBean(int id, String nome, String descrizione, float prezzo, int quantita, String dimensione,
			boolean tipo, ProductCategorie categoria, String anno, String ingredienti, String image) {
		this.id = id;
		this.nome = nome;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.quantita = quantita;
		this.dimensione = dimensione;
		this.tipo = tipo;
		this.categoria = categoria;
		this.anno = anno;
		this.ingredienti = ingredienti;
		this.image = image;
	}
	
	// Costruttore senza id
		public ProductBean(String nome, String descrizione, float prezzo, int quantita, String dimensione,
				boolean tipo, ProductCategorie categoria, String anno, String ingredienti, String image) {
			this.id = -1;
			this.nome = nome;
			this.descrizione = descrizione;
			this.prezzo = prezzo;
			this.quantita = quantita;
			this.dimensione = dimensione;
			this.tipo = tipo;
			this.categoria = categoria;
			this.anno = anno;
			this.ingredienti = ingredienti;
			this.image = image;
		}


	// Costruttore vuoto
	public ProductBean() {
	}

	@Override
	public String toString() {
		return "ProductBean [id=" + id + ", nome=" + nome + ", descrizione=" + descrizione + ", prezzo=" + prezzo
				+ ", quantita=" + quantita + ", dimensione=" + dimensione + ", tipo=" + tipo + ", categoria="
				+ categoria + ", anno=" + anno + ", ingredienti=" + ingredienti + ", image=" + image + "]";
	}


}
