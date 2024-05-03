package TP3.Ej6;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class RedDeAguaPotable {
	
	public double minimoCaudal (GeneralTree <Character> arbol , double caudal) {
		if (arbol.isLeaf()) {
			return caudal;
		}
		double cant = caudal / arbol.getChildren().size();
		double min = Double.MAX_VALUE;
		for (GeneralTree<Character> child : arbol.getChildren()) {
			double caudalHijo = minimoCaudal(child,cant);
			min = Math.min(min,caudalHijo);
		}
		return min;
	}
	
}
