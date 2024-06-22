package controlAdmin;

import java.io.*;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.*;

/**
 * Servlet implementation class CreateProductControl
 */
@WebServlet("/createProduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 30,      // 30MB
	    maxRequestSize = 1024 * 1024 * 80    // 80MB
)
public class CreateProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static ProductModel productModel = new ProductModelDS();
	
	// Directory where uploaded files will be saved, relative to the web application's directory
    private static final String UPLOAD_DIR = "/media/uploads";
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateProductControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Dopo aver processato la richiesta con successo, reindirizza all'URL di origine
	    String contextPath = request.getContextPath(); // Ottiene il contesto dell'applicazione
	    String redirectUrl = contextPath + "/admin?action=catalogo"; // URL di destinazione
	    
	    response.sendRedirect(redirectUrl);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set character encoding to UTF-8 to correctly handle form data
        request.setCharacterEncoding("UTF-8");
        
        try {
            // Ottenere i parametri del form
            String nome = request.getParameter("nome");
            String descrizione = request.getParameter("descrizione");
            float prezzo = 999999;
            int sconto = 0;
            int iva = 22; 
            int quantita = 1;
            
            try{
            	prezzo = Float.parseFloat(request.getParameter("prezzo"));
                sconto = Integer.parseInt(request.getParameter("sconto"));
                iva = Integer.parseInt(request.getParameter("iva"));
                quantita = Integer.parseInt(request.getParameter("quantita"));
            }
            catch(NumberFormatException e){
            	e.printStackTrace();
            	response.sendError(HttpServletResponse.SC_BAD_REQUEST, "tipo invalido");
            }
            
            String dimensione = request.getParameter("dimensione");
            boolean tipo = request.getParameter("tipo") != null;
            ProductCategorie categoria = ProductCategorie.fromString(request.getParameter("categoria"));
            String anno = request.getParameter("anno");
            String ingredienti = request.getParameter("ingredienti");

            ProductBean prodotto = new ProductBean(-1, nome, descrizione, prezzo, iva, sconto, quantita, dimensione, tipo, categoria, anno, ingredienti, null);

            // Gestione dei file caricati
            List<ImageBean> images = new LinkedList<>();
            for (Part part : request.getParts()) {
                if ("foto[]".equals(part.getName()) && part.getSize() > 0) {
                    try {
                        InputStream inputStream = part.getInputStream();
                        byte[] dati = convertInputStreamToByteArray(inputStream);

                        ImageBean imageBean = new ImageBean();
                        imageBean.setDati(dati);

                        images.add(imageBean);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }

            // Salva il prodotto e le immagini
            request.setAttribute("status", false);
            try {
                productModel.doSaveProduct(prodotto, (LinkedList<ImageBean>) images);
                request.setAttribute("status", true);
            } catch (SQLException e) {
                e.printStackTrace();
            }

            doGet(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Errore durante il caricamento del prodotto. Per favore riprova.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
                
	}

	// Funzione per convertire InputStream in byte array
	private byte[] convertInputStreamToByteArray(InputStream inputStream) throws IOException {
	    ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	    int nRead;
	    byte[] data = new byte[1024];
	    
	    while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
	        buffer.write(data, 0, nRead);
	    }
	    
	    buffer.flush();
	    return buffer.toByteArray();
	}
	
}
