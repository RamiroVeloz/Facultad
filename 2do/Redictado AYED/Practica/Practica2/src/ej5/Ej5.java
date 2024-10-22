package ej5;

import binaryTree.BinaryTree;

public class Ej5 {
	
	public static void main (String [] Args) {
		
		BinaryTree<Integer> arbol = new BinaryTree<Integer>(4);
        arbol.addLeftChild(new BinaryTree<Integer>(2));
        arbol.addRightChild(new BinaryTree<Integer>(6));
        arbol.getLeftChild().addLeftChild(new BinaryTree<Integer>(10));
        arbol.getLeftChild().addRightChild(new BinaryTree<Integer>(30));
        arbol.getRightChild().addLeftChild(new BinaryTree<Integer>(5));
        arbol.getRightChild().addRightChild(new BinaryTree<Integer>(1));
		
        
        ProfundidadArbolBinario pab = new ProfundidadArbolBinario (arbol);
		
        int total = pab.sumaProfundidad(2);
        
        System.out.println(total);
        
	}
	
}
