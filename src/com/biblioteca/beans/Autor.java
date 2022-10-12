package com.biblioteca.beans;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "AUTOR")
public class Autor implements Serializable  {

	
	public long getLog() {
		return log;
	}
	public void setLog(long log) {
		this.log = log;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return Apellidos;
	}
	public void setApellidos(String apellidos) {
		Apellidos = apellidos;
	}
	private  long   log;
	private  String  nombre;
	private  String  Apellidos;
	
	
	
	
}
