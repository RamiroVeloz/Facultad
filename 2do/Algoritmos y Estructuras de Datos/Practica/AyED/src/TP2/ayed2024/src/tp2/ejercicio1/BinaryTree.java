package TP2.ayed2024.src.tp2.ejercicio1;
import TP1.ej8.Queue;


public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		if (this.hasLeftChild()) {
			return leftChild;
		} else {
			return null;
		}
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		if (this.hasRightChild()) {
			return this.rightChild;
		} else {
			return null;
		}
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}
	
	private void imprimirEnOrden(BinaryTree<T> nodo) {
        if (nodo != null) {
            imprimirEnOrden(nodo.leftChild);
            System.out.print(nodo.data + " ");
            imprimirEnOrden(nodo.rightChild);
        }
    }
	
	public void imprimirArbol() {
        imprimirEnOrden(this);
    }

	public  int contarHojas(BinaryTree<T> nodo) {
		if (nodo == null) {
			return 0;
		} else if (nodo.isLeaf()) {
			return 1;
		}
		int hd = contarHojas(nodo.getRightChild());
		int hi = contarHojas(nodo.getLeftChild());
		return hd + hi;
	}
	
	public void agregarNodo (T elem) {
		if (this.getData() == null) {
	        this.setData(elem);
	    } else {
	        if (!this.hasLeftChild()) {
	            BinaryTree<T> leftChild = new BinaryTree<T>();
	            leftChild.setData(elem);
	            this.addLeftChild(leftChild);
	        } else if (!this.hasRightChild()) {
	            BinaryTree<T> rightChild = new BinaryTree<T>();
	            rightChild.setData(elem);
	            this.addRightChild(rightChild);
	        } else {
	            if (!this.getLeftChild().isLeaf()) {
	                this.getLeftChild().agregarNodo(elem);
	            } else {
	                this.getRightChild().agregarNodo(elem);
	            }
	        }
	    }
	}
    	 
	public BinaryTree<T> espejo() {
	    BinaryTree<T> espejo = new BinaryTree<T>();
	    espejo.setData(this.getData());

	    if (this.hasRightChild()) {
	        espejo.addLeftChild(this.getRightChild().espejo());
	    }

	    if (this.hasLeftChild()) {
	        espejo.addRightChild(this.getLeftChild().espejo());
	    }

	    return espejo;
	}
	
	public void imprimirPorNivel() {
		BinaryTree<T> ab = null;
		Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
		cola.enqueue(this);
		cola.enqueue(null);
		while (!cola.isEmpty()) {
			ab = cola.dequeue();
		 	if (ab != null) {
		 		System.out.print(ab.getData()+" ");
		 		if (ab.hasLeftChild()) {
		 			cola.enqueue(ab.getLeftChild());
		 		}
		 		if (ab.hasRightChild()) {
		 			cola.enqueue(ab.getRightChild());
		 		}
		 	} else if (!cola.isEmpty()) {
		 		System.out.println();
		 		cola.enqueue(null);
		 	}
		 }
	}

	// 0<=n<=m
	public void imprimirEntreNiveles(int n, int m) {
 		BinaryTree<T> ab = null;
 		Queue<BinaryTree<T>> cola = new Queue<BinaryTree<T>>();
 		int nivel = 0;
 		boolean seguir = true;
 		cola.enqueue(this);
 		cola.enqueue(null);
 		while (!cola.isEmpty() && seguir) {
 				ab = cola.dequeue();
 				if (ab != null) {
 					if ((nivel >= n && nivel <= m)) {
 						System.out.print(" " + ab.getData() + " ");
 					}
 					if (ab.hasLeftChild()) {
 						cola.enqueue(ab.getLeftChild());
 					}
 					if (ab.hasRightChild()) {
 						cola.enqueue(ab.getRightChild());
 					}
 				} else if (!cola.isEmpty()) {
 						System.out.println();
 						cola.enqueue(null);
 						nivel++;
 						if (nivel > m) {
 							seguir = false;
 						}
 				}
 		}
 }
	
}

