package TP3.Ej2;
import java.util.List;

import TP1.ej8.Queue;

import java.util.LinkedList;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class RecorridosAg {
	private List <Integer> lista ;
	
	public RecorridosAg () {
		this.lista = new LinkedList <Integer> ();
	}
	
	
	
	public List<Integer> numerosImparesMayoresQuePreOrden (GeneralTree <Integer> ag, Integer n){
		List <Integer> preOrden = new LinkedList <Integer> ();
		this.imparesMayoresQuePreOrden(ag,n, preOrden);
		return preOrden;
	}
	
	private List <Integer> imparesMayoresQuePreOrden (GeneralTree <Integer> ag, Integer n , List <Integer> listaImpares) {
		if (ag.getData() % 2 != 0 &&  ag.getData() > n) {
			listaImpares.add(ag.getData());
		}
		List <GeneralTree <Integer>> children = ag.getChildren();
		for  (GeneralTree <Integer> i : children) {
			this.imparesMayoresQuePreOrden(i, n, listaImpares);
		}
		return listaImpares;
	}
	
	
	public List <Integer> numerosImparesMayoresQueInOrder (GeneralTree <Integer> ag, Integer n){
		List <Integer> inOrden = new LinkedList <Integer> ();
		this.imparesMayoresQueInOrder(ag, n, inOrden);
		return inOrden;
	}
	
	private List<Integer> imparesMayoresQueInOrder (GeneralTree <Integer> ag, Integer n, List <Integer> listaImpares){
		List <GeneralTree<Integer>> children = ag.getChildren();
		if (!children.isEmpty()) {
			imparesMayoresQueInOrder(children.get(0),n,listaImpares);
		}
		if (ag.getData() % 2 != 0 && ag.getData() > n) {
			listaImpares.add(ag.getData());
		}
		for (int i = 1; i < children.size(); i++) {
			imparesMayoresQueInOrder(children.get(i),n,listaImpares);
		}
		return listaImpares;
	}	
	
	public List <Integer> numerosImparesMayoresQuePostOrder (GeneralTree <Integer> ag, Integer n){
		List <Integer> postOrden = new LinkedList <Integer> ();
		this.imparesMayoresQuePostOrder(ag, n, postOrden);
		return postOrden;
	}
	
	private List<Integer> imparesMayoresQuePostOrder (GeneralTree <Integer> ag, Integer n, List <Integer> listaImpares){
		if (ag.hasChildren()) {
			List <GeneralTree <Integer>> children = ag.getChildren();
			for (GeneralTree <Integer> i : children) {
				this.imparesMayoresQuePostOrder(i, n, listaImpares);
			}
		}
		if (ag.getData() % 2 != 0 && ag.getData() > n) {
			listaImpares.add(ag.getData());
		}
		
		return listaImpares;
	}
	
	public List <Integer> numerosImparesMayoresQuePorNiveles (GeneralTree <Integer> ag, Integer n){
		List <Integer> porNiveles = new LinkedList<Integer>();
		this.imparesMayoresQuePorNiveles (ag,n,porNiveles);
		return porNiveles;
	}
	
	private List <Integer> imparesMayoresQuePorNiveles (GeneralTree<Integer> ag, Integer n, List <Integer> listaNiveles){
		GeneralTree <Integer> aux;
		Queue <GeneralTree <Integer>> queue = new Queue <GeneralTree<Integer>>();
		queue.enqueue(ag);
		while (!queue.isEmpty ()) {
			aux = queue.dequeue();
			if (aux.getData() % 2 != 0 && aux.getData() > n) {
				listaNiveles.add(aux.getData());
			}
			List <GeneralTree <Integer>> children = aux.getChildren();
			for (GeneralTree<Integer> child : children) {
				queue.enqueue(child);
			}
		}
		
		return listaNiveles;
	}
	
}
