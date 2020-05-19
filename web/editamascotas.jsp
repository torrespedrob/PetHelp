<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar mascota</title>
    <link rel="stylesheet" href="bootstrap.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="intro.css">
    <link href="https://fonts.googleapis.com/css?family=Baloo+Tamma+2|Montserrat|Raleway|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
  </head>
  <body>
    <%
      if (session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
      }

      String CodMas = request.getParameter("CodMas");
      String NomMas = request.getParameter("NomMas");
      String TipoMas = request.getParameter("TipoMas");
      String RazaMas = request.getParameter("RazaMas");


    %>

    <div class="jumbotron">
      <h1 class="display-3">Editar mascota</h1>
      <p class="lead">Modifica los datos de tu mascota</p>
      <hr class="my-4">
      <form method="POST" action="updatemascotas.jsp">
        <input type="hidden" name="CodMas" value=<%=CodMas%>>
        <div class="form-group">
          <label for="ejemploNombre">Nombre:</label>
          <input type="text" name="NomMas" class="form-control"
                 placeholder="Edita su nombre" value=<%=NomMas%> required>
        </div>
        <div class="form-group">
          <label for="ejemploEspecie">Especie:</label>
          <input type="text" name="TipoMas" class="form-control"
                 placeholder="Edita su especie" value=<%=TipoMas%> required>
        </div>
        <div class="form-group">
          <label for="ejemploRaza">Raza:</label>
          <input type="text" name="RazaMas" class="form-control"
                 placeholder="Edita su raza" value=<%=RazaMas%>>
        </div>
        <button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
        <a href="mascotas.jsp" class="btn btn-lg btn-secondary">Volver</a>
      </form>
    </div>

  </body>
</html>