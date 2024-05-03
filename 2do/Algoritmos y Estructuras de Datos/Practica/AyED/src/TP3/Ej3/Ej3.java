package TP3.Ej3;

import java.util.LinkedList;
import java.util.List;

import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;

public class Ej3 {
	public static void main (String [] args ) {
		GeneralTree<Integer> a1 = new GeneralTree<Integer>(1);
		List<GeneralTree<Integer>> children2 = new LinkedList<GeneralTree<Integer>>();
		children2.add(new GeneralTree<Integer>(9));
		children2.add(new GeneralTree<Integer>(3));
		children2.add(new GeneralTree<Integer>(11));
		
		GeneralTree<Integer> a2 = new GeneralTree<Integer>(2, children2);
		List<GeneralTree<Integer>> children3 = new LinkedList<GeneralTree<Integer>>();
		children3.add(new GeneralTree<Integer>(5));
		children3.get(0).addChild(new GeneralTree<Integer>(19));
		
		GeneralTree<Integer> a3 = new GeneralTree<Integer>(3, children3);
		
		List<GeneralTree<Integer>> children4 = new LinkedList<GeneralTree<Integer>>();
		children4.add(new GeneralTree<Integer>(6));
		children4.get(0).addChild(new GeneralTree<Integer>(7));

		GeneralTree<Integer> a4 = new GeneralTree<Integer>(4, children4);
		List<GeneralTree<Integer>> childen = new LinkedList<GeneralTree<Integer>>();
		childen.add(a1);childen.add(a2);childen.add(a3);childen.add(a4);
		GeneralTree<Integer> a = new GeneralTree<Integer>(0, childen);
		
		
		a.porNiveles();
		System.out.println();
		int altura = 0;
		altura = a.altura(a);
		System.out.println("La altura del arbol es: " + altura);
		System.out.println();
		System.out.println("El nivel al que esta el dato ingresado por parametro es: " + a.nivel(7));
		System.out.println();
		System.out.println("El ancho del arbol es: " + a.ancho());
	}
}
