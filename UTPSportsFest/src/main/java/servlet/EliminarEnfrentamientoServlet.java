package servlet;

import logic.EnfrentamientoDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/eliminarEnfrentamiento")
public class EliminarEnfrentamientoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            EnfrentamientoDAO enfrentamientoDAO = new EnfrentamientoDAO();
            boolean eliminado = enfrentamientoDAO.eliminarEnfrentamiento(id);
            if (eliminado) {
                // Aquí puedes redirigir a otra página o enviar una respuesta al cliente
                response.sendRedirect("/panel_de_control.jsp");
            } else {
                // Aquí puedes manejar el caso en que la eliminación no fue exitosa
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo eliminar el enfrentamiento");
            }
        } else {
            // Aquí puedes manejar el caso en que el parámetro "id" no está presente en la solicitud
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "No se proporcionó un ID de enfrentamiento");
        }
    }
}
