package filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class JSPBlockerFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Blocca l'accesso ai file JSP
        httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Accesso Vietato");
    }

    @Override
    public void destroy() {
    }
}
