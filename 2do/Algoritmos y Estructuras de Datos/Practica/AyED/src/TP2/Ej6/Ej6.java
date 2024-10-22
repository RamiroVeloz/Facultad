package TP2.Ej6;

public class Ej6 {

	public static void main(String[] args) {
		Transformacion trans = new Transformacion (2);
		trans.getArbol().imprimirPorNivel();
		System.out.println();
		System.out.println("-------------------------");
		trans.suma().imprimirPorNivel();

	}

}
