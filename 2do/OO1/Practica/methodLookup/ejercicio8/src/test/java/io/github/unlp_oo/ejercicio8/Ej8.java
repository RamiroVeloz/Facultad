package io.github.unlp_oo.ejercicio8;

public class Ej8 {

	public static void Main (String [] Args) {
		
		Gerente alan = new Gerente ("Alan Turing");
		double aportesDeAlan = alan.aportes();
		
		Gerente jorge = new Gerente ("jorge rial");
		double sueldoBasicoDeJorge = jorge.sueldoBasico();
		
		System.out.println (aportesDeAlan);
		System.out.println(sueldoBasicoDeJorge);
		
	}
	
}
