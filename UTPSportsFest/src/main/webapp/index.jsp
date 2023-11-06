<%--
    Document   : index
    Created on : 24 oct 2023, 15:46:37
    Author     : Juan Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="logic.Settings"%>
<%@page import="logic.Usuario"%>

<%
Settings settings = new Settings();
boolean autenticado = false;
boolean error = false;

if ("POST".equals(request.getMethod())) {
    String code = request.getParameter("user");
    String password = request.getParameter("pass");
    Usuario usuario = new Usuario(code, password);
    autenticado = settings.autentificacion(code, password);

    // Mostrar un atributo en la sesión para indicar que la autenticación fue errónea
    if (!autenticado) {
        error = true;
        session.setAttribute("error", true);
    } else {
        // Almacenar el código de usuario en la sesión para su uso posterior
        session.setAttribute("codigoUsuario", code);
        // Mostrar un atributo en la sesión para indicar que la autenticación fue exitosa
        session.setAttribute("autenticado", true);
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
            <form class="panelDerecho" method="post">
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

    <!-- Agregar el código del popup de verificación -->
    <div id="popup-exitoso" class="contenedorPopup" style="<%= autenticado ? "" : "display: none;" %>">
        <div class="card">
            <img src="img/verificado.png" class="imagen-verificada">
            <p>
                Has ingresado de manera correcta. ¡Bienvenido!
            </p>
            <button id="boton-aceptar" class="boton-aceptar">Aceptar</button>
        </div>
    </div>
    <!-- Agregar el código del popup de error -->

    <div id="popup-error" class="contenedorPopup" style="<%= error ? "" : "display: none;" %>">
        <div class="card">
            <img src="img/error.png" class="imagen-error">
            <p>
                Error haz ingresado de manera errónea tu contraseña o usuario.
            </p>
            <button id="boton-error" class="boton-error">Aceptar</button>
        </div>
    </div>

    <script async>
        // Mostrar el popup solo si la autenticación es exitosa
        if (<%= autenticado %>) {
            document.getElementById("popup-exitoso").style.display = "block";
        }else if (<%= error %>){
            document.getElementById("popup-error").style.display = "block";
        }

        // Manejar el clic en el botón "Aceptar" dentro del popup
        document.getElementById("boton-aceptar").addEventListener("click", function() {
            // Redirigir al dashboard si la autenticación es exitosa
            if (<%= autenticado %>) {
                window.location.href = "panel_de_control.jsp";
            }
        });

        // Manejar el clic en el botón "error" dentro del popup
        document.getElementById("boton-error").addEventListener("click", function() {
            // Redirigir al dashboard si la autenticación es erronea
            if (<%= error %>) {
                document.getElementById("popup-error").style.display = "none";
                window.location.href = "/UTPSportsFest";
            }
        });
    </script>
</body>
</html>
