package ej4;

public class AreaEmpresa {

	private String area;
	private int retardo;
	
	public AreaEmpresa (String nom, int ret) {
		this.area = nom;
		this.retardo = ret;
	}
	
	public String getArea () {
		return this.area;
	}
	
	public int getRetardo () {
		return this.retardo;
	}
	
}
