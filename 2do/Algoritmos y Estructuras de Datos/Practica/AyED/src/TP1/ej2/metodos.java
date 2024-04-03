package TP1.ej2;

public class metodos {
	
	public static int [] inicializar (int x) {
		int [] mul = new int [x];
		for (int i = 0; i < x; i++) {
			mul[i] = 0;
		}
		return mul;
	}
	
	public static int [] multiplos (int x, int [] v) {
		
		for (int i = 0; i < x; i++) {
			int aux = i + 1;
			v[i] = aux * x;
		}
		return v;
	}
	
	public static void impMult (int [] v) {
		for (int i = 0; i < v.length; i++) {
			System.out.println(v[i]);
		}
	}
}
