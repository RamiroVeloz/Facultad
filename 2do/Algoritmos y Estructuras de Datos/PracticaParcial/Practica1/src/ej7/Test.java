package ej7;
import java.util.ArrayList;
public class Test {

	public Test () {
		
	}
	
	public boolean esCapicua (ArrayList <Integer> lista) {
		boolean cap = true;
		int pos = lista.size() - 1;
		for (int i = 0; i < (lista.size() -1 ) / 2; i++) {
			pos = pos - i ;
			if (lista.get(i) != lista.get(pos)) {
				cap = false;
			}
		}
		
		return cap;
	}
	
	public ArrayList <Integer> sucesionRec (int n){
		ArrayList <Integer> lista = new ArrayList <Integer> ();
		lista.add(n);
		if (n == 1) {
			return lista;
		}
		if (n % 2 == 0) {
			lista.addAll(sucesionRec(n / 2));
		} else {
			lista.addAll(sucesionRec(3*n + 1));
		}
		return lista;
	}
	
	
	public void invertirOrden (ArrayList <Integer> lista){ 
		this.invertirOrdenP (lista, 0, lista.size()-1);
	}
	
	private void invertirOrdenP (ArrayList <Integer> lista, int x, int y) {
		if (x < y) {
			Integer aux = lista.get(x);
			lista.set(x, lista.get(y));
			lista.set(y, aux);
			invertirOrdenP(lista,x + 1, y - 1);
		}
	}
	
	public ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1,ArrayList<Integer> lista2){
		ArrayList <Integer> lista = new ArrayList <Integer> ();
		int x = 0, y = 0;
		 while (x < lista1.size() && y < lista2.size()) {
		        if (lista1.get(x) < lista2.get(y)) {
		            lista.add(lista1.get(x));
		            x++;
		        } else {
		            lista.add(lista2.get(y));
		            y++;
		        }
		    }
		if (x < lista1.size()) {
			lista.add(lista1.get(x));
		}
		if (y < lista2.size()) {
			lista.add(lista2.get(y));
		}
		
		return lista;
	}

	
}
