package ar.edu.unlp.info.oo1.ejercicio2;

public class Balanza {
	
	private Integer cantidadDeProductos = 0;
	private double precioTotal = 0.0;
	private double pesoTotal = 0.0;
	
	public Balanza () {
		
	}

	public Integer getCantidadDeProductos() {
		return this.cantidadDeProductos;
	}

	public void setCantidadDeProductos(Integer cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
	}

	public Double getPrecioTotal() {
		return this.precioTotal;
	}

	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public Double getPesoTotal() {
		return this.pesoTotal;
	}

	public void setPesoTotal(double pesoTotal) {
		this.pesoTotal = pesoTotal;
	}
	
	public void ponerEnCero () {
		this.pesoTotal = 0.0;
		this.precioTotal = 0.0;
		this.cantidadDeProductos = 0;
	}
	
	public void agregarProducto (Producto p) {
		this.pesoTotal += p.getPeso();
		this.precioTotal += p.getPrecio();
		this.cantidadDeProductos++;
	}
	
	public Ticket emitirTicket () {
		
		Ticket ticket = new Ticket ();
		ticket.setPesoTotal(this.pesoTotal);
		ticket.setPrecioTotal(this.precioTotal);
		ticket.setCantidadDeProductos(this.cantidadDeProductos);
		return ticket;
		
	}
	
}
