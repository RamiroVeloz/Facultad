package ej3;
import binaryTree.BinaryTree;
import java.util.ArrayList;

public class ContadorArbol {

	private BinaryTree <Integer> arbol;
	
	public ContadorArbol (BinaryTree<Integer> ab) {
		this.arbol = ab;
	}
	
	
	private void numerosParesPrivInOrden (BinaryTree <Integer> ab , ArrayList <Integer> lista) {
		if (ab.hasLeftChild()) {
			this.numerosParesPrivInOrden(ab.getLeftChild(), lista);
		}
		if (ab.getData() % 2 == 0) {
			lista.add(ab.getData());
		}
		if (ab.hasRightChild()) {
			this.numerosParesPrivInOrden(ab.getRightChild(), lista);
		}
	}
	
	private void numerosParesPrivPostOrden (BinaryTree <Integer> ab , ArrayList <Integer> lista) {
		if (ab.hasLeftChild()) {
		this.numerosParesPrivPostOrden(ab.getLeftChild(), lista);
		}
		if (ab.hasRightChild()) {
			this.numerosParesPrivPostOrden(ab.getRightChild(), lista);
		}
		if (ab.getData() % 2 == 0) {
			lista.add(ab.getData());
		}
	}
	
	public ArrayList <Integer> numerosParesInOrden () {
		ArrayList <Integer> lista = new ArrayList <Integer> () ;
		if (this.arbol != null && !this.arbol.isEmpty()) {
			this.numerosParesPrivInOrden (this.arbol, lista);
		}
		return lista;
	}
	
	public ArrayList <Integer> numerosParesPostOrden () {
		ArrayList <Integer> lista = new ArrayList <Integer> () ;
		if (this.arbol != null && !this.arbol.isEmpty()) {
			this.numerosParesPrivPostOrden (this.arbol, lista);
		}
		return lista;
	}
	
	
}
