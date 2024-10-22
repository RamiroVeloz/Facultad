package ej4;
import binaryTree.BinaryTree;

public class Ej4 {

	public static void main (String [] Args) {
		
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(4);
        arbol.addLeftChild(new BinaryTree<Integer>(2));
        arbol.addRightChild(new BinaryTree<Integer>(6));
        arbol.getLeftChild().addLeftChild(new BinaryTree<Integer>(10));
        arbol.getLeftChild().addRightChild(new BinaryTree<Integer>(30));
        arbol.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        arbol.getRightChild().addRightChild(new BinaryTree<Integer>(1));
		
        int total = 0;
        RedBinariaLlena rbl = new RedBinariaLlena ();
        total = rbl.retardoEnvio(arbol);
        System.out.println(total);
        
	}
	
}
