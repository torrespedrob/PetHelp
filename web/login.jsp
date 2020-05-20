<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar sesión</title>
        <link rel="stylesheet" href="bootstrap.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="intro.css">
        <link href="https://fonts.googleapis.com/css?family=Baloo+Tamma+2|Montserrat|Raleway|Roboto&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/style.css">
    </head>
    <body>
        <%
            if (session.getAttribute("usuario") != null) {
                response.sendRedirect("index.jsp");
            }

        %>

        <div class="jumbotron">
            <h1 class="display-3">Iniciar sesión</h1>
            <p class="lead">Introduce tus credenciales para poder usar la aplicación</p>
            <hr class="my-4">
            <% 
                if (session.getAttribute("existeusuario")!=null) {
            %>
            <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>¡Error! </strong>Has intentado registrar un usuario que ya existe. Prueba a iniciar sesión.
            </div>
            
            <% 
            } 
            %>
            <form method="POST" action="checklogin.jsp">
                <div class="form-group">
                    <label for="ejemploNombre">Nombre de usuario:</label>
                    <input type="text" name="usuario" class="form-control"
                           placeholder="Introduce tu nombre de usuario" required>
                </div>
                <div class="form-group">
                    <label for="ejemploContrasena">Contraseña:</label>
                    <input type="password" name="contrasena" class="form-control"
                           placeholder="Introduce tu contraseña" required>
                </div>
                <button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
                <a href="index.jsp" class="btn btn-lg btn-secondary">Volver</a>
            </form>
            <br>
            ¿No tienes una cuenta? <a href="registro.jsp">Regístrate  </a>
        </div>

    </body>
</html>
