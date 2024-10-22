package ar.edu.unlp.info.oo1.ejercicio4;

public class Producto {

	private double peso = 0.0;
	private double precioPorKilo = 0.0;
	private String descripcion = "Datos por defecto";
	
	public Producto () {
		
	}

	public double getPeso() {
		return this.peso;
	}

	public void setPeso(double peso) {
		this.peso = peso;
	}

	public double getPrecioPorKilo() {
		return this.precioPorKilo;
	}

	public void setPrecioPorKilo(double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public double getPrecio () {
		return this.precioPorKilo * this.peso;
	}
	
}
