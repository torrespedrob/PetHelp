<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String NomMas = request.getParameter("NomMas");
  String TipoMas = request.getParameter("TipoMas");
  String RazaMas = request.getParameter("RazaMas");
  String UsuMas = request.getParameter("UsuMas");

  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  Statement s = conexion.createStatement();
  
ResultSet listado = s.executeQuery("SELECT * FROM mascota");
s.execute("INSERT INTO `mascota`(NomMas, TipoMas, RazaMas, UsuMas) VALUE ('" + NomMas + "','" + TipoMas + "','" + RazaMas + "','" + UsuMas + "')");
response.sendRedirect("mascotas.jsp");
%>
