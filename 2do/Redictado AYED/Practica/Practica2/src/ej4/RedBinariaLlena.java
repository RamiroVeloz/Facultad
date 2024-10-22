package ej4;
import binaryTree.BinaryTree;

public class RedBinariaLlena {
	
	public RedBinariaLlena () {
		
	}
	
	public int retardoEnvio (BinaryTree <Integer> ab) {
		
		int retardoIzq = 0;
		int retardoDer = 0;
		
		if (ab.hasLeftChild()) {
			retardoIzq = retardoEnvio (ab.getLeftChild());
		}
		if (ab.hasRightChild()) {
			retardoDer = retardoEnvio (ab.getRightChild());
		}
		return (Math.max(retardoIzq, retardoDer) + ab.getData());
		
	}
	
}
