package ej3;
import binaryTree.BinaryTree;
import java.util.ArrayList;

public class Ej3 {
	
	public static void main (String [] Args) {
		
		BinaryTree<Integer> ab = new BinaryTree<Integer>(40);
		BinaryTree<Integer> hijoIzquierdo = new BinaryTree<Integer>(25);
		hijoIzquierdo.addLeftChild(new BinaryTree<Integer>(10));
		hijoIzquierdo.addRightChild(new BinaryTree<Integer>(32));
		BinaryTree<Integer> hijoDerecho= new BinaryTree<Integer>(78);
		ab.addLeftChild(hijoIzquierdo);
		ab.addRightChild(hijoDerecho);

		ContadorArbol ca = new ContadorArbol (ab);
		ArrayList <Integer> lista1 = ca.numerosParesInOrden();
		ArrayList <Integer> lista2 = ca.numerosParesPostOrden();
		
		for (Integer i : lista1) {
			System.out.println(i);
		}
		System.out.println();
		System.out.println();
		
		for (Integer j : lista2) {
			System.out.println(j);
		}
		
	}
	
}
