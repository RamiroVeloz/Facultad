package TP2.Ej4;
import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;
public class Ej4 {

	public static void main(String[] args) {
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(4);
        arbol.addLeftChild(new BinaryTree<Integer>(2));
        arbol.addRightChild(new BinaryTree<Integer>(6));
        arbol.getLeftChild().addLeftChild(new BinaryTree<Integer>(10));
        arbol.getLeftChild().addRightChild(new BinaryTree<Integer>(30));
        arbol.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        arbol.getRightChild().addRightChild(new BinaryTree<Integer>(1));
		
		arbol.imprimirArbol();
		RedBinariaLlena rbl = new RedBinariaLlena();
		System.out.println();
		System.out.println(rbl.retardoReenvio(arbol));
	}

}
