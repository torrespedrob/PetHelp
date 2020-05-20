<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
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
      <h1 class="display-3">Registro</h1>
      <p class="lead">Introduce tus datos para registrarte en la aplicación</p>
      <hr class="my-4">
      <form method="POST" action="checkregistro.jsp">
        <div class="form-group">
          <label for="ejemploUsuario">Nombre de usuario:</label>
          <input type="text" name="usuario" class="form-control"
                 placeholder="Introduce tu nombre de usuario" required>
        </div>
        <div class="form-group">
          <label for="ejemploContrasena">Contraseña:</label>
          <input type="password" name="contrasena" class="form-control"
                 placeholder="Introduce tu contraseña" required>
        </div>
        <div class="form-group">
          <label for="ejemploCorreo">Correo electrónico:</label>
          <input type="text" name="correo" class="form-control"
                 placeholder="Introduce tu correo electrónico" required>
        </div>
          <button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
          <a href="index.jsp" class="btn btn-lg btn-secondary">Volver</a>
      </form>
      <br>
      ¿Ya estás registrado? <a href="login.jsp">Inicia sesión</a>
    </div>

  </body>
</html>