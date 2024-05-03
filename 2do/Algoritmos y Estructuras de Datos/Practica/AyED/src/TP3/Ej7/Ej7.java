package TP3.Ej7;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;
import java.util.List;
import java.util.LinkedList;

public class Ej7 {

	public static void main(String[] args) {
		GeneralTree <Integer> n1 = new GeneralTree <Integer> (16);
		GeneralTree <Integer> n2 = new GeneralTree <Integer> (7);
		List <GeneralTree <Integer>> l1 = new LinkedList <> ();
		l1.add(n1); l1.add(n2);
		GeneralTree <Integer> a1 = new GeneralTree <Integer> (14, l1);
		
		GeneralTree <Integer> n3 = new GeneralTree <Integer> (1);
		List <GeneralTree <Integer>> l2 = new LinkedList <> ();
		l2.add(n3);
		GeneralTree <Integer> a2 = new GeneralTree <Integer> (6, l2);
		
		GeneralTree <Integer> n4 = new GeneralTree <Integer> (18);
		List <GeneralTree <Integer>> l3 = new LinkedList <> ();
		l3.add(a1); l3.add(n4);
		GeneralTree <Integer> a3 = new GeneralTree <Integer> (15, l3);
		
		GeneralTree <Integer> n6 = new GeneralTree <Integer> (10);
		List <GeneralTree <Integer>> l4 = new LinkedList <> ();
		l4.add(n6);l4.add(a2);
		GeneralTree <Integer> a4 = new GeneralTree <Integer> (17, l4);
		
		List <GeneralTree<Integer>> l5 = new LinkedList<GeneralTree<Integer>>();
		GeneralTree <Integer> n5 = new GeneralTree <Integer> (8);
		l5.add(n5);
		GeneralTree <Integer> a5 = new GeneralTree <Integer> (9, l5);
		
		List <GeneralTree<Integer>> children = new LinkedList<GeneralTree<Integer>>();
		children.add(a4); children.add(a5); children.add(a3);
		GeneralTree <Integer> arbol = new GeneralTree <Integer> (12,children);
		
		arbol.porNiveles();

		Caminos cam = new Caminos (arbol);
		
		List <Integer> lista = cam.caminoAHojaMasLejana();
		
		for (Integer i : lista) {
			System.out.println(i);
		}
		
	}

}
