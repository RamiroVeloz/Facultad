package ej6;
import binaryTree.BinaryTree;

public class Transformacion {

	private BinaryTree <Integer> arbol ;
	
	public Transformacion (BinaryTree <Integer> ab) {
		this.arbol = ab;
	}
	

	
	private int sumaNuevo (BinaryTree <Integer> ab) {
		if (ab == null) {
			return 0;
		}
		int sumaIzq = sumaNuevo (ab.getLeftChild());
		int sumaDer = sumaNuevo (ab.getRightChild());
		
		int data = ab.getData();
		ab.setData(sumaIzq + sumaDer + data);
		return ab.getData();
	}
		
	
	public BinaryTree <Integer> suma () {
		if (this.arbol != null && !this.arbol.isEmpty()) { 
			sumaNuevo(this.arbol);
		}
		return this.arbol;
	}
	
}
