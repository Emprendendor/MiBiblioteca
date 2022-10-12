package com.biblioteca.Kernel;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorLibros extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request,	HttpServletResponse response) throws 	ServletException,IOException {
		
		
		System.out.println("Controlador Libros  metodo   doGet");
		System.out.println(" request.getServletPath   " +  request.getServletPath()   );
		
		String Destino = request.getServletPath();
		
		String ruta = "/MiBiblioteca";
		ServletContext context = request.getServletContext();
	//	 ServletContext contexto=request.getServletContext();
		RequestDispatcher  despachador = null;
		
		if (Destino == "/ControladorC" ) {
			String titulo =  request.getParameter("titulo");
			System.out.println("Controlador FORM.TITULO  " + titulo);
			despachador = context.getRequestDispatcher("/InsertarLibro.jsp");	
		};
		
		if (Destino == "/ControladorE" ) {
			String titulo =  request.getParameter("titulo");
			System.out.println("Controlador Editar Libro ");
			despachador = context.getRequestDispatcher("/EditarLibro.jsp");	
		};
		if (Destino == "/Controlador" ) {
			
			
			 
//		listaDeLibros.add(new Libro(rs.getString("isbn"),rs.getString("titulo"),rs.getString("categoria") ));
//   	listaDeLibros.add(new Libro(rs.getString("isbn"),rs.getString("titulo"),rs.getString("categoria") ));
			
			
			
			despachador = context.getRequestDispatcher("/MostrarLibros.jsp");			
	 	};

		
		despachador.forward(request, response);
		//String nombre = config.getServletName();
		
		
	//	Object Total = Request.QueryString().Count;

		
		//		For x = 1 To Total
		//		  Response.Write( Request.QueryString(x) & "<br>" )
		//		Next;
				
		 
//		RequestDispatcher despachador = null;
		
		/*
		 * List<Libro> listaDeLibros = Libro.buscarTodos(); List<String>
		 * listaDeCategorias = Libro.buscarTodasLasCategorias();
		 * 
		 * request.setAttribute("listaDeLibros", listaDeLibros);
		 * request.setAttribute("listaDeCategorias", listaDeCategorias); despachador =
		 * request.getRequestDispatcher("MostrarLibros.jsp");
		 * despachador.forward(request, response);
		 */
	
	}
	
	
	
}
