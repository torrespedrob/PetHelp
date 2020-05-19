<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  String NomRec = request.getParameter("NomRec");
  String DetRec = request.getParameter("DetRec");
  String UsuRec = request.getParameter("UsuRec");

  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  Statement s = conexion.createStatement();
  
ResultSet listado = s.executeQuery("SELECT * FROM recordatorio");
s.execute("INSERT INTO `recordatorio`(NomRec, DetRec, UsuRec) VALUE ('" + NomRec + "','" + DetRec + "','" + UsuRec + "')");
response.sendRedirect("recordatorios.jsp");
%>