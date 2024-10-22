package ej2;
import generalTree.GeneralTree;
import java.util.ArrayList;
import java.util.List;


public class Ej2 {

	public static void main(String[] args) {
		GeneralTree<Integer> a1 = new GeneralTree<Integer>(1);
		List<GeneralTree<Integer>> children2 = new ArrayList<GeneralTree<Integer>>();
		children2.add(new GeneralTree<Integer>(9));
		children2.add(new GeneralTree<Integer>(3));
		children2.add(new GeneralTree<Integer>(11));
		
		GeneralTree<Integer> a2 = new GeneralTree<Integer>(2, children2);
		List<GeneralTree<Integer>> children3 = new ArrayList<GeneralTree<Integer>>();
		children3.add(new GeneralTree<Integer>(5));
		children3.add(new GeneralTree<Integer>(7));
		GeneralTree<Integer> a3 = new GeneralTree<Integer>(3, children3);
		
		List<GeneralTree<Integer>> childen = new ArrayList<GeneralTree<Integer>>();
		childen.add(a1);childen.add(a2);childen.add(a3);
		GeneralTree<Integer> a = new GeneralTree<Integer>(0, childen);

		
		RecorridosAG ra = new RecorridosAG ();
		
		List <Integer> preOrden = ra.numerosImparesMayoresQuePreOrden(a, 3);
		
		System.out.print ("Los impares mayores al pasado por parametro en preOrden es: ");
		System.out.println();
		for (Integer i : preOrden ) {
			System.out.println(i);
		}
		
		System.out.println();
		System.out.println ("Los impares mayores al pasado por parametro en inOrden es: ");
		List <Integer> inOrden = ra.numerosImparesMayoresQueInOrden(a, 3);
		for (Integer i : inOrden ) {
			System.out.println(i);
		}
		
		System.out.println();
		System.out.println ("Los impares mayores al pasado por parametro en postOrden es: ");
		List <Integer> postOrden = ra.numerosImparesMayoresQuePostOrden(a, 3);
		for (Integer i : postOrden ) {
			System.out.println(i);
		}
		
		System.out.println();
		System.out.println ("Los impares mayores al pasado por parametro por niveles es: ");
		List <Integer> porNiveles = ra.numerosImparesMayoresQuePorNiveles(a, 3);
		for (Integer i : porNiveles ) {
			System.out.println(i);
		}

	}

}
