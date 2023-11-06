package servlet;

import logic.Enfrentamiento;
import logic.EnfrentamientoDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/actualizarEnfrentamientoServlet")
public class ActualizarEnfrentamientoServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        System.out.println(idParam);
        if (idParam != null) {
            // Convertir el parámetro "id" a un entero si es necesario
            int id = Integer.parseInt(idParam);

            // Realizar las operaciones necesarias con el ID
            // Esto podría incluir cargar datos relacionados con el ID desde la base de datos
            // y almacenarlos en el objeto de solicitud para que estén disponibles en la página JSP
            // Después, puedes redirigir al usuario a la página "editar_enfrentamiento.jsp"
            Enfrentamiento enfrentamiento = new Enfrentamiento(id);
        } else {
            // Manejar el caso en el que no se proporcionó un ID en la URL
        }
    }
}
