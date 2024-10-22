package ej2;
import binaryTree.BinaryTree;
public class Ej2 {

	public static void main(String[] args) {
		
		BinaryTree<Integer> ab = new BinaryTree<Integer>(40);
		BinaryTree<Integer> hijoIzquierdo = new BinaryTree<Integer>(25);
		hijoIzquierdo.addLeftChild(new BinaryTree<Integer>(10));
		hijoIzquierdo.addRightChild(new BinaryTree<Integer>(32));
		BinaryTree<Integer> hijoDerecho= new BinaryTree<Integer>(78);
		ab.addLeftChild(hijoIzquierdo);
		ab.addRightChild(hijoDerecho);

		ab.porNiveles();
		ab.espejo();
		ab.porNiveles();
		
	}

}
