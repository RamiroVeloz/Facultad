package TP3.Ej7;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;
import java.util.List;
import java.util.LinkedList;

public class Caminos {
	private GeneralTree<Integer> arbol;
	
	public Caminos (GeneralTree <Integer> tree) {
		this.arbol = tree;
	}
	
	public List <Integer> caminoAHojaMasLejana () {
		List <Integer> lista = new LinkedList <Integer> ();
		lista = caminoAHojaMasLejana (this.arbol);
		return lista;
	}
	
	private List <Integer> caminoAHojaMasLejana (GeneralTree<Integer> nodo) {
		 if (nodo == null)
	            return new LinkedList<>();

	        if (nodo.isLeaf()) {
	            List<Integer> camino = new LinkedList<>();
	            camino.add(nodo.getData());
	            return camino;
	        }

	        List<Integer> caminoMasLargo = new LinkedList<>();
	        for (GeneralTree<Integer> hijo : nodo.getChildren()) {
	            List<Integer> caminoHijo = caminoAHojaMasLejana(hijo);
	            if (caminoHijo.size() > caminoMasLargo.size()) {
	                caminoMasLargo = caminoHijo;
	            }
	        }

	        caminoMasLargo.add(0, nodo.getData());
	        return caminoMasLargo;
	}
	
	
	
}
