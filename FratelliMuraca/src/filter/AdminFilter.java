package filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/AdminFilter")
public class AdminFilter implements Filter {

	private static final Set<String> pagineAdminVisibili = new HashSet<String>();
	static {
		pagineAdminVisibili.add("/admin");
		pagineAdminVisibili.add("/admin/dashboard");
		pagineAdminVisibili.add("/admin/catalogo");
		pagineAdminVisibili.add("/admin/modificaProdotto");
		pagineAdminVisibili.add("/admin/manageImages");
		pagineAdminVisibili.add("/admin/manageAdmin");
		pagineAdminVisibili.add("/admin/manageUser");
		pagineAdminVisibili.add("/admin/modifyAdmin");
		pagineAdminVisibili.add("/admin/editOrderState");
		pagineAdminVisibili.add("/admin/manageOrder");
		pagineAdminVisibili.add("/admin/ordersFilter");
	}
	
	private static final Set<String> pagineAdminHidden = new HashSet<String>();
	static {
		pagineAdminHidden.add("/admin/login");
	}
	
    /**
     * Default constructor. 
     */
    public AdminFilter() {
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        HttpSession session = req.getSession(false);
        String contextPath = req.getContextPath(); // /FratelliMuraca
        String requestURI = req.getRequestURI(); // /FratelliMuraca/paginaRichiesta

        // Rimuovi il context path iniziale se presente
        if (requestURI.startsWith(contextPath)) {
            requestURI = requestURI.replaceFirst("^" + contextPath, "");
        }
        
        // Verifica se la richiesta è per una pagina riservata agli utenti
        if (pagineAdminVisibili.contains(requestURI)) {
            if (session != null && session.getAttribute("admin") != null) {
                // Utente loggato, continua la catena di filtri
                chain.doFilter(request, response);
            } else {
                // Utente non loggato, reindirizza alla pagina di login
                res.sendRedirect(req.getContextPath() + "/admin/login");
            }
        }
        // Verifica se la richiesta contiene pagine non visibili all'utente
        else if (pagineAdminHidden.contains(requestURI)) {
        	if (session != null && session.getAttribute("admin") != null) {
        		// Utente loggato, blocca
        		res.sendRedirect(req.getContextPath() + "/admin/dashboard");
        	}
        	else {
        		// Utente non loggato, mostra
        		chain.doFilter(request, response);
        	}
        } else {
            // Se la pagina richiesta non è nella lista delle pagine riservate, continua normalmente
            chain.doFilter(request, response);
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
