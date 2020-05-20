<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar recordatorio</title>
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

      String CodRec = request.getParameter("CodRec");
      String NomRec = request.getParameter("NomRec");
      String DetRec = request.getParameter("DetRec");

    %>

    <div class="jumbotron">
      <h1 class="display-3">Editar recordatorio</h1>
      <p class="lead">Modifica los datos de tu recordatorio</p>
      <hr class="my-4">
      <form method="POST" action="updaterecordatorios.jsp">
        <input type="hidden" name="CodRec" value="<%=CodRec%>">
        <div class="form-group">
          <label for="ejemploNombre">Título:</label>
          <input type="text" name="NomRec" class="form-control"
                 placeholder="Edita su título" value="<%=NomRec%>" required>
        </div>
        <div class="form-group">
          <label for="ejemploEspecie">Descripción:</label>
          <input type="text" name="DetRec" class="form-control"
                 placeholder="Edita la descripción" value="<%=DetRec%>" required>
        </div>
        <button type="submit" class="btn btn-lg btn-primary">Aceptar</button>
        <a href="recordatorios.jsp" class="btn btn-lg btn-secondary">Volver</a>
      </form>
    </div>

  </body>
</html>