package binaryTree;
import estructuras.Queue;


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
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
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

	public  int contarHojas() {
		int total = 0;
		if (this != null && !this.isEmpty()) {
			return contarHojasPriv (this,total);
		}
		return total;
	}
	
	private int contarHojasPriv (BinaryTree <T> ab, int total) {
		
		if (ab.hasLeftChild()) {
			ab.contarHojasPriv(ab.getLeftChild(),total);
		}
		if (ab.hasRightChild()) {
			ab.contarHojasPriv (ab.getRightChild(), total);
		}
		
		if (ab.isLeaf()) {
			return ++total;
		}
		
		return total;
	}
		
		
    	 
    public BinaryTree<T> espejo(){
    	BinaryTree <T> aux = this.getRightChild();
    	this.addRightChild(this.getLeftChild());
    	this.addLeftChild(aux);
    	if (this.hasLeftChild()) {
    		this.getLeftChild().espejo();
    	}
    	if (this.hasRightChild()) {
    		this.getRightChild().espejo();
    	}
 	    return this;
    }
    

	// 0<=n<=m
	public void porNiveles(){
		Queue <BinaryTree <T>> queue = new Queue <BinaryTree <T>>();
		queue.enqueue(this);
		queue.enqueue(null);
		while (!queue.isEmpty()) {
			BinaryTree <T> aux = queue.dequeue();
			if (aux != null) {
				System.out.println(aux.getData());
				if (aux.hasLeftChild()) {
					queue.enqueue(aux.getLeftChild());
				}
				if (aux.hasRightChild()) {
					queue.enqueue(aux.getRightChild());
				}
			} else if (!queue.isEmpty()) {
				System.out.println();
				queue.enqueue(null);
			}
		}
   }
	
	
	public void entreNiveles(int n, int m){
		Queue <BinaryTree <T>> queue = new Queue <BinaryTree <T>>();
		int nivel = 0;
		queue.enqueue(this);
		queue.enqueue(null);
		while (!queue.isEmpty()) {
			BinaryTree <T> aux = queue.dequeue();
			if (nivel  >= n && nivel <= m) {
				if (aux != null) {
					System.out.println(aux.getData());
					if (aux.hasLeftChild()) {
						queue.enqueue(aux.getLeftChild());
					}
					if (aux.hasRightChild()) {
						queue.enqueue(aux.getRightChild());
					}
			}
			} else if (!queue.isEmpty() && nivel <= m) {
				System.out.println();
				nivel ++;
				queue.enqueue(null);
			}
		}
   }
		
		
}

