package ej7;
import java.util.ArrayList;

public class Ej7 {

	public static boolean esCapicua(ArrayList<Integer> lista) {
		
		boolean cap = true;
		
		if (lista.size() == 1) {
			return cap;
		}
		
		for (int i = 0; i < lista.size() / 2 ; i++) {
			int pos = (lista.size()-1) - i;
			if (lista.get(i) != lista.get(pos)) {
				cap = false;
			}
		}
		return cap;
	}
	
	public static ArrayList<Integer> calcularSucesion (int n) {
		ArrayList <Integer> lista = new ArrayList <Integer>();
		lista.add(n);
		if (n != 1) {
			if (n % 2 == 0) {
				lista.addAll((calcularSucesion (n / 2)));
			} else {
				lista.addAll((calcularSucesion(3* n + 1)));
			}
		}
		
		return lista;
		
	}
	
	
	public static void main (String [] Args) {
		ArrayList <Integer> arr = new ArrayList <Integer> ();
		arr.add(1);
		arr.add(3);
		arr.add(3);
		arr.add(3);
		arr.add(1);
		System.out.println(esCapicua(arr));
		System.out.println();
		System.out.println();
		ArrayList <Integer> arr2 = calcularSucesion(6);
		for(Integer i : arr2) {
			System.out.println(i);
		}
	}
	
}
