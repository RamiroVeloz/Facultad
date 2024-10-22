package generalTree;
import java.util.LinkedList;
import java.util.List;
import estructuras.Queue;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	private int alturaPriv (GeneralTree <T> ag) {
		 int max = 0;
		 if (ag.hasChildren()) {
			 List <GeneralTree<T>> children = ag.getChildren();
				for (GeneralTree <T> child : children ) {
					int alturaHijo = alturaPriv (child);
					if (alturaHijo > max) {
						max = alturaHijo;
					}
				}
		 }
		 return max + 1;
	}
	
	public int altura() {	 
		if (this != null && !this.isEmpty()) {
			return alturaPriv(this);
		}
		return 0;
	}
	
	public int nivel(T dato){
		int nivel = 0;
		Queue <GeneralTree <T>> queue = new Queue <GeneralTree<T>> ();
		queue.enqueue(this);
		queue.enqueue(null);
		GeneralTree<T> nodo;
		while (!queue.isEmpty()) {
			nodo = queue.dequeue();
			if (nodo != null) {
				if (nodo.getData() == dato) {
					return nivel;
				}
				if (nodo.hasChildren()) {
					List <GeneralTree<T>> children = nodo.getChildren();
					for (GeneralTree <T> child : children ) {
						queue.enqueue(child);
					}
				}
			} else if (!queue.isEmpty()) {
				nivel++;
				queue.enqueue(null);
			}
		}
		
		return nivel;
	  }
	
	public void porNiveles(){
		Queue <GeneralTree <T>> queue = new Queue <GeneralTree<T>> ();
		queue.enqueue(this);
		queue.enqueue(null);
		GeneralTree<T> nodo;
		while (!queue.isEmpty()) {
			nodo = queue.dequeue();
			if (nodo != null) {
				System.out.println(nodo.getData());
				if (nodo.hasChildren()) {
					List <GeneralTree<T>> children = nodo.getChildren();
					for (GeneralTree <T> child : children ) {
						queue.enqueue(child);
					}
				}
			} else if (!queue.isEmpty()) {
				System.out.println();
				queue.enqueue(null);
			}
		}
	  }

	public int ancho(){
		if (this.isEmpty()) {
			return 0;
		}
		int max = 1;
		Queue <GeneralTree <T>> queue = new Queue <GeneralTree<T>> ();
		queue.enqueue(this);
		queue.enqueue(null);
		GeneralTree<T> nodo;
		while (!queue.isEmpty()) {
			nodo = queue.dequeue();
			if (nodo != null) {
				if (nodo.hasChildren()) {
					List <GeneralTree<T>> children = nodo.getChildren();
					for (GeneralTree <T> child : children ) {
						queue.enqueue(child);
					}
				}
			} else if (!queue.isEmpty()) {
				if (queue.size() > max) {
					max = queue.size();
				}
				queue.enqueue(null);
			}
		}
		
		return max;
	}
	
	private boolean buscarHijo (GeneralTree<T> ag, T b) {
		if (ag == null) {
			return false;
		}
		
		if (ag.getData() == b) {
			return true;
		}
		
		List <GeneralTree<T>> children = ag.getChildren();
		for (GeneralTree<T> child : children) {
			if (buscarHijo(child, b) == true) {
				return true;
			}
		}
		return false;
	}
	
	public boolean esAncestro (T a, T b) {
		if (this.getData() == a) {
			return buscarHijo (this,b);
		}
		
		List <GeneralTree<T>> children = this.getChildren();
		for (GeneralTree<T> child : children) {
			if (child.esAncestro(a, b)) {
				return true;
			}
		}
		
		return false;
	}
	
}