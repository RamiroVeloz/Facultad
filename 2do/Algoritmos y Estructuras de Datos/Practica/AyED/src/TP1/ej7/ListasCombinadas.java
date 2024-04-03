package TP1.ej7;
import java.util.ArrayList;

public class ListasCombinadas {
	
	public static void OrdenarLista (ArrayList <Integer> lista) {
		int i,j,aux;
		for ( i = 0; i < lista.size()-1; i++) {
			for ( j = 0; j < lista.size()-i-1; j++) {
				if (lista.get(j) > lista.get(j+1)) {
					 aux = lista.get(j);
					 lista.set(j,lista.get(j+1));
					 lista.set(j+1, aux);
				}
			}
			
			
		}
	}
	
	public static void main(String[] args) {
		
		ArrayList <Integer> numeros1 = new ArrayList <Integer> ();
		ArrayList <Integer> numeros2 = new ArrayList <Integer> ();
		ArrayList <Integer> numeros3 = new ArrayList <Integer> ();
		numeros1.add(3);
		numeros1.add(1);
		numeros1.add(2);
		numeros1.add(4);
		
		numeros2.add(8);
		numeros2.add(6);
		numeros2.add(7);
		numeros2.add(5);
		
		numeros3.addAll(numeros1);
		numeros3.addAll(numeros2);
		
		for (int i:numeros1) {
			System.out.println(i);
		}
		
		OrdenarLista(numeros1);
		
		for (int i:numeros1) {
			System.out.println(i);
		}
		
		
		for (int i:numeros2) {
			System.out.println(i);
		}
		
		OrdenarLista(numeros2);
		
		for (int i:numeros2) {
			System.out.println(i);
		}
		System.out.println("Lista completa: ");
		OrdenarLista(numeros3);
		for (int i:numeros3) {
			System.out.println(i);
		}
		

	}

}
