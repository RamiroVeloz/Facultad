package TP2.Ej3;
import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;
import java.util.ArrayList;

public class ContadorArbol {
	private BinaryTree <Integer> arbol;
	
	public ContadorArbol (BinaryTree<Integer> ab) {
		this.setArbol(ab);
	}
	
	private void setArbol (BinaryTree <Integer> ab) {
		this.arbol = ab;
	}
	
	public BinaryTree <Integer> getArbol (){
		return this.arbol;
	}
	
	public ArrayList <Integer> numerosParesInOrden (ArrayList <Integer> lista,BinaryTree <Integer> nodo){
		if (nodo != null) {
			numerosParesPostOrden(lista, nodo.getLeftChild() );
			if (nodo.getData() % 2 == 0) {
				lista.add(nodo.getData());
			}
			numerosParesPostOrden(lista, nodo.getRightChild() );
		}
		return lista;
	}
	
	public ArrayList <Integer> numerosParesPostOrden (ArrayList <Integer> lista,BinaryTree<Integer> nodo) {
		if (nodo != null) {
			numerosParesPostOrden(lista, nodo.getLeftChild() );
			numerosParesPostOrden(lista, nodo.getRightChild() );
			if (nodo.getData() % 2 == 0) {
				lista.add(nodo.getData());
			}
		}
		return lista;
	}
	
}
