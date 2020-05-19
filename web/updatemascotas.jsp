<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  Statement s = conexion.createStatement();

  String CodMas = request.getParameter("CodMas");
  String NomMas = request.getParameter("NomMas");
  String TipoMas = request.getParameter("TipoMas");
  String RazaMas = request.getParameter("RazaMas");

  s.execute("UPDATE mascota SET NomMas = '" + NomMas + "', TipoMas = '" + TipoMas + "', RazaMas = '" + RazaMas + "'"
          + "WHERE CodMas = '" + CodMas + "'");
response.sendRedirect("mascotas.jsp");
%>
