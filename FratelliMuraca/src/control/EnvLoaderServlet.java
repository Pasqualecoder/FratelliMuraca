package control;

import java.io.*;
import java.util.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnvLoaderServlet
 */
public class EnvLoaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/*
	 * per accedere ai campi nell'env
	 * String paypalClientId = (String) getServletContext().getAttribute("PAYPAL_CLIENT_ID");
	 * String paypalClientSecret = (String) getServletContext().getAttribute("PAYPAL_CLIENT_SECRET");
	 */
	
	@Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);

        // Recupera il contesto della servlet
        ServletContext context = config.getServletContext();
        // Carica il file .env
        loadEnv(context);
    }
	
	private void loadEnv(ServletContext context) {
        // Path del file .env nella directory WEB-INF
        String envFilePath = context.getRealPath("/WEB-INF/env");

        Map<String, String> env = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(envFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty() || line.startsWith("#")) {
                    continue; // Ignora righe vuote e commenti
                }
                String[] parts = line.split("=", 2);
                if (parts.length == 2) {
                    String key = parts[0].trim();
                    String value = parts[1].trim();
                    env.put(key, value);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        // Salva le variabili di ambiente nel ServletContext
        for (Map.Entry<String, String> entry : env.entrySet()) {
            context.setAttribute(entry.getKey(), entry.getValue());
        }
    }
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnvLoaderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

}
