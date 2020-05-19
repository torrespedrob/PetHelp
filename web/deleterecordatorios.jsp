<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pethelp", "root", "");
  Statement s = conexion.createStatement();
  
String CodRec = request.getParameter("CodRec");
s.execute("DELETE FROM recordatorio WHERE CodRec = '" + CodRec + "'");

response.sendRedirect("recordatorios.jsp");
%>