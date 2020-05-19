<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  Statement s = conexion.createStatement();
  
String usuario = request.getParameter("usuario");
s.execute("DELETE FROM usuario WHERE NomUsu = '" + usuario + "'");

session.invalidate();
response.sendRedirect("index.jsp");
%>