package com.biblioteca.beans;

import javax.persistence.Column;
import javax.persistence.Id;

public class Libro {

	
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
	@Id
	@Column(name = "ISBN")
	private String ISBN;
	
	@Column(name = "TITULO")
	private String Titulo;
	
	@Column(name = "CATEGORIA")
	private String Categoria;
	
	public   Libro(String ISBN ,String Titulo, String Categoria  ) {
		
		this.ISBN  = ISBN;
		this.Titulo = Titulo ;
		this.Categoria = Categoria;
		
		
	}
	
	
	
}
