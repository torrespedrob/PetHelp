<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String usuario = request.getParameter("usuario");
  String contrasena = request.getParameter("contrasena");
 
  //Encriptación
  MessageDigest md = MessageDigest.getInstance("MD5");
  md.update(request.getParameter("contrasena").getBytes());
  String hash = DatatypeConverter.printHexBinary(md.digest());

  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  HashMap<String, String> usuarios = new HashMap();
  Statement s = conexion.createStatement();
  ResultSet listado = s.executeQuery("SELECT * FROM usuario");
  
  while (listado.next()) {
    String nombreUsuario = listado.getString("NomUsu");
    String contrasenaUsuario = listado.getString("ConUsu");
    usuarios.put(nombreUsuario, contrasenaUsuario);
  }

  if (usuarios.containsKey(usuario) && (usuarios.get(usuario).equals(hash))) {
    session.setAttribute("usuario", usuario);
    response.sendRedirect("index.jsp");
  } else {
    response.sendRedirect("index.jsp");
  }

%>
