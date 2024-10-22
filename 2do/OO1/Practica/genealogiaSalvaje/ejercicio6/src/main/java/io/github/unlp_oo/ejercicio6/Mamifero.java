package io.github.unlp_oo.ejercicio6;
import java.time.LocalDate;


public class Mamifero {
	
	private String Identificador = "";
	private String Especie = "";
	private LocalDate FechaNacimiento = LocalDate.now();
	private Mamifero Padre = null;
	private Mamifero Madre = null;
	
	
	public Mamifero () {
		
	}
	
	public Mamifero (String nom) {
		this.Identificador = nom;
	}


	public String getIdentificador() {
		return this.Identificador;
	}


	public void setIdentificador(String id) {
		this.Identificador = id;
	}


	public String getEspecie() {
		return this.Especie;
	}


	public void setEspecie(String especie) {
		this.Especie = especie;
	}


	public LocalDate getFechaNacimiento() {
		return this.FechaNacimiento;
	}


	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.FechaNacimiento = fechaNacimiento;
	}

	public Mamifero getPadre() {
		return this.Padre;
	}

	public void setPadre(Mamifero padre) {
		this.Padre = padre;
	}

	public Mamifero getMadre() {
		return this.Madre;
	}

	public void setMadre(Mamifero madre) {
		this.Madre = madre;
	}
	
	public Mamifero getAbueloMaterno () { 
		if (this.getMadre() != null) {
			return (this.getMadre().getPadre());
		}else {
			return null;
		}
	}
	
	public Mamifero getAbueloPaterno () {
		if (this.getPadre() != null) {
			return (this.getPadre().getPadre());
		}else {
			return null;
		}
	}
	public Mamifero getAbuelaMaterna () {
		if (this.getMadre() != null) {
			return (this.getMadre().getMadre());
		}else {
			return null;
		}
	}
	public Mamifero getAbuelaPaterna () {
		if (this.getPadre() != null) {
			return (this.getPadre().getMadre());
		}else {
			return null;
		}
	}
	
	public boolean tieneComoAncestroA (Mamifero M) {
		if (((this.Padre != null) && ((this.Padre == M) || this.Padre.tieneComoAncestroA(M))) ||
			((this.Madre != null) && ((this.Madre == M) || this.Madre.tieneComoAncestroA(M)))){
			return true;
		} else {
			return false;
		}
	}
	
}
