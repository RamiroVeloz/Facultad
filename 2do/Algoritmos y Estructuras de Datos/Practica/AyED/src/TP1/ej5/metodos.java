package TP1.ej5;

public class metodos {
	
	private int max;
	private int min;
	private double prom;
	
	public metodos (int [] arr) {
		this.max = Maximo(arr);
		this.min = Minimo(arr);
		this.prom = Promedio(arr);
	}
	
	public static int  Maximo (int [] v) {
		int aux = -1;
		for (int i:v) {
			if (i > aux) {
				aux = i;
			}
		}
		return aux;
	}
	
	public static int Minimo (int [] v) {
		int aux = 99999;
		for (int i:v) {
			if (i < aux) {
				aux = i;
			}
		}
		return aux;
	}
	
	public static int Promedio (int [] v) {
		int aux = 0;
		int total = 0;
		for (int i:v) {
			total = total + i;
		}
		aux = total / v.length;
		return aux;
	}
	
	public String puntoA (int [] v) {
		return "Maximo : " + Maximo(v) + " Minimo : " + Minimo(v) + " Promedio : " + Promedio(v);
	}
	
	public  String  puntoB () {
		return "Maximo : " + this.max + " Minimo : " + this.min + " Promedio : " + this.prom;
	}
	
	public void puntoC () {
		System.out.println("Maximo : " + this.max + " Minimo : " + this.min + " Promedio : " + this.prom);
	}
	
	
	
	
	
}
