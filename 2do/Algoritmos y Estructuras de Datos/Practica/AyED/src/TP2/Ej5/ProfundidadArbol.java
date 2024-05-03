package TP2.Ej5;
import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;
import TP1.ej8.Queue;
import java.util.Random;

public class ProfundidadArbol {
	private BinaryTree <Integer> arbol;
	
	public ProfundidadArbol (int nivel) {
		if (nivel > 0) {
			this.arbol = this.crearArbolLleno(nivel);  
		}
	}
	
	public void setArbol (BinaryTree <Integer> a) {
		this.arbol = a;
	}
	
	public BinaryTree <Integer> getArbol(){
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
	
	public int sumaElementosProfundidad (int nivel) {
		if (this.getArbol() == null || nivel < 0) {
			return 0;
		}
		
		Queue <BinaryTree<Integer>> cola = new Queue <BinaryTree<Integer>> ();
		
		cola.enqueue(this.getArbol());
		int act = 0;
		int suma = 0;
		while (!cola.isEmpty() && act <= nivel) {
			int dim = cola.size();
			for (int i = 0; i < dim; i++) {
				BinaryTree<Integer> nodo = cola.dequeue();
				if (act == nivel) {
					suma += nodo.getData();
				} else {
					if (nodo.hasLeftChild()) {
						cola.enqueue(nodo.getLeftChild());
					}
					if (nodo.hasRightChild()) {
						cola.enqueue(nodo.getRightChild());
					}
				}
			}
			act ++;
		}
		return suma;
	}
	
}
