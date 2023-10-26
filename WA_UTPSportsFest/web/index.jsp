<%-- 
    Document   : index
    Created on : 24 oct 2023, 15:46:37
    Author     : Juan Romero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class = "ContenedorBlur"></div>
            <div class="contenido">
            <div class = "panelIzquierdo">
                <div  class = "logoEslogan">
                    <p class="logo">UTPSportsFest</p>
                    <p class="eslogan">“¡Donde los campeones se elevan!”</p>
                </div>
                <div  class = "redesSociales">
                    <a href="#"><i class="fa-brands fa-facebook"></i></a>
                    <a href="#"><i class="fa-brands fa-whatsapp"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>
                </div>
            </div>
            <form class = "panelDerecho">
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
