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
        <h1></h1>
        <div class="jumbotron">
            <h1 class="display-3">Iniciar sesión</h1>
            <p class="lead">Introduce tus credenciales para poder usar la aplicación</p>
            <hr class="my-4">
            <%                
                if (session.getAttribute("existeusuario") == "yaexiste") {
            %>
            <div class="alert alert-dismissible alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <strong>¡Error! </strong>Has intentado registrar un usuario que ya existe. Prueba a iniciar sesión.
            </div>
            <%
                session.setAttribute("existeusuario", "noexiste");
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
                <%
                    if (session.getAttribute("failedlogin") == "fallado") {
                %>
                <div class="alert alert-danger">
                    <strong>¡Error! </strong>Usuario o contraseña incorrectos
                </div>
                <%
                            
                            session.setAttribute("failedlogin", "");
                        }

                %>

                <button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
                <a href="index.jsp" class="btn btn-lg btn-secondary">Volver</a>
            </form>
            <br>
            ¿No tienes una cuenta? <a href="registro.jsp">Regístrate  </a>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
