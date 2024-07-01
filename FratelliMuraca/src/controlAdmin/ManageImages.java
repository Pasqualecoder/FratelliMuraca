package controlAdmin;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.ImageBean;
import model.ProductBean;
import model.ProductModel;
import model.ProductModelDS;

import utilities.StringEscapeUtil;

/**
 * Servlet implementation class ManageImages
 */
@WebServlet("/admin/manageImages")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
	    maxFileSize = 1024 * 1024 * 30,       // 30 MB
	    maxRequestSize = 1024 * 1024 * 50     // 50 MB
)
public class ManageImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static ProductModel productModel = new ProductModelDS();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageImages() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id"); // viene riempito solo se si vuole cancellare una immagine
		if (idStr != null) {
			try {
				productModel.doDeleteImage(Integer.parseInt(idStr));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		LinkedList<ProductBean> listaProdotti = null;
		try {
			listaProdotti = (LinkedList<ProductBean>) productModel.doRetrieveAllProducts(null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("listaProdotti", listaProdotti);
		
		
		LinkedList<ImageBean> listaImmagini = null;
		try {
			listaImmagini = productModel.doRetriveAllImages();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("listaImmagini", listaImmagini);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AdminView/ManageImages.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("idProdotto");
		idStr = StringEscapeUtil.escapeHtml(idStr);
		
		Part filePart = request.getPart("immagine");
		
		if (idStr == null || idStr.isEmpty() || filePart == null || filePart.getSize() == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID prodotto o file immagine non forniti");
            return;
        }
		

		// Verificare il tipo di file
        String contentType = filePart.getContentType();
        if (!isImageContentType(contentType)) {
            response.sendError(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE, "Tipo di file non supportato");
            return;
        }
        
        try {
        	int idProdotto = Integer.parseInt(idStr);
        	// Leggi il file nel byte[]
        	byte[] imageBytes = getBytesFromPart(filePart);
        	ImageBean immagine = new ImageBean(-1, imageBytes, idProdotto);
        	productModel.doSaveImage(immagine);
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        
        doGet(request, response);
	}
	
	// Metodo per estrarre i byte dal Part
    private static byte[] getBytesFromPart(Part part) throws IOException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try (InputStream inputStream = part.getInputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                baos.write(buffer, 0, bytesRead);
            }
        }
        return baos.toByteArray();
    }
	
	
	private static boolean isImageContentType(String contentType) {
        return contentType.equals("image/png") || contentType.equals("image/gif") || contentType.equals("image/jpeg");
    }

}
