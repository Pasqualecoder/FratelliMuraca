package control;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class CreateProductControl
 */
@WebServlet("/createProduct")
public class CreateProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProductControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Ottenere i parametri del form
		String nome = request.getParameter("nome");
        String descrizione = request.getParameter("descrizione");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        double sconto = Double.parseDouble(request.getParameter("sconto"));
        double iva = Double.parseDouble(request.getParameter("iva"));
        int quantita = Integer.parseInt(request.getParameter("quantita"));
        String dimensione = request.getParameter("dimensione");
        boolean tipo = request.getParameter("tipo") != null;
        String categoria = request.getParameter("categoria");
        int anno = Integer.parseInt(request.getParameter("anno"));
        String ingredienti = request.getParameter("ingredienti");
        
        // Gestione dei file caricati
        Part[] fotoParts = request.getParts().stream()
                                  .filter(part -> "foto[]".equals(part.getName()))
                                  .toArray(Part[]::new);
        
        for (Part fotoPart : fotoParts) {
            // Puoi salvare il file o elaborarlo come necessario
            String fileName = Paths.get(fotoPart.getSubmittedFileName()).getFileName().toString();
            InputStream fileContent = fotoPart.getInputStream();
            
            // Salva il file nel server o in un percorso desiderato
            // Files.copy(fileContent, Paths.get("/path/to/save/" + fileName), StandardCopyOption.REPLACE_EXISTING);
        }
        
        // Continua con il salvataggio delle informazioni del prodotto
        // ...
		
		
		doGet(request, response);
	}

}
