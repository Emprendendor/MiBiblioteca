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
<h1>   ALta de libros   </h1>
<form id="miformulario" action="ControladorC" method="GET">
 <p><label for="isbn">ISBN:</label>
<input id="isbn" type="text" name="isbn"/></p>
<p>
<label for="titulo">Titulo:</label>
<input id="titulo" type="text" name= "titulo"/>
</p><p>
<label for="categoria">Categoria :</label>
<input id="categoria" type="text" name="categoria"/>
</p>
<input type="button" value="Insertar" onclick="validacion()">
</form>

</body>
</html>