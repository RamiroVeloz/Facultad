package io.github.unlp_oo.ejercicio5;

public class Cuadrado implements Cuerpo2D {

	private double lado = 0;
	
	public Cuadrado() {
		
	}
	
	public void setLado(double unLado) {
		this.lado = unLado;
	}
	
	public double getLado () {
		return this.lado;
	}
	
	public double getPerimetro () {
		return (this.lado * 4);
	}
	
	public double getArea () {
		return (Math.pow(this.lado , 2));
	}
	
}
