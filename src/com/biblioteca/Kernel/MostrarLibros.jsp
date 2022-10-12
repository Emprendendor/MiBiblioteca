<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
 <%@ page import="com.biblioteca.beans.Libro" %>
 <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Libros</title>

<script type="text/javascript"  >  

function AltaLibro(){
	
	var miformulario=document.getElementById("miformulario");
	miformulario.action ="FormularioAltaLibros.jsp";
	miformulario.submit();
	
}
 
</script>

</head>

<body>

<h1 >    Biblioteca </h1>

<c:out value="${estudiante.identificacion}"></c:out>
<%

ArrayList<Libro> listaDeLibros= new ArrayList<Libro>();

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
String consultaSQL= "select isbn,titulo,categoria from Libros";
//3 y 4
rs=sentencia.executeQuery(consultaSQL);
//5
//List<Libro> listaDeLibros = Libro.buscarTodos();
//List<String> listaDeCategorias = Libro.
//buscarTodasLasCategorias();
//request.setAttribute("listaDeLibros", listaDeLibros);
//request.setAttribute("listaDeCategorias", listaDeCategorias);



int x = -1;

%>
<form id="miformulario"  >

		<table  align="center"  border=1 >
		<caption> Biblioteca Pública</caption>
		<tr>
			<th  style="width:100px" >ISBN</th>
			<th style="width:200px"> Titulo</th>
			<th style="width:200px" >Categoria</th>
	     	<th  style="width:100px" ></th>			
		</tr>
<% 
while(rs.next()) { 
	x = x + 1 ;
	listaDeLibros.add(new Libro(rs.getString("isbn"),rs.getString("titulo"),rs.getString("categoria") ));
%>

	<tr>
			<td> <%=listaDeLibros.get(x).getISBN()%> </td>
			<td> <%=listaDeLibros.get(x).getTitulo()%> </td>
			<td> <%=listaDeLibros.get(x).getCategoria()%>  </td>
			<td>  <a href="FormularioEditarLibro.jsp?isbn=<%=listaDeLibros.get(x).getISBN()%>">Editar</a>
			 </td>

		</tr>
<% }


} catch (ClassNotFoundException e) {
	System.out.println("Error en la carga del driver" + e.getMessage() );
	
	response.sendRedirect("PaginaError.jsp");
	
}catch (SQLException e) {
	System.out.println("Error accediendo a la base de datos" + e.getMessage());
	
}
finally {
//6
if (rs != null) {

	try {rs.close();} 
	catch (SQLException e)
	{System.out.println("Error cerrando el resultset" + e.getMessage());}
}

if (sentencia != null) {
	try {sentencia.close();} 
	catch (SQLException e)
	{System.out.println("Error cerrando la sentencia" + e.getMessage());}
}
	if (conexion != null) {
	try {conexion.close();} catch (SQLException e)
	{System.out.println("Error cerrando la conexion" + e.getMessage());}
	}
}

request.setAttribute("listaDeLibros", listaDeLibros);

String [] test=new String[2]; 
test[0]="1"; 
test[1]="2"; 
request.setAttribute("test",test) ; 


System.out.println( " listaDeLibros.size "  + listaDeLibros.size());


 
//request.setAttribute("listaDeCategorias", listaDeCategorias);
response.sendRedirect("MostrarLibrosPresentacion.jsp");

%>

</table>

 <input type="button" value="AltaLibro" onclick="AltaLibro()">


 
</form>
 
 
</body>

</html>