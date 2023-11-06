//package filter;
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebFilter("/*")
//public class AuthenticationFilter implements Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // Puedes realizar una inicialización aquí si es necesario.
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        HttpSession session = httpRequest.getSession();
//
//        // Verifica si el usuario está autenticado (puedes ajustar esta lógica según tus necesidades).
//        boolean isAuthenticated = session.getAttribute("user") != null; // Aquí asumimos que "user" es un atributo de sesión que se establece después de la autenticación.
//
//        String requestURI = httpRequest.getRequestURI();
//        // Permitir el acceso a recursos estáticos (archivos CSS, imágenes, etc.)
//        if (requestURI.endsWith(".css") || requestURI.endsWith(".jpg") || requestURI.endsWith(".png") || requestURI.endsWith(".jpeg") || requestURI.endsWith(".gif") || requestURI.endsWith(".webp")) {
//            chain.doFilter(request, response);
//        } else if (isAuthenticated || httpRequest.getRequestURI().endsWith("index.jsp")) {
//            // Si el usuario está autenticado o está accediendo a index.jsp, permite que continúe.
//            chain.doFilter(request, response);
//        } else {
//            // El usuario no está autenticado y no está accediendo a index.jsp, redirige a la página de inicio.
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.jsp");
//        }
//    }
//
//    @Override
//    public void destroy() {
//        // Puedes realizar tareas de limpieza aquí si es necesario.
//    }
//}
