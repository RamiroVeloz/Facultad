package TP1.ej7;
import java.util.*;

public class Funcion {
	
	public static List<Integer> sucesion (ArrayList <Integer> numeros, int n){
		if (n != 1) {
			if (n % 2 == 0) {
				int p = n / 2;
				n = p;
			} else {
				int i = (3 * n) + 1;
				n = i;
			}
			numeros.add(n);
			sucesion(numeros, n);
		}
		
		return numeros;
	}
	
	public static void main (String [] args) {
		ArrayList <Integer> numeros = new ArrayList <Integer> ();
		Scanner n = new Scanner (System.in);
		System.out.print("Ingrese un numero: ");
		int x = n.nextInt();
		List <Integer> aux = sucesion(numeros , x);
		
		for (Integer i:aux) {
			System.out.println(i);
		}
		
		
	}
}
