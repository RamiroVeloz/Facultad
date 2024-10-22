package TP1.ej8;
import java.util.ArrayList;
import java.util.List;


public class Queue <T> extends Sequence <T> {
	List <T> data;
	
	public Queue () {
		super();
		this.data = new ArrayList <T>();
	}
	
	public void enqueue (T elem) {
		this.data.add(elem);
	}
	
	public T dequeue () {
		return this.data.remove(0);
	}
	
	public T head() {
		return this.data.get(0);
	}
	
	public boolean isEmpty () {
		return (this.data.isEmpty());
	}
	
	public int size() {
		return this.data.size();
	}
	
	@Override
	public String toString() {
		return ("Queue : " + data);
	}
	
}
