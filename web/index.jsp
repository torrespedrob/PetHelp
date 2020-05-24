<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>PetHelp</title>
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

                </ul>
            </div>
        </nav>


        <header>
            <div class="overlay"></div>
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
                <source src="assets/app.mp4" type="video/mp4">
            </video>
            <div class="container h-100">
                <div class="d-flex h-100 text-center align-items-center">
                    <div class="w-100 text-white">
                        <h1>Bienvenido a PetHelp</h1>
                        <p class="lead mb-0">Su gestor de mascotas y recordatorios</p><br>
                        <%
                            if (session.getAttribute("usuario") == null) {
                        %>
                        <a href="login.jsp" class="btn btn-success btn-lg"><i class="las la-sign-in-alt"></i> Iniciar sesión</a>
                        <a href="registro.jsp" class="btn btn-primary"><i class="las la-user-plus"></i> Crear cuenta</a>
                        <%
                        } else {
                            session.setAttribute("existeusuario", "");
                            session.setAttribute("failedlogin", "");
                        %>
                        <a href="mascotas.jsp" class="btn btn-success btn-lg"><i class="las la-dog"></i> Mis mascotas</a>
                        <a href="recordatorios.jsp" class="btn btn-primary btn-lg"><i class="las la-book"></i> Mis recordatorios</a><br><br>

                        <hr>

                        Logueado como <a href="mascotas.jsp"><%= session.getAttribute("usuario")%></a>
                        <a href="logout.jsp" class="btn btn-secondary btn-lg"><i class="las la-running"></i> Cerrar sesión</a><br><br>
                        <form method="POST" action="deleteusuario.jsp">
                            <input type="hidden" name="usuario" value=<%=session.getAttribute("usuario")%>>
                            <button type="submit" class="btn btn-danger"><i class="las la-exclamation-triangle"></i> Darse de baja <i class="las la-exclamation-triangle"></i></button>
                        </form>

                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </header>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    </body>
    <footer style="text-align: center; padding: 20px">
        <p>Aplicación realizada por <a href="https://github.com/torrespedrob/PetHelp">Pedro Torres <i class="lab la-github"></i></a></p>
    </footer>
</html>