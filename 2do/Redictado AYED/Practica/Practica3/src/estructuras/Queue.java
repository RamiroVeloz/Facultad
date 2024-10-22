package estructuras;
import java.util.ArrayList;

public class Queue <T> {

	ArrayList <T> data;
	
	public Queue () {
		this.data = new ArrayList <T> ();
	}
	
	public void enqueue (T elem) {
		this.data.add(elem);
	}
	
	public T dequeue () {
		return this.data.remove(0);
	}
	
	public T head () {
		return this.data.get(0);
	}
	
	public boolean isEmpty () {
		return this.data.isEmpty();
	}
	
	public int size () {
		return this.data.size();
	}
	
	public String toString () {
		return this.data.toString();
	}
	
}
