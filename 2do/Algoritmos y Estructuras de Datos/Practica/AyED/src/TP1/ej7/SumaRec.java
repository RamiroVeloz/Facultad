package TP1.ej7;
import java.util.*;

public class SumaRec {

	public int sumarLinkedList(ArrayList<Integer> lista) {
		return sumaRec(lista, lista.size()-1);
	}
	
	public static int sumaRec(ArrayList<Integer> lista, int pos){
		if(pos!=0) {
			return lista.get(pos)+sumaRec(lista, pos-1);
		}else {
			 return lista.get(pos);
		}
	}
	
	public static void main(String[] args) {
		
		ArrayList <Integer> numeros = new ArrayList <Integer> ();
		for (int i = 1; i <= 10; i++) {
			numeros.add(i);
		}
		int x = numeros.size()-1;
		int suma = sumaRec(numeros,x);
		
		for  (Integer i:numeros) {
			System.out.println(i);
		}
		
		System.out.print("La suma de los elementos es:" + suma );

	}

}
