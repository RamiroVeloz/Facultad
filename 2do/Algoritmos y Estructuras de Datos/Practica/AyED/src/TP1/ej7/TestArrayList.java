package TP1.ej7;
import java.util.*;

public class TestArrayList {

	public static void main(String[] args) {
		//parte a
		
		
		Scanner n = new Scanner (System.in);
		ArrayList <Integer> numeros = new ArrayList<Integer>();
		
		
		
		System.out.print("Ingrese un numero: "); 
		Integer x = n.nextInt();
		
		while (x != -1) {
			numeros.add(x);
			System.out.print("Ingrese un numero: ");
			x = n.nextInt();
		}
		
		Iterator <Integer> i1 = numeros.iterator();
		while (i1.hasNext()) {
			int num = i1.next();
			System.out.println(num);
		}
		
		for (Integer i:numeros) {
			System.out.println(i);
		}
		
		
		//parte b
		
		
		LinkedList <Integer> numeros2 = new LinkedList<Integer>();
		
		
		System.out.print("Ingrese un numero: "); 
		Integer x2 = n.nextInt();
		while (x2 != -1) {
			numeros2.add(x2);
			System.out.print("Ingrese un numero: ");
			x2 = n.nextInt();
		}
		
		 Iterator <Integer> i2 = numeros2.iterator();
		
		while (i2.hasNext()) {
			int num = i2.next();
			System.out.println(num);
		} 
		
		
		for (Integer i:numeros2) {
			System.out.println(i);
		}
		
		/*\
		 * No hay diferencia visual en cuanto a como agregar o iterar las listas, en cambio en cuestiones de memoria y tiempo de ejecucion si
		 */
		
		//Parte c
		//La alternativa fue implementada en la parte a y b, usando el iterator propio que poseen las estructuras para recorrerlas.
		
		
		
	}

}
