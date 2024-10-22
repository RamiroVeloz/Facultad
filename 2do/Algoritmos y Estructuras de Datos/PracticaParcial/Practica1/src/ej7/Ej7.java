package ej7;
import java.util.ArrayList;
public class Ej7 {
	
	public static void main (String [] args) {
		
		ArrayList<Integer> lista = new ArrayList<Integer>();
		Test t = new Test();
		lista.add(1);
		lista.add(3);
		lista.add(5);
		lista.add(7);
		System.out.println("Es capicua ? : " + t.esCapicua(lista));
		ArrayList <Integer> lista2 = t.sucesionRec(6);
		System.out.println();
		for (Integer i : lista2) {
			System.out.println(i);
		}
		System.out.println();
		ArrayList <Integer> lista3 = new ArrayList <Integer> ();
		lista3.add(2);
		lista3.add(4);
		lista3.add(6);
		lista3.add(8);
		/*t.invertirOrden(lista3);
		for (Integer i : lista3) {
			System.out.println(i);
		}*/
		
		System.out.println();
		ArrayList <Integer> lista4 = t.combinarOrdenado(lista, lista3);
		for (Integer i : lista4) {
			System.out.println(i);
		}
	}
	
}
