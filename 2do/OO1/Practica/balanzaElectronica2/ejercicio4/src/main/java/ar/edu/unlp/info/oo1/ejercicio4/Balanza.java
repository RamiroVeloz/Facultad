package ar.edu.unlp.info.oo1.ejercicio4;
import java.util.List;
import java.util.ArrayList;

public class Balanza {

	private List <Producto> productos;
	
	public Balanza () {
		this.productos = new ArrayList <Producto> ();
	}

	public Double getPrecioTotal() {
		double total = 0;
		for (Producto p : this.productos) {
			total += p.getPrecio();
		}
		return total;
	}
	
	public int getCantidadDeProductos () {
		return this.productos.size();
	}
	
	public Double getPesoTotal() {
		double total = 0;
		for (Producto p : this.productos) {
			total += p.getPeso();
		}
		return total;
	}

	public void ponerEnCero () {
		this.productos.clear();
	}
	
	public void agregarProducto (Producto p) {
		this.productos.add(p);
	}
	
	public Ticket emitirTicket () {
		double precioTotal = 0;
		double pesoTotal = 0;
		for (Producto p : this.productos) {
			precioTotal += p.getPrecio();
			pesoTotal += p.getPeso();
		}
		
		Ticket ticket = new Ticket ();
		ticket.setPesoTotal(pesoTotal);
		ticket.setPrecioTotal(precioTotal);
		ticket.setProductos(this.productos);
		return ticket;
		
	}
	
	public List<Producto> getProductos () {
		return this.productos;
	}
	
}
