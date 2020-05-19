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
    <title>Mascotas</title>
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
    <!--Datos sugeridos para los select-->
    <datalist id="especies">
      <option>Perro</option>
      <option>Gato</option>
      <option>Ave</option>
      <option>Caballo</option>
    </datalist>
    <datalist id="raza">
      <option>Labrador</option>
      <option>Pastor Alemán</option>
      <option>Dálmata</option>
      <option>Persa</option>
    </datalist>
    <!--Fin de navbar-->

    <!--Expulsa a los usuarios no logueados-->
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
      Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
      Statement x = conexion2.createStatement();
      ResultSet listado = x.executeQuery("SELECT CodMas, NomMas, TipoMas, RazaMas, UsuMas FROM mascota m JOIN usuario u ON m.UsuMas=u.CodUsu "
              + "WHERE UsuMas = '" + session.getAttribute("codigo") + "'");
    %>
    <table class="table table-striped" style="text-align: center">
      <tr><th>Nombre</th><th>Especie</th><th>Raza</th></tr>
      <form method="POST" action="grabamascotas.jsp">
        <tr>
          <td><input type="text" name="NomMas" size="10" required="true"></td>
          <td><input list="especies" type="text" name="TipoMas" size="18" required="true"></td>
          <td><input list="raza" type="text" name="RazaMas" size="18"></td>
        <input hidden="true" type="text" name="UsuMas" value="<%=session.getAttribute("codigo")%>"></td>
        <td><button type="submit" value="Nuevo" class="btn btn-primary"><i class="las la-plus-circle"></i> Añadir</button></td>
        </tr>
      </form>
    </table>
    <hr>
    <h3 style="text-align: center">Listado de mis mascotas</h2>
    <div style="padding: 20px 20px 20px;">
        <table class="table table-striped" style="text-align: center; padding: 0 auto;">
      <tr><th>Nombre</th><th>Especie</th><th>Raza</th></tr>
          <%
            while (listado.next()) {
          %>
      <tr>
        <td><%=listado.getString("NomMas")%></td>
        <td><%=listado.getString("TipoMas")%></td>
        <td><%=listado.getString("RazaMas")%></td>
        <td style="width: 10%">
          <form method="POST" action="editamascotas.jsp">
            <input type="hidden" name="CodMas" value="<%=listado.getString("CodMas")%>">
            <input type="hidden" name="NomMas" value="<%=listado.getString("NomMas")%>">
            <input type="hidden" name="TipoMas" value="<%=listado.getString("TipoMas")%>">
            <input type="hidden" name="RazaMas" value="<%=listado.getString("RazaMas")%>">
            <button type="submit" class="btn btn-warning"><i class="las la-pencil-alt"></i> Editar</button>
          </form>
        </td>
        <td style="width: 10%">
          <form method="POST" action="deletemascotas.jsp">
            <input type="hidden" name="CodMas" value="<%=listado.getString("CodMas")%>">
            <button type="submit" class="btn btn-danger"><i class="las la-pencil-alt"></i> Borrar</button>
          </form>
        </td>
      </tr><%
      }

      conexion2.close();
    %>
    </table>
    </div>
    
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
<footer style="text-align: center; padding: 20px">
  <p>Aplicación realizada por <a href="https://github.com/torrespedrob/PetHelp">Pedro Torres <i class="lab la-github"></i></a></p>
</footer>
</html>
