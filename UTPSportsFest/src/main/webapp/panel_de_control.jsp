<%--
    Document   : dashboard
    Created on : 27 oct 2023, 22:56:05
    Author     : Juan Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="logic.EnfrentamientoDAO"%>
<%@page import="logic.Enfrentamiento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="logic.RecordatorioDAO"%>
<%@page import="logic.Recordatorio"%>
<%@page import="logic.Usuario"%>
<%@page import="logic.UsuarioDAO"%>
<%@ page import="java.lang.Integer"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
   EnfrentamientoDAO enfrentamientoDAO = new EnfrentamientoDAO();
   List<Enfrentamiento> enfrentamientos = enfrentamientoDAO.obtenerEnfrentamientos();
   pageContext.setAttribute("enfrentamientos", enfrentamientos);

   // Obtener el usuario actual (asegúrate de que el usuario ya esté autenticado)
   String codigoUsuario = (String) request.getSession().getAttribute("codigoUsuario");

   // Verificar si el usuario está autenticado
   RecordatorioDAO recordatorioDAO = new RecordatorioDAO();
   List<Recordatorio> recordatorios = recordatorioDAO.obtenerRecordatoriosPorUsuario(codigoUsuario);
   pageContext.setAttribute("recordatorios", recordatorios);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <link rel="stylesheet" href="style_dashboard.css">
        <script src="https://kit.fontawesome.com/c656e20060.js" crossorigin="anonymous" async></script>
        <title>Panel de control | UTPSportsFest</title>
    </head>
    <body>
        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class="fa-solid fa-volleyball"></i>
                <span class="text">UTPSportsFest</span>
            </a>
            <ul class="side-menu top">
                <li class="active">
                    <a href="#">
                        <i class="fa-solid fa-solar-panel"></i>
                        <span class="text">Panel de control</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-people-group"></i>
                        <span class="text">Equipos</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-chart-simple"></i>
                        <span class="text">Análisis</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-calendar-days"></i>
                        <span class="text">Cronograma</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-bezier-curve"></i>
                        <span class="text">Fixture</span>
                    </a>
                </li>
            </ul>
            <ul class="side-menu">
                <li>
                    <a href="#">
                        <i class="fa-solid fa-sliders"></i>
                        <span class="text">Configuraciones</span>
                    </a>
                </li>
                <li>
                    <a href="index.jsp" class="logout">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <span class="text">Cerrar sesión</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- SIDEBAR -->

        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class="fa-solid fa-bars"></i>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Buscar...">
                        <button type="submit" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </form>
                <input type="checkbox" id="switch-mode" hidden>
                <label for="switch-mode" class="switch-mode"></label>
                <a href="#" class="notification">
                    <i class="fa-solid fa-envelope"></i>
                    <span class="num">8</span>
                </a>
                <a href="#" class="profile">
                    <img src="img/masculino.png">
                </a>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Panel de control</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#">Panel de control</a>
                            </li>
                            <li><i class="fa-solid fa-caret-right"></i></li>
                            <li>
                                <a class="active" href="#">Inicio</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <ul class="box-info">
                    <li>
                        <i class="fa-solid fa-ranking-star"></i>
                        <span class="text">
                            <h3>#1</h3>
                            <p>Primer Puesto</p>
                        </span>
                    </li>
                    <li>
                        <i class="fa-solid fa-star-half-stroke"></i>
                        <span class="text">
                            <h3>#2</h3>
                            <p>Segundo puesto</p>
                        </span>
                    </li>
                    <li>
                        <i class="fa-solid fa-tornado"></i>
                        <span class="text">
                            <h3>#3</h3>
                            <p>Tercer puesto</p>
                        </span>
                    </li>
                </ul>


                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Enfrentamientos</h3>
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <i id="AgregarEnfrentamientos" class="fa-solid fa-square-plus"></i>
                            <i class="fa-solid fa-filter"></i>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Equipos A</th>
                                    <th>Equipos B</th>
                                    <th>Fecha de enfrentamiento</th>
                                    <th>Tipo de deporte</th>
                                    <th>Estado</th>
                                    <th>Editar</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${enfrentamientos}" var="enfrentamiento">
                                    <tr>
                                        <td>
                                            <img id="equipoLocalImage" src="img/${enfrentamiento.equipoLocal}.png" onerror="this.src='img/unknown.png'">
                                            <p>${enfrentamiento.equipoLocal}</p>
                                        </td>
                                        <td>
                                            <img id="equipoVisitanteImage" src="img/${enfrentamiento.equipoVisitante}.png" onerror="this.src='img/unknown.png'">
                                            <p>${enfrentamiento.equipoVisitante}</p>
                                        </td>
                                        <td>${enfrentamiento.fechaHora.replace(":00.0","").replace(" ", " ↭ ")}</td>
                                        <td><span class="status ${enfrentamiento.deporte}">${enfrentamiento.deporte}</span></td>
                                        <td><span class="status ${enfrentamiento.estado}">${enfrentamiento.estado}</span></td>
                                        <td>
                                            <i class="fa-solid fa-pen edit-icon" data-id="${enfrentamiento.id}"></i>
                                        </td>
                                        <td>
                                            <i class="fa-solid fa-trash-can" id="${enfrentamiento.id}" onclick="eliminarEnfrentamiento(this.id)"></i>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="recordatorio">
                        <div class="head">
                            <h3>Recordatorio</h3>
                            <i class="fa-solid fa-square-plus"></i>
                            <i class="fa-solid fa-filter"></i>
                        </div>
                        <ul class="recordatorio-list">
                            <c:forEach items="${recordatorios}" var="recordatorio">
                                <li class="${recordatorio.estado}">
                                    <p>${recordatorio.titulo}</p>
                                    <i class="fa-solid fa-ellipsis-vertical" onclick="toggleMenu(this)"></i>
                                    <ul class="menu-options">
                                      <li class="btn-editar"><a href="#">Editar</a></li>
                                      <li class="btn-eliminar"><a href="#">Eliminar</a></li>
                                    </ul>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->

        <script>
            document.getElementById('openPopupButtonInsertarEnfrentamientos').addEventListener('click', function() {
                document.getElementById('popupInsertarEnfrentamientos').style.display = 'block';
            });

            document.getElementById('closePopupInsertarEnfrentamientos').addEventListener('click', function() {
                document.getElementById('popupInsertarEnfrentamientos').style.display = 'none';
            });

        </script>

        <script src="script.js"></script>
    </body>
</html>
