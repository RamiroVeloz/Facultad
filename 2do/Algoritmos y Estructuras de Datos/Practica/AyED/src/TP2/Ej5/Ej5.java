package TP2.Ej5;

public class Ej5 {

	public static void main(String[] args) {
		ProfundidadArbol pa = new ProfundidadArbol (5);
		System.out.println();
		pa.getArbol().imprimirPorNivel();
		System.out.println();
		System.out.println("Suma del nivel pasado por parametro: " + pa.sumaElementosProfundidad(2));
	}

}
