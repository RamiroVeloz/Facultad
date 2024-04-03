package TP1.ej2;
import java.util.Scanner;

public class ej2 {
	public static void main (String [] args) {
		System.out.print("Ingrese un numero: ");Scanner aux = new Scanner (System.in);
		System.out.println();
		int x = aux.nextInt();
		int [] v = metodos.inicializar(x);
		metodos.multiplos(x, v);
		metodos.impMult(v);;
	}
}
