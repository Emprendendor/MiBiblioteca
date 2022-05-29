<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>





<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript"  >  

function validacion() {
var isbn= document.getElementById("isbn");
var miformulario=document.getElementById("miformulario");
if(isbn.value==""){
alert("datos no validos");
return false;
}else{
miformulario.submit();
}
}
</script>
</head>
<body>

<% 
String isbn =  request.getParameter("isbn"); 
String titulo =  "";
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
conexion = DriverManager.getConnection( url, "root",clave);
sentencia= conexion.createStatement();
//2
String consultaSQL= "select isbn,titulo,categoria from Libros  where  isbn='"+ isbn+"'";   
//3 y 4
rs=sentencia.executeQuery(consultaSQL);
 

%>
 
<form id="miformulario" action="ControladorE" method="GET">
 		<h1>   Editar libros   </h1>
 
<% 
while(rs.next()) { %>

  
 

	 <p><label for="isbn">ISBN:</label>   <input id="isbn" type="text" name="isbn"  value="<%=rs.getString("isbn")%>"/></p>
	 <p> <label for="titulo">Titulo:</label>
<input id="titulo" type="text" name= "titulo"  value="<%=rs.getString("titulo")%>"/>
</p><p>
<label for="categoria">Categoria :</label>
<input id="categoria" type="text" name="categoria"  value="<%=rs.getString("categoria")%>" />
</p>
<input type="button" value="Editar" onclick="validacion()">
</form>




		
		
		
		
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





</body>
</html>