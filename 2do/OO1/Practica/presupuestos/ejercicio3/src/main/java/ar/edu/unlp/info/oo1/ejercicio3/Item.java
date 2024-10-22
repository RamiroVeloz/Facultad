package ar.edu.unlp.info.oo1.ejercicio3;

public class Item {
	
	private String detalle = "Default detail";
	private int cantidad = 0;
	private double costoUnitario = 0;
	
	public Item (String unDetalle, int unaCant, double unPrecio) {
		this.detalle = unDetalle;
		this.cantidad = unaCant;
		this.costoUnitario = unPrecio;
	}

	public String getDetalle() {
		return this.detalle;
	}

	public void setDetalle(String detalle) {
		this.detalle = detalle;
	}

	public int getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getCostoUnitario() {
		return this.costoUnitario;
	}

	public void setCostoUnitario(double costoUnitario) {
		this.costoUnitario = costoUnitario;
	}
	
	public double costo () {
		return (this.cantidad * this.costoUnitario);
	}
	
	
}
