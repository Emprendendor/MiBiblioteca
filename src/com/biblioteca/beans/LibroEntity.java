package com.biblioteca.beans;

public class LibroEntity {

	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getTitulo() {
		return Titulo;
	}
	public void setTitulo(String titulo) {
		Titulo = titulo;
	}
	public String getCategoria() {
		return Categoria;
	}
	public void setCategoria(String categoria) {
		Categoria = categoria;
	}
	private String ISBN;
	private String Titulo;
	private String Categoria;
	
	public   LibroEntity(String ISBN ,String Titulo, String Categoria  ) {
		
		this.ISBN  = ISBN;
		this.Titulo = Titulo ;
		this.Categoria = Categoria;
		
		
	}
	
	
}
