package io.github.unlp_oo.ejercicio7;
import java.util.List;
import java.util.LinkedList;

public class Farola {

	private List <Farola> neighbors = null;
	private boolean estado;
	
	/*
	* Crear una farola. Debe inicializarla como apagada
	*/
	public Farola () {
		this.estado = false;
		this.neighbors = new LinkedList <Farola> ();
	}
	/*
	* Crea la relación de vecinos entre las farolas. La relación de vecinos entre las farolas es recíproca, es decir el receptor del mensaje será vecino de otraFarola, al igual que otraFarola también se convertirá en vecina del receptor del mensaje
	*/
	public void pairWithNeighbor( Farola otraFarola ) {
		if (!this.neighbors.contains(otraFarola)) {
			this.neighbors.add(otraFarola);
			otraFarola.pairWithNeighbor(this);
		}
	}
	/*
	* Retorna sus farolas vecinas
	*/
	public List<Farola> getNeighbors (){
		return this.neighbors;
	}


	/*
	* Si la farola no está encendida, la enciende y propaga la acción.
	*/
	public void turnOn() {
		if (!this.estado) {
			this.estado = true;
			this.getNeighbors().stream().forEach(neighbor -> neighbor.turnOn());
		}
	}

	/*
	* Si la farola no está apagada, la apaga y propaga la acción.
	*/
	public void turnOff() {
		if (this.estado) {
			this.estado = false;
			this.getNeighbors().stream().forEach(neighbor -> neighbor.turnOff());
		}
	}

	/*
	* Retorna true si la farola está encendida.
	*/
	public boolean isOn() {
		return this.estado;
	}
	
	public boolean isOff () {
		return !this.estado;
	}

	
}
