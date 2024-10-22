package ej6;
import generalTree.GeneralTree;
import java.util.List;

public class RedAguaPotable {

	private GeneralTree <Character> arbol;
	
	public RedAguaPotable (GeneralTree <Character> ag) {
		this.arbol = ag;
	}
	
	private double calcularMinimo (GeneralTree<Character> ag, double minimo) {
		if (ag.isLeaf()) {
			return minimo;
		}
		int cantHijos = ag.getChildren().size();
		double act = minimo / cantHijos;
		
		double min = 9999;
		
		List <GeneralTree<Character>> children = ag.getChildren();
		for (GeneralTree <Character> child : children ) {
			double caudalHijo = calcularMinimo (child,act);
			min = Math.min(caudalHijo, min);
		}
		
		return min;
		
	}
	
	public double minimoCaudal(double caudal) {
		if (this.arbol != null && !this.arbol.isEmpty()) {
			return calcularMinimo (this.arbol, caudal);
		}
		return caudal;
	}
	
}
