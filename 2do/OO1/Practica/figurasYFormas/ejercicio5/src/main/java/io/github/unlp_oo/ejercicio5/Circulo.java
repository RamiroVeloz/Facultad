package io.github.unlp_oo.ejercicio5;

public class Circulo implements Cuerpo2D {

	private double radio = 0;
	private double diametro = 0;
	
	public Circulo () {
		
	}
	
	public double getRadio () {
		return this.radio;
	}
	
	public void setRadio (double rad) {
		this.radio = rad;
	}
	
	public double getDiametro() {
		this.diametro = this.radio * 2;
		return this.diametro;
	}
	
	public void setDiametro (double diam) {
		this.diametro = diam;
	}
	
	public double getPerimetro () {
		return (this.getDiametro() * Math.PI);
	}
	
	public double getArea () {
		return (Math.PI * Math.pow(this.getRadio(),2));
	}
	
	
	
}
