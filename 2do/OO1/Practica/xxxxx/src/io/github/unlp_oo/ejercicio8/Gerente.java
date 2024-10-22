package io.github.unlp_oo.ejercicio8;

public class Gerente extends EmpleadoJerarquico {

	public Gerente (String nom) {
		super (nom);
	}
	
	public double aportes () {
		return (this.montoBasico() * 0.05d);
	}
	
	public double montoBasico () {
		return 57000;
	}
	
}
