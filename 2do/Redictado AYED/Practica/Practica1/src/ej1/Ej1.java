package ej1;

public class Ej1 {

	public static void imprimirConFor (int a, int b) {
		
		for (int i = a; i <= b; i++) {
			System.out.println(i);
		}
		
	}
	
	public static void imprimirConWhile (int a, int b) {
		while (a <= b) {
			System.out.println(a);
			a++;
		}
	}
	
	public static void imprimirConRecursion (int a, int b) {
		
		if (a <= b) {
			System.out.println(a);
			imprimirConRecursion(a+1, b);
		}
		
	}
	
	public static void main(String[] args) {
		
		int a = 0, b = 10;
		imprimirConFor(a,b);
		System.out.println();
		imprimirConWhile(a,b);
		System.out.println();
		imprimirConRecursion(a,b);

	}

}
