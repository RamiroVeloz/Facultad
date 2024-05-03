package TP3.Ej8;
import TP3.ayed2024.src.tp3.ejercicio1.*;
import java.util.List;

public class Navidad {
	private GeneralTree<Integer> arbol;
	
	public Navidad (GeneralTree<Integer> tree) {
		this.arbol = tree;
	}
	
	public String esAbeto () {
		boolean es = controlarAbeto(this.arbol);
		if (es) { 
			return "El arbol es un abeto";
		} else {
			return "El arbol no es un abeto" ;
		}
	}
	
	private boolean controlarAbeto (GeneralTree <Integer> nodo) {
		if (nodo == null) {
			return false;
		}
		
		if (nodo.hasChildren()) {
			int cant = 0;
			List <GeneralTree<Integer>> children = nodo.getChildren();
			for (GeneralTree<Integer> child : children) {
				if (child.isLeaf()) {
					cant ++;
				}
			}
			for (GeneralTree<Integer> child : children) {
				this.controlarAbeto(child);
			}
			if (cant >= 3) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}
	
}
