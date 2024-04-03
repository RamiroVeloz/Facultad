package TP1.ej1;

public class metodos {

	public static void puntoA (int x, int y){
		for (int i = x; i <= y ; i++) {
			System.out.println(i);
		}
	}
	
	public static void puntoB (int x, int y) {
		int i = x;
		while (i <= y) {
			System.out.println(i);
			i++;
		}
	}
	
	public static void puntoC (int x, int y) {
		if (x <= y) {
			System.out.println(x);
			puntoC(x + 1, y);
		}
	}
	
}
