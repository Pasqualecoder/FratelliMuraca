package control;


import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inizializzazione, se necessaria
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        // implementare role scrivendo una funzione in LoginUser per vedere se e' un utente o un admin in base a in quale tabella si trova 
        if (session == null || (boolean)session.getAttribute("admin") == false) {
            // Se l'utente non è admin, reindirizza alla pagina di accesso negato
            res.sendRedirect(req.getContextPath() + "/error.jsp");
        } else {
            // Se l'utente è admin, continua con la richiesta
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
       
    }
}
