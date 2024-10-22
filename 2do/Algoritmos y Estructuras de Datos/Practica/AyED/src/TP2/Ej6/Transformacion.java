package TP2.Ej6;
import java.util.Random;

import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;


public class Transformacion {
	private BinaryTree <Integer> arbol;
	
	public Transformacion (int niveles) {
		if (niveles > 0) {
			this.arbol = crearArbolLleno(niveles);
		}
	}
	
	public BinaryTree <Integer> getArbol () {
		return this.arbol;
	}
		
	private BinaryTree <Integer> crearArbolLleno (int nivel) {
		Random rand = new Random ();
		Integer value = rand.nextInt(10);
		if (nivel == 0) {
			return new BinaryTree <Integer> (value);
		}
		BinaryTree <Integer> nodo = new BinaryTree <Integer> (value);
		nodo.addLeftChild(crearArbolLleno(nivel-1));
		nodo.addRightChild(crearArbolLleno(nivel-1));
		
		return nodo;
	}
	
	public BinaryTree <Integer> suma(){
		suma(this.arbol);
		return this.arbol;
	}
	
	private int suma (BinaryTree<Integer> ab){
		int sum = 0;
		if (ab.isLeaf()) {
			sum += ab.getData();
			ab.setData(0);
			return sum;
		}
		if (ab.hasLeftChild()) {
			sum += suma(ab.getLeftChild());
		}
		if (ab.hasRightChild()) {
			sum += suma(ab.getRightChild());
		}
		int act = ab.getData();
		ab.setData(sum);
		return act + sum;
	}
	
}
