<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Libros</title>
</head>

<body>

<%
 
String url = "jdbc:mysql://localhost:3306/negocio?autoReconnect=true&useSSL=false"; 
String usuario = "root";
String Pas     = "point2020";
String clave =  Pas;

Connection conexion=null;
Statement sentencia=null;
ResultSet rs=null;
try {
Class.forName("com.mysql.jdbc.Driver");
//1
conexion =
DriverManager.getConnection( url, "root",clave);
sentencia= conexion.createStatement();
//2
String consultaSQL= "select isbn,titulo,categoria from Libros";
//3 y 4
rs=sentencia.executeQuery(consultaSQL);
//5

%>
		<table  align="center"  border=1 >
		<caption> Biblioteca Pública</caption>
		<tr>
			<th  style="width:100px" >ISBN</th>
			<th style="width:200px"> Titulo</th>
			<th style="width:200px" >Categoria</th>
			
		</tr>
<% 
while(rs.next()) { %>

		<tr>
			<td> <%=rs.getString("isbn")%> </td>
			<td> <%=rs.getString("titulo")%> </td>
			<td> <%=rs.getString("categoria")%>  </td>
		</tr>
<% }


} catch (ClassNotFoundException e) {
	System.out.println("Error en la carga del driver" + e.getMessage() );
}catch (SQLException e) {
	System.out.println("Error accediendo a la base de datos" + e.getMessage());
}
finally {
//6
if (rs != null) {
try {rs.close();} catch (SQLException e)
{System.out.println("Error cerrando el resultset" + e.getMessage());}
}
if (sentencia != null) {
try {sentencia.close();} catch (SQLException e)
{System.out.println("Error cerrando la sentencia" + e.getMessage());}
}
if (conexion != null) {
try {conexion.close();} catch (SQLException e)
{System.out.println("Error cerrando la conexion" + e.getMessage());}
}
}
%>


		</table>


<a href="Formulariolibro01.html">Insertar Libro</a>
</body>

</html>