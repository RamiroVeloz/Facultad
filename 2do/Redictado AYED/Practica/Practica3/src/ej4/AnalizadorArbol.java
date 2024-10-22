package ej4;
import generalTree.GeneralTree;
import estructuras.Queue;
import java.util.List;

public class AnalizadorArbol {

	public AnalizadorArbol () {
		
	}
	
	
	public double devolverMaximoPromedio (GeneralTree<AreaEmpresa>arbol) {
		Queue <GeneralTree<AreaEmpresa>> queue = new Queue <GeneralTree<AreaEmpresa>> ();
		double prom;
		int total = 0;
		double max = -1;
		int cant = 0;
		GeneralTree <AreaEmpresa> nodo;
		queue.enqueue(arbol);
		queue.enqueue(null);
		while (!queue.isEmpty()) {
			nodo = queue.dequeue();
			cant++;
			if (nodo != null) {
				total += nodo.getData().getRetardo();
				if (nodo.hasChildren()) {
					List <GeneralTree<AreaEmpresa>> children = nodo.getChildren();
					for (GeneralTree<AreaEmpresa> child : children) {
						queue.enqueue(child);
					}
				}
			} else if (!queue.isEmpty()) {
				prom = total / (cant-1);
				max = Math.max(prom, max);
				total = 0;
				cant = 0;
				queue.enqueue(null);
			}
		}
		
		return max;
	}

	
	
}
