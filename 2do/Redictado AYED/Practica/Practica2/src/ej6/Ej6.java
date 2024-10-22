package ej6;

import binaryTree.BinaryTree;

public class Ej6 {

	public static void main(String[] args) {
		
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(4);
        arbol.addLeftChild(new BinaryTree<Integer>(2));
        arbol.addRightChild(new BinaryTree<Integer>(6));
        arbol.getLeftChild().addLeftChild(new BinaryTree<Integer>(10));
        arbol.getLeftChild().addRightChild(new BinaryTree<Integer>(30));
        arbol.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        arbol.getRightChild().addRightChild(new BinaryTree<Integer>(1));

        arbol.porNiveles();
        System.out.println();
        System.out.println();
        Transformacion t = new Transformacion (arbol);
        BinaryTree <Integer> arbol2 = t.suma();
        arbol2.porNiveles();
        
	}

}
