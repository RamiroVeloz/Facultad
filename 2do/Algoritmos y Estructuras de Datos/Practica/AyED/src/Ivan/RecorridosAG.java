package Ivan;

import java.util.List;
import java.util.Iterator;
import java.util.LinkedList;	


public class RecorridosAG {
	
	private List<Integer> list;
	
	public RecorridosAG() {
        this.list = new LinkedList<>();
    }
    
    public RecorridosAG(List<Integer> list) {
        this.list = list;
    }
	
	public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> a, Integer n){
		System.out.print(" PREORDEN ");
		LinkedList<Integer> lista = (LinkedList<Integer>) a.preOrder();
		LinkedList<Integer> nuevaLista = new LinkedList<Integer>();
		Iterator<Integer> iterator = lista.listIterator();
		while (iterator.hasNext()) {
			Integer valor = iterator.next(); // Almacenamos el valor en una variable para no avanzar el iterador múltiples veces
			System.out.print(valor+" ");
			if (valor % 2 != 0 && valor > n) {
		        nuevaLista.add(valor); // Agregamos el valor a la nueva lista
		    }
		}
		System.out.println();
		return nuevaLista;
	}
	
	public List<Integer> numerosImparesMayoresQueInOrden (GeneralTree <Integer> a, Integer n){
		System.out.print(" INORDEN ");
		LinkedList<Integer> lista = (LinkedList<Integer>) a.inOrder();
		LinkedList<Integer> nuevaLista = new LinkedList<Integer>();
		Iterator<Integer> iterator = lista.listIterator();
		while (iterator.hasNext()) {
			Integer valor = iterator.next(); // Almacenamos el valor en una variable para no avanzar el iterador múltiples veces
			System.out.print(valor+" ");
			if (valor % 2 != 0 && valor > n) {
		        nuevaLista.add(valor); // Agregamos el valor a la nueva lista
		    }
		}
		System.out.println();
		return nuevaLista;
	}
	
	public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a, Integer n){
		System.out.print(" POSTORDEN ");
		LinkedList<Integer> lista = (LinkedList<Integer>) a.postOrder();
		LinkedList<Integer> nuevaLista = new LinkedList<Integer>();
		Iterator<Integer> iterator = lista.listIterator();
		while (iterator.hasNext()) {
			Integer valor = iterator.next(); // Almacenamos el valor en una variable para no avanzar el iterador múltiples veces
			System.out.print(valor+" ");
			if (valor % 2 != 0 && valor > n) {
		        nuevaLista.add(valor); // Agregamos el valor a la nueva lista
		    }
		}
		System.out.println();
		return nuevaLista;
	}
	
	public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a, Integer n){
		System.out.print(" LEVELORDEN ");
		LinkedList<Integer> lista = (LinkedList<Integer>) a.levelOrder();
		LinkedList<Integer> nuevaLista = new LinkedList<Integer>();
		Iterator<Integer> iterator = lista.listIterator();
		while (iterator.hasNext()) {
			Integer valor = iterator.next(); // Almacenamos el valor en una variable para no avanzar el iterador múltiples veces
			System.out.print(valor+" ");
			if (valor % 2 != 0 && valor > n) {
		        nuevaLista.add(valor); // Agregamos el valor a la nueva lista
		    }
		}
		System.out.println();
		return nuevaLista;
	}
	
//	Método que retorna una lista con los elementos impares del árbol “a” que sean mayores al valor “n”
//	pasados como parámetros, recorrido por niveles.

}
