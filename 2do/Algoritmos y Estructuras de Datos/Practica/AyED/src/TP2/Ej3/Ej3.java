package TP2.Ej3;
import TP2.ayed2024.src.tp2.ejercicio1.BinaryTree;
import java.util.Random;
import java.util.ArrayList;
public class Ej3 {

	public static void main(String[] args) {
		BinaryTree <Integer> arbol = new BinaryTree<Integer>();
		Random ran = new Random();
		for (int i = 0; i < 10 ; i ++) {
			Integer value = ran.nextInt(20);
			arbol.agregarNodo(value);
		}
		arbol.imprimirArbol();
		ContadorArbol ca = new ContadorArbol (arbol);
		ArrayList <Integer> lio = new ArrayList <Integer> (); lio = ca.numerosParesInOrden(lio, ca.getArbol());
		ArrayList <Integer> lpo = new ArrayList <Integer> (); lpo = ca.numerosParesPostOrden(lpo, ca.getArbol());
		
		System.out.println();
		
		for (Integer i : lio) {
			System.out.println (i);
		}
		
		System.out.println();
		
		for (Integer i : lpo) {
			System.out.println (i);
		}
	}

}
