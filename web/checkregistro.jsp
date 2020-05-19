<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String usuario;
  String contrasena;
  String correo;

  MessageDigest md = MessageDigest.getInstance("MD5");

  
  usuario = request.getParameter("usuario");
  contrasena = request.getParameter("contrasena");
  correo = request.getParameter("correo");

  md.update(request.getParameter("contrasena").getBytes());
  String hash = DatatypeConverter.printHexBinary(md.digest());
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  Statement s = conexion.createStatement();
  ResultSet listado = s.executeQuery("SELECT * FROM usuario");
  String codigoUsuario = "";

  ArrayList <String> usuarios = new ArrayList ();
  while (listado.next()) {
    String nombreUsuario = listado.getString("NomUsu");
    codigoUsuario = listado.getString("CodUsu");
    usuarios.add(nombreUsuario);
  }
  
  if (usuarios.contains(usuario)) {
    response.sendRedirect("login.jsp");
  } else {
    session.setAttribute("usuario", usuario);
    session.setAttribute("codigoUsuario", codigoUsuario);
    s.execute("INSERT INTO `usuario`(NomUsu,ConUsu,CorUsu) VALUE ('" + usuario + "','" + hash + "','" + correo +"')");
      response.sendRedirect("index.jsp");
  }

%>