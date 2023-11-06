<%--
    Document   : dashboard
    Created on : 27 oct 2023, 22:56:05
    Author     : Juan Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="logic.Equipo" %>
<%@ page import="java.util.List" %>
<%@ page import="logic.Equipo" %>
<%@ page import="logic.EquipoDAO" %>
<%@page import="logic.EnfrentamientoDAO"%>
<%@page import="logic.Enfrentamiento"%>
<%@ page import="java.lang.Integer"%>

<%
    EquipoDAO equipoDAOA = new EquipoDAO();
    EquipoDAO equipoDAOB = new EquipoDAO();
    List<Equipo> equiposA = equipoDAOA.obtenerEquipos();
    List<Equipo> equiposB = equipoDAOB.obtenerEquipos();
    pageContext.setAttribute("equiposA", equiposA);
    pageContext.setAttribute("equiposB", equiposB);

    if ("POST".equals(request.getMethod())) {
        String idParam = request.getParameter("id");
        String fechaHora = request.getParameter("fechaHora");
        int equipoLocalID = Integer.parseInt(request.getParameter("equipo-a"));
        int equipoVisitanteID = Integer.parseInt(request.getParameter("equipo-b"));
        int deporteID = Integer.parseInt(request.getParameter("tipo-deporte"));
        String estado = request.getParameter("estado");
        Enfrentamiento enfrentamiento = new Enfrentamiento();
        // Realiza la inserción en la base de datos (puedes usar tu método insertarEnfrentamiento)
        EnfrentamientoDAO enfrentamientoDAO = new EnfrentamientoDAO();
        enfrentamientoDAO.actualizarEnfrentamiento(Integer.parseInt(idParam) ,fechaHora, equipoLocalID, equipoVisitanteID, deporteID, estado);

        // Redirige al usuario a "panel_de_control.jsp" después de la inserción
        // response.sendRedirect("panel_de_control.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <link rel="stylesheet" href="style_agregar_enfrentamientos.css">
        <script src="https://kit.fontawesome.com/c656e20060.js" crossorigin="anonymous" async></script>
        <title>Editar enfrentamientos | UTPSportsFest</title>
    </head>
    <body>
        <!-- POPUP para poder insertar en la tabla de enfrentamientos -->
        <div id="popupInsertarEnfrentamientos" class="contenedor-popup">
            <form class="card" method="POST">
                <div class="encabezado">
                    <p>Editar enfrentamientos</p>
                    <i id="regresarPanelControl" class="fa-solid fa-circle-left"></i>
                </div>
                <label for="equipo-a" style="color: #0174BE">Equipo A</label>
                <select name="equipo-a" id="equipo-a" required>
                    <option value="">Selecciona un equipo</option> <!-- Opción predeterminada -->
                    <c:forEach items="${equiposA}" var="equipoA">
                        <option value="${equipoA.id}">${equipoA.nombreEquipo}</option>
                    </c:forEach>
                </select>

                <label for="equipo-b" style="color: #0174BE">Equipo B</label>
                <select name="equipo-b" id="equipo-b" required>
                    <option value="">Selecciona un equipo</option> <!-- Opción predeterminada -->
                    <c:forEach items="${equiposB}" var="equipoB">
                        <option value="${equipoB.id}">${equipoB.nombreEquipo}</option>
                    </c:forEach>
                </select>
                <label for="tipo-deporte" style="color: #0174BE">Tipo deporte</label>
                <select name="tipo-deporte" id="tipo-deporte" required>
                    <option value="">Selecciona un deporte</option>
                    <option value="1">Football</option>
                    <option value="2">Volley</option>
                    <option value="3">Basket</option>
                </select>
                <label for="fechaHora" style="color: #0174BE">Fecha y hora</label>
                <input type="datetime-local" id="fechaHora" name="fechaHora" required>
                <label for="estado" style="color: #0174BE">Estado</label>
                <select name="estado" id="estado" required>
                <option value="">Selecciona un estado</option>
                    <option value="C">Completo</option>
                    <option value="E">En Proceso</option>
                    <option value="P">Pendiente</option>
                </select>
                <input type="submit" value="Guardar">
            </form>
        </div>
        <script src="script_agregar_enfrentamientos.js"></script>
    </body>
</html>
