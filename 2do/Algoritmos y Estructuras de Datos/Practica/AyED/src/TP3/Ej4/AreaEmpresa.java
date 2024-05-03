package TP3.Ej4;

public class AreaEmpresa {
	private String area;
	private Integer tiempo;
	
	public AreaEmpresa (String A, Integer T) {
		this.area = A;
		this.tiempo = T;
	}
	
	public String getArea () {
		return this.area;
	}
	
	public Integer getTiempo () {
		return this.tiempo;
	}
	
	public String toString () {
		return "Area: " + this.getArea() + " Delay: " + this.getTiempo();
	}
	
}
