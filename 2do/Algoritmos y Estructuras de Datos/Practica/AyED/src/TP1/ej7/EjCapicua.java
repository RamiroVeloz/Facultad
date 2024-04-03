package TP1.ej7;
import java.util.*;

public class EjCapicua {

	public static boolean esCapicua (ArrayList <Integer> lista) {
		boolean aux = true;
		int i = 0, j = lista.size() -1;
		while (i < j) {
			if (!lista.get(i).equals(lista.get(j))) {
				aux = false;
			}
			i ++;
			j --;
		}
				
		return aux;
	}
	
	public static void main(String[] args) {
		
		ArrayList <Integer> numeros = new ArrayList <Integer> ();
		
		numeros.add(1);
		numeros.add(2);
		numeros.add(3);
		numeros.add(3);
		numeros.add(1);
		
		boolean aux = esCapicua(numeros);
		if (aux) {
			System.out.print("La lista de numeros es capicua");
		}else {
			System.out.print("La lista de numeros no es capicua");
		}
	}

}
