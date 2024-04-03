package TP1.ej1;
import java.util.Scanner;

public class Ej1 {

	public static void main (String [] args) {
		System.out.print("Ingrese un numero base: "); Scanner x = new Scanner(System.in);
		int x1 = x.nextInt();
		System.out.println();
		
		System.out.print("Ingrese un numero base: "); Scanner y = new Scanner(System.in);
		int y1 = y.nextInt();
		System.out.println();
		
		metodos.puntoA(x1, y1);
		metodos.puntoB(x1,y1);
		metodos.puntoC(x1, y1);
	}
}
