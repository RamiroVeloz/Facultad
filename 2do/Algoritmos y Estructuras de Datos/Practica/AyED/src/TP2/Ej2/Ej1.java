package TP2.Ej2;
import java.util.Random;

import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;

public class Ej1 {
	
	public static void main(String[] args) {
		BinaryTree <Integer> ab = new BinaryTree <Integer> ();
		Random ran = new Random();
		ab.setData(1);
		for ( int i = 0; i < 10; i ++) {
			Integer x = ran.nextInt(100);
			ab.agregarNodo(x);
		}
		
		ab.imprimirArbol();
		BinaryTree<Integer> espejo = ab.espejo();
		System.out.println();
		espejo.imprimirArbol();
		System.out.println();
		System.out.println("La cantidad de hojas del arbol es: " + ab.contarHojas(ab));
		ab.imprimirPorNivel();
		System.out.println();
		ab.imprimirEntreNiveles(1,3);
	}

}
