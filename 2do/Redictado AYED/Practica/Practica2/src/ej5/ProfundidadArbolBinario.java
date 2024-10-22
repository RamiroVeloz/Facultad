package ej5;
import binaryTree.BinaryTree;
import estructuras.Queue;

public class ProfundidadArbolBinario {

	private BinaryTree <Integer> arbol;
	
	public ProfundidadArbolBinario (BinaryTree <Integer> ab) {
		this.arbol = ab;
	}
	
	public int sumaProfundidad (int profundidad) {
		
		int total = 0 ;
		if (this.arbol == null || profundidad == 0) {
			return total;
		}
		Queue <BinaryTree<Integer>> queue = new Queue <BinaryTree <Integer>> ();
		int act = 0;
		queue.enqueue(this.arbol);
		queue.enqueue(null);
		while (!queue.isEmpty() && act <= profundidad ) {
			BinaryTree <Integer> aux = queue.dequeue();
			if (aux != null) {
				if (act == profundidad) {
					total += aux.getData();
				}
				if (aux.hasLeftChild()) {
					queue.enqueue(aux.getLeftChild());
				}
				if (aux.hasRightChild()) {
					queue.enqueue(aux.getRightChild());
				}
			} else if (!queue.isEmpty() && act <= profundidad) {
				act++;
				queue.enqueue(null);
			}
		}
		return total;
	}
	
}
	
