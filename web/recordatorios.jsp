<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Expulsa a los usuarios no logueados-->
<%
  if (session.getAttribute("usuario") == null) {
    response.sendRedirect("index.jsp");
  }
%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recordatorios</title>
    <link rel="stylesheet" href="bootstrap.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="intro.css">
    <link href="https://fonts.googleapis.com/css?family=Baloo+Tamma+2|Montserrat|Raleway|Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/style.css">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand" href="index.jsp"><i class="las la-paw"></i> PetHelp <i class="las la-paw"></i></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarColor02">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="mascotas.jsp">Mascotas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="recordatorios.jsp">Recordatorios</a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn-secondary" href="logout.jsp">Cerrar sesión</a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- Fin de navbar-->
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
      Statement s = conexion.createStatement();

      ResultSet consulta = s.executeQuery("SELECT * FROM usuario WHERE NomUsu = '" + session.getAttribute("usuario") + "'");
      while (consulta.next()) {
        session.setAttribute("codigo", consulta.getString("CodUsu"));
    %>

    <%
      }

      conexion.close();
    %>
    <%
      Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
      Statement x = conexion3.createStatement();
      ResultSet listado = x.executeQuery("SELECT CodRec, NomRec, DetRec, UsuRec FROM recordatorio r JOIN usuario u ON r.UsuRec=u.CodUsu "
              + "WHERE UsuRec = '" + session.getAttribute("codigo") + "'");
    %>

    <div style="padding: 16px 500px">
      <div class="card border-primary mb-3" style="max-width: 20rem;">
        <div class="card-header">Nuevo recordatorio</div>
        <div class="card-body">
          <form method="POST" action="grabarecordatorios.jsp">
            <label for="ejemploNombre">Título:</label>
            <input type="text" name="NomRec" class="form-control"
                   placeholder="Ej: Visita" required>
            <br>
            <label for="ejemploDetalle">Descripción:</label>
            <input type="text" name="DetRec" class="form-control"
                   placeholder="Ej: Vacunar a Toby el 25" required>
            <br>
            <input hidden="true" type="text" name="UsuRec" value="<%=session.getAttribute("codigo")%>"></td>
            <button type="submit" class="btn btn-primary"><i class="las la-plus-circle"></i> Añadir</button>
          </form>
        </div>
      </div>
    </div>

    <h3 style="text-align: center">Mis recordatorios</h3><hr>

    <%
      while (listado.next()) {
    %>
    <table>
      <tr>
        <td>
          <div class="card text-white bg-primary mb-3" style="max-width: 20rem; left: 500px">
            <div class="card-header" style="font-weight: bold"><%=listado.getString("NomRec")%></div>
            <div class="card-body">
              <p class="card-text"><%=listado.getString("DetRec")%></p>
            </div>
            <form method="POST" action="editarecordatorios.jsp" style="text-align: center">
              <input type="hidden" name="CodRec" value="<%=listado.getString("CodRec")%>">
              <input type="hidden" name="NomRec" value="<%=listado.getString("NomRec")%>">
              <input hidden="true" type="text" name="DetRec" value="<%=listado.getString("DetRec")%>">
              <button type="submit" class="btn btn-success"><i class="las la-pencil-alt"></i> Editar</button>
            </form>
              <br>
              <form method="POST" action="deleterecordatorios.jsp" style="text-align: center">
              <input type="hidden" name="CodRec" value="<%=listado.getString("CodRec")%>">
              <button type="submit" class="btn btn-danger"><i class="las la-pencil-alt"></i> Borrar</button>
            </form>
          </div>
        </td>
        <td>

        </td>
      </tr>
    </table>


    <%
      }

      conexion3.close();
    %>



    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </body>

</html>
