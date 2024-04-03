package TP1.ej8;

public class DoubleQueue <T> extends Queue <T> {
	public DoubleQueue() {
		super();
	}
	
	public void enqueueFirst(T elem) {
		this.data.add(elem);
	}
}
