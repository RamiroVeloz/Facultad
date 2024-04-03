package TP1.ej7;
import java.util.*;

public class InvertirOrden {

	public static void listaInvertida (ArrayList<Integer> numeros, int x, int y){
		if ( x < y ) {
			int aux = numeros.get(x);
			numeros.set(x,numeros.get(y));
			numeros.set(y, aux);
			listaInvertida (numeros, x + 1, y - 1);
		}
		
	}
	
	public static void main(String[] args) {
		ArrayList <Integer> numeros = new ArrayList <Integer> ();
		
		for (int i = 1; i <= 10; i++) {
			numeros.add(i);
		}
		
		for (int i:numeros) {
			System.out.println(i);
		}
		
		int x,y;
		x = 0; y = numeros.size()-1;
		listaInvertida(numeros,x,y);
		System.out.println("Lista invertida correctamente.");
		
		for (int i:numeros) {
			System.out.println(i);
		}
		
	}

}
