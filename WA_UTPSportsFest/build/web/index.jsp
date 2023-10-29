<%-- 
    Document   : index
    Created on : 24 oct 2023, 15:46:37
    Author     : Juan Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logic.Settings"%>

<%
Settings settings = new Settings();
boolean autenticado = false;

if ("POST".equals(request.getMethod())) {
    String code = request.getParameter("user");
    String password = request.getParameter("pass");
    if (code != null && password != null) {
        autenticado = settings.autentificacion(code, password);
    }
}
%>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <link rel="icon" href="img/favicon.png" type="image/png">
        <script src="https://kit.fontawesome.com/c656e20060.js" crossorigin="anonymous" async></script>
        <title>UTPSportsFest</title>
    </head>
    <body>
        <div id="popup" class="contenedorPopup" style="<%= autenticado ? "" : "display: none;" %>">
            <div class="card">
                <img src="img/verificado.png" class="imagen-verificada">
                <p>
                    Has ingresado de manera correcta. ¡Bienvenido!
                </p>
                <button id="boton-aceptar" class="boton-aceptar">Aceptar</button>
            </div>
        </div>

        <script async>
            // Mostrar el popup solo si la autenticación es exitosa
            if (<%= autenticado %>) {
                document.getElementById("popup").style.display = "block";
            }

            // Manejar el clic en el botón "Aceptar" dentro del popup
            document.getElementById("boton-aceptar").addEventListener("click", function() {
                // Redirigir al dashboard si la autenticación es exitosa
                if (<%= autenticado %>) {
                    window.location.href = "dashboard.jsp";
                }
            });
        </script>
        <div class="contenedorPrincipal">
            <div class="ContenedorBlur"></div>
            <div class="contenido">
                <div class="panelIzquierdo">
                    <div class="logoEslogan">
                        <p class="logo">UTPSportsFest</p>
                        <p class="eslogan">“¡Donde los campeones se elevan!”</p>
                    </div>
                    <div class="redesSociales">
                        <a href="#"><i class="fa-brands fa-facebook"></i></a>
                        <a href="#"><i class="fa-brands fa-whatsapp"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                    </div>
                </div>
                <form class="panelDerecho" method="post" action="dashboard.jsp">
                    <p>Iniciar Sesión</p>
                    <div class="entradas">
                        <label for="user" style="color: #fff">Usuario</label>
                        <input type="text" id="user" name="user" required>
                        <label for="pass" style="color: #fff">Contraseña</label>
                        <input type="password" id="pass" name="pass" required>
                        <div class="invitadoRecuperar">
                            <a href="#">Ingresar como invitado</a>
                            <a href="#">¿Olvidaste tu contraseña?</a>
                        </div>
                    </div>
                    <input type="submit" value="Iniciar Sesión">
                </form>
            </div>
        </div>
    </body>
</html>
