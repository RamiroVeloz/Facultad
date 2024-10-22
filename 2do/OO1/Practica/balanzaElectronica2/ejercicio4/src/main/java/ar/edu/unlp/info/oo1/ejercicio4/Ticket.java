package ar.edu.unlp.info.oo1.ejercicio4;
import java.time.LocalDate;
import java.util.List;

public class Ticket {
	
	private LocalDate fecha = LocalDate.now();
	private double pesoTotal = 0.0;
	private double precioTotal = 0.0;
	private List <Producto> productos;
	
	public Ticket () {
	}

	public LocalDate getFecha() {
		return this.fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public Integer getCantidadDeProductos() {
		return this.productos.size();
	}

	public double getPesoTotal() {
		return this.pesoTotal;
	}

	public void setPesoTotal(double pesoTotal) {
		this.pesoTotal = pesoTotal;
	}

	public Double getPrecioTotal() {
		return this.precioTotal;
	}

	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}
	
	public double impuesto () {
		return (this.precioTotal * 0.21);
	}
	
	public void setProductos (List<Producto> productos) {
		this.productos = productos;
	}
	
}
