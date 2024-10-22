package TP1.ej8;
import java.util.ArrayList;
import java.util.List;

import javax.sound.midi.Sequence;

public class Queue <T> extends Sequence {
	List <T> data;
	
	
	public Queue () {
		this.data = new ArrayList <T>();
	}
	
	public void enqueue (T elem) {
		this.data.add(elem);
	}
	
	public T dequeue () {
		if (this.data.get(0) != null) {
			return this.data.remove(0);
		} else {
			return null;
		}
	}
	
	public T head() {
		if (this.data.get(0) != null) {
			return this.data.get(0);
		} else {
			return null;
		}
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
