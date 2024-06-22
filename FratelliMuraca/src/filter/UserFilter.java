package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

/**
 * Servlet Filter implementation class UserFilter
 */
@WebFilter("/UserFilter")
public class UserFilter implements Filter {

	private static final Set<String> pagineUserVisibili = new HashSet<String>();
	static {
		pagineUserVisibili.add("/account");
		pagineUserVisibili.add("/order");
		pagineUserVisibili.add("/modificaDati");
		pagineUserVisibili.add("/addReview");
	}
	
	private static final Set<String> pagineUserHidden = new HashSet<String>();
	static {
		pagineUserHidden.add("/login");
		pagineUserHidden.add("/register");
	}
	
    /**
     * Default constructor. 
     */
    public UserFilter() {
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
        if (pagineUserVisibili.contains(requestURI)) {
            if (session != null && session.getAttribute("user") != null) {
                // Utente loggato, continua la catena di filtri
                chain.doFilter(request, response);
            } else {
                // Utente non loggato, reindirizza alla pagina di login
                res.sendRedirect(req.getContextPath() + "/login");
            }
        }
        // Verifica se la richiesta contiene pagine non visibili all'utente
        else if (pagineUserHidden.contains(requestURI)) {
        	if (session != null && session.getAttribute("user") != null) {
        		// Utente loggato, blocca
        		res.sendRedirect(req.getContextPath() + "/account");
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
