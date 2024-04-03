package TP1.ej8;


public class CircularQueue <T> extends Queue<T> {
	
	public CircularQueue () {
		super();
	}
	
	public T shift () {
		if (this.data.isEmpty()) {
			return null;
		}else {
			T elem = dequeue();
			this.enqueue(elem);
			return elem;
		}
	}
	
}
