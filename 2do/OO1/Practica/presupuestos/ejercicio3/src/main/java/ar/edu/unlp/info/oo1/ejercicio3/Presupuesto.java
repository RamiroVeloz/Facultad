package ar.edu.unlp.info.oo1.ejercicio3;
import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Presupuesto {
	
	private LocalDate fecha = LocalDate.now();
	private String cliente = "Default customer";
	private List <Item> items;
	
	public Presupuesto (String unCliente) {
		this.fecha = LocalDate.now();
		this.cliente = unCliente;
		this.items = new ArrayList <Item> ();
	}

	public String getCliente() {
		return this.cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
	public void agregarItem (Item i) {
		this.items.add(i);
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public double calcularTotal () {
		double total = 0;
		for (Item i : this.items) {
			total += i.costo();
		}
		return total;
	}
	
}
