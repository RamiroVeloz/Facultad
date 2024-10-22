package io.github.unlp_oo.ejercicio8;

public class Empleado {

	private String nombre = "";
		
	public Empleado (String nom) {
		this.nombre = nom;
	}
	
	public void setNombre (String nom) {
		this.nombre = nom;
	}
	
	public String getNombre () {
		return this.nombre;
	}
	
	public double montoBasico () {
		return 35000;
	}
	
	public double aportes() {
		return 13500; 
	}
	
	public double sueldoBasico() {
		return (this.montoBasico() + this.aportes());
	}
	
	
}
