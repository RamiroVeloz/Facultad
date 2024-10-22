package ej7;
import generalTree.GeneralTree;
import java.util.List;
import java.util.ArrayList;
public class Caminos {

	private GeneralTree<Integer> arbol;
	
	public Caminos (GeneralTree <Integer> ag) {
		this.arbol = ag;
	}
	
	private void caminoMasLargo (GeneralTree<Integer> nodo, ArrayList <Integer> lista, ArrayList <Integer> camino) {
		if (nodo.isLeaf()) {
			if (lista.size() + 1 > camino.size())
			camino.addAll(lista);
		}
		if (camino.isEmpty()) {
			List <GeneralTree<Integer>> children = nodo.getChildren();
			for (GeneralTree<Integer> child: children) {
				lista.add(child.getData());
				caminoMasLargo(child, lista, camino);
				lista.remove(lista.size()-1);
			}
		}
	}
	
	public List<Integer> caminoAHojaMasLejana () {
		ArrayList <Integer> lista = new ArrayList <Integer> () ;
		lista.add(this.arbol.getData());
		ArrayList <Integer> camino = new ArrayList <Integer> ();
		caminoMasLargo (this.arbol, lista, camino);
		return camino;
	}

	
}
