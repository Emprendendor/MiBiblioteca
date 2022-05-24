<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%

	String isbn = request.getParameter("isbn");
	String titulo = request.getParameter("titulo");
	String categoria = request.getParameter("categoria");
	Connection conexion = null;	

	Statement sentencia = null;
  	String url = "jdbc:mysql://localhost:3306/negocio?autoReconnect=true&useSSL=false"; 
    String usuario = "root";
    String Pas     = "point2020";
    String clave =  Pas;

int filas=0;
try {
//2



Class.forName("com.mysql.jdbc.Driver");
conexion = DriverManager.getConnection( url, "root", clave);
sentencia = conexion.createStatement();
System.out.println("Cargado driver");
//3

String consultaSQL = "insert into Libros (isbn,titulo,categoria) values ";
consultaSQL += "('" + isbn + "','" + titulo + "','" + categoria + "')";

//4
filas = sentencia.executeUpdate(consultaSQL);

System.out.println("Saltar a listado");

// Control de flujo al siguiente pantalla

response.sendRedirect("MostrarLibros.jsp");

} catch (ClassNotFoundException e) {
	System.out.println("Error en la carga del driver"  + e.getMessage());
	
	
} catch (SQLException e) {

	System.out.println("Error accediendo a la base de datos" + e.getMessage());
} finally {
//5

if (sentencia != null) {
try {sentencia.close();}
catch (SQLException e)
{System.out.println("Error cerrando la sentencia" +
e.getMessage());}
}
if (conexion != null) {
try {conexion.close();}
catch (SQLException e)
{System.out.println("Error cerrando la conexion" +
e.getMessage());}
}
}%>

</body>
</html>
