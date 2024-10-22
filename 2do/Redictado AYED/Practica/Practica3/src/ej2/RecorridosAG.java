package ej2;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

import generalTree.GeneralTree;
import estructuras.Queue;

public class RecorridosAG {

	public RecorridosAG () {
		
	}
	
	private void numerosPrivPre (GeneralTree <Integer> ag, Integer n, ArrayList <Integer> lista) {
		if (ag.getData() % 2 != 0 && ag.getData() > n) {
			lista.add(ag.getData());
		}
		if (ag.hasChildren()) {
			List <GeneralTree<Integer>> children = ag.getChildren();
			for (GeneralTree <Integer> child: children) {
				numerosPrivPre(child, n, lista);
			}
		}
	}
	
	public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> a,Integer n){
		ArrayList <Integer> lista = new ArrayList <Integer> ();
		if (a != null && ! a.isEmpty()) {
			numerosPrivPre (a,n, lista);
		}
		return lista;
	}
	
	
	private void numerosPrivIn (GeneralTree <Integer> ag, Integer n, ArrayList <Integer> lista) {
		List <GeneralTree <Integer>> children = ag.getChildren();
		Iterator <GeneralTree<Integer>> it = children.iterator();
		if (it.hasNext()) {
			GeneralTree <Integer> data = it.next();
			if (data.getData() % 2 != 0 && ag.getData() > n) {
				lista.add(data.getData());
			}
			numerosPrivIn (data, n, lista);
		}
		if (ag.getData() % 2 != 0 && ag.getData() > n) {
			lista.add(ag.getData());
		}
		while (it.hasNext()) {
			GeneralTree <Integer> data = it.next();
			numerosPrivIn (data, n, lista);
			if (data.getData() % 2 != 0 && ag.getData() > n) {
				lista.add(data.getData());
			}
		}
	}
	
	public List<Integer> numerosImparesMayoresQueInOrden (GeneralTree <Integer> a,Integer n){
		ArrayList <Integer> lista = new ArrayList <Integer> ();
		if (a != null && ! a.isEmpty()) {
			numerosPrivIn (a,n, lista);
		}
		return lista;
	}

	private void numerosPrivPost (GeneralTree <Integer> ag, Integer n, ArrayList <Integer> lista) {
		if (ag.hasChildren()) {
			List <GeneralTree<Integer>> children = ag.getChildren();
			for (GeneralTree <Integer> child: children) {
				numerosPrivPre(child, n, lista);
			}
		}
		
		if (ag.getData() % 2 != 0 && ag.getData() > n) {
			lista.add(ag.getData());
		}
	}
	
	public List<Integer> numerosImparesMayoresQuePostOrden (GeneralTree <Integer> a,Integer n){
		ArrayList <Integer> lista = new ArrayList <Integer> ();
		if (a != null && ! a.isEmpty()) {
			numerosPrivPost (a,n, lista);
		}
		return lista;
	}

	
	
	public List<Integer> numerosImparesMayoresQuePorNiveles(GeneralTree <Integer> a, Integer n){
		Queue <GeneralTree<Integer>> queue = new Queue <GeneralTree<Integer>> ();
		ArrayList <Integer> lista = new ArrayList <Integer> () ;
		queue.enqueue(a);
		queue.enqueue(null);
		while (!queue.isEmpty()) {
			GeneralTree <Integer> ag = queue.dequeue();
			if (ag != null) {
				if (ag.getData() % 2 != 0 && ag.getData() > n) {
					lista.add(ag.getData());
				}
				if (ag.hasChildren()) {
					List <GeneralTree<Integer>> children = ag.getChildren();
					for (GeneralTree<Integer> child : children) {
						queue.enqueue(child);
					}
				}
			} else if (!queue.isEmpty()) {
				queue.enqueue(null);
			}
		}
		return lista ;
	}

	
}
