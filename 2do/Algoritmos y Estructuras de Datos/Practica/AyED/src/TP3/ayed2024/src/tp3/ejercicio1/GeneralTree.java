package TP3.ayed2024.src.tp3.ejercicio1;

import java.util.LinkedList;
import java.util.List;

import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;
import TP1.ej8.Queue;

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
	
	
	public void preOrder (List <T> lista ) {
		System.out.println(this.getData());
		List <GeneralTree <T>> children = this.getChildren();
		for (GeneralTree<T> child : children) {
			System.out.println(child.getData());
		}
	}
	
	public void inOrder (List <T> lista){
		List <GeneralTree<T>> children = this.getChildren();
		if (!children.isEmpty()) {
			children.get(0).inOrder(lista);
		}
		System.out.println(this.getData());;
		for (int i = 1; i < children.size(); i++) {
			System.out.println(children.get(i).getData());
		}
	}

	
	public void postOrder (List <T> lista) {
		if (this.hasChildren()) {
			List <GeneralTree<T>> children = this.getChildren();
			for (GeneralTree<T> child : children) {
				System.out.println(child.getData());
			}
		}
		System.out.println(this.getData());
	}

	public void porNiveles (){
		GeneralTree <T> aux;
		Queue <GeneralTree <T>> queue = new Queue <GeneralTree<T>>();
		queue.enqueue(this);
		System.out.println(this.getData());
		while (!queue.isEmpty ()) {
			aux = queue.dequeue();
			if (aux != null) {
				List <GeneralTree <T>> children = aux.getChildren();
				for (GeneralTree<T> child : children) {
					System.out.print(child.getData() + " ");
					queue.enqueue(child);
				}
				System.out.println();
			}
		}
	}
	
	private boolean buscarEntreHijos(GeneralTree<T> node, T b) {
		    if (node.getData().equals(b)) {
		        return true;
		    }
		    
		    if (node.hasChildren()) {
		        List<GeneralTree<T>> children = node.getChildren();
		        for (GeneralTree<T> child : children) {
		            if (buscarEntreHijos(child, b)) {
		                return true;
		            }
		        }
		    }
		    
		    return false;
		}
	
	public boolean esAncestro (T a, T b) {
		if (this.getData().equals(a)) {
	        return buscarEntreHijos(this, b);
	    } else {
	        for (GeneralTree<T> child : this.getChildren()) {
	            if (child.esAncestro(a, b)) {
	                return true;
	            }
	        }
	    }
	    return false;
	}
	
	
	public int ancho(){
		if (this.data == null) {
			return 0;
		}
		
		Queue<GeneralTree<T>> queue = new Queue<GeneralTree<T>>();
		queue.enqueue(this);
		int maxAncho  = 0;
		while (!queue.isEmpty()) {
			int size = queue.size();
			maxAncho = Math.max(maxAncho, size);
			for (int i = 0; i < size ; i++) {
				GeneralTree<T> aux = queue.dequeue();
				for (GeneralTree<T> child : aux.getChildren()) {
					queue.enqueue(child);
				}
				
			}
		}
		return maxAncho;
	}
	
	public int altura(GeneralTree <T> nodo) {	 
		if (nodo == null) {
			return 0;
		} else { 
			int max = 0 ;
			for (GeneralTree <T> child : nodo.getChildren()) {
				max+=1;
				max = Math.max(max, altura(child));
			}
			return max;
		}

	}
	
	
	
	public int nivel(T dato){
		int cont = 0;
        int act;
        GeneralTree<T> aux;
        Queue<GeneralTree<T>> cola = new Queue<>();
        cola.enqueue(this);
        while(!cola.isEmpty()){
            act = cola.size();
            for(int i = 0; i < act; ++i){
                aux = cola.dequeue();
                if(aux.getData().equals(dato)){
                    return cont;
                }
                else{
                    for(GeneralTree<T> child : aux.getChildren()){
                        cola.enqueue(child);
                    }
                }
            }
            cont++;
        }
        return -1;
	}
}