package utilities;

import java.awt.*;
import java.util.*;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// FIXME: bisogna importare solamente l'interfaccia ProductModelDS
import model.*;

/**
 * Servlet implementation class ImageServlet
 */
@WebServlet("/imageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	static ProductModel productModel = new ProductModelDS();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            // Recupera l'ID dell'immagine dalla richiesta
            int imageId = Integer.parseInt(request.getParameter("img"));
            // Recupera l'immagine dal risultato della query
            byte[] imageData = productModel.doRetrieveImage(imageId);
            if (imageData == null) {
            	// se il prodotto non ha immagini nel db carica l'immagine con id 1 che è un placeholder
            	imageData = productModel.doRetrieveImage(1);
            }
            
            
            
        	// Imposta il tipo di contenuto nella risposta
        	response.setContentType("image/jpeg");
        	
        	// Scrivi l'immagine nella risposta
        	OutputStream oStream = response.getOutputStream();
        	oStream.write(imageData);
        	oStream.flush();
        	oStream.close();       
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
