package io.github.unlp_oo.ejercicio5;

public class Cuerpo3D {

	private double altura = 0.0;
	private Cuerpo2D caraBasal = null;
	
	public Cuerpo3D () {
		
	}
	
	public void setAltura (double value) {
		this.altura = value;
	}
	
	public double getAltura () {
		return this.altura;
	}
	
	public void setCaraBasal (Cuerpo2D cb) {
		this.caraBasal = cb;
	}
	
	public double getVolumen () {
		return (this.caraBasal.getArea() * this.altura);
	}
	
	public double getSuperficieExterior () {
		return ((2 * this.caraBasal.getArea()) + (this.caraBasal.getPerimetro() * this.altura));
	}
	
	
	
}
