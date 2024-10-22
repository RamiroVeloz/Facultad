package ar.edu.unlp.info.oo1.ejercicio2;
import java.time.LocalDate;

public class Ticket {
	
	private LocalDate fecha = LocalDate.now();
	private Integer CantidadDeProductos = 0;
	private double pesoTotal = 0.0;
	private double precioTotal = 0.0;
	
	public Ticket () {
		
	}

	public LocalDate getFecha() {
		return this.fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public Integer getCantidadDeProductos() {
		return this.CantidadDeProductos;
	}

	public void setCantidadDeProductos(Integer cantidadProductos) {
		this.CantidadDeProductos = cantidadProductos;
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
	
}
