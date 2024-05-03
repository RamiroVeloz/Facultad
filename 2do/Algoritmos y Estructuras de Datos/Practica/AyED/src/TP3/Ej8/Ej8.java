package TP3.Ej8;
import java.util.List;
import java.util.LinkedList;
import TP3.ayed2024.src.tp3.ejercicio1.*;

public class Ej8 {

	public static void main(String[] args) {
////////////////////////////Arbol 1
List <GeneralTree<Integer>> children1 = new LinkedList<GeneralTree<Integer>>();
children1.add(new GeneralTree<Integer>(2));
children1.add(new GeneralTree<Integer>(3));
children1.add(new GeneralTree<Integer>(4));
GeneralTree<Integer> A1 = new GeneralTree<Integer>(1,children1);

////////////////////////////    Arbol 2
List <GeneralTree<Integer>> children2 = new LinkedList<GeneralTree<Integer>>();
children2.add(new GeneralTree<Integer>(5));
children2.add(new GeneralTree<Integer>(6));
children2.add(new GeneralTree<Integer>(7));
GeneralTree<Integer> A2 = new GeneralTree<Integer>(2,children2);

List <GeneralTree<Integer>> children3 = new LinkedList<GeneralTree<Integer>>();
children3.add(A2);
children3.add(new GeneralTree<Integer>(3));
children3.add(new GeneralTree<Integer>(4));
GeneralTree<Integer> A3 = new GeneralTree<Integer>(1,children3);

////////////////////////////    Arbol 3
List <GeneralTree<Integer>> children4 = new LinkedList<GeneralTree<Integer>>();
children4.add(new GeneralTree<Integer>(6));
children4.add(new GeneralTree<Integer>(7));
children4.add(new GeneralTree<Integer>(8));
GeneralTree<Integer> A4 = new GeneralTree<Integer>(3,children4);

List <GeneralTree<Integer>> children5 = new LinkedList<GeneralTree<Integer>>();
children5.add(new GeneralTree<Integer>(2));
children5.add(A4);
children5.add(new GeneralTree<Integer>(4));
children5.add(new GeneralTree<Integer>(5));
GeneralTree<Integer> A5 = new GeneralTree<Integer>(1,children5);

	Navidad nav1 = new Navidad(A1);
	Navidad nav2 = new Navidad(A3);
	Navidad nav3 = new Navidad(A5);
	
	System.out.println(nav1.esAbeto());
	System.out.println(nav2.esAbeto());
	System.out.println(nav3.esAbeto());

	}

}
