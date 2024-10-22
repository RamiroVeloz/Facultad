package ej3;

import java.util.ArrayList;
import java.util.List;

import generalTree.GeneralTree;

public class Ej3 {
	
	public static void main (String [] Args) {
		
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
		
		System.out.println(a.altura());
		System.out.println(a.nivel(7));
		System.out.println(a.ancho());
		
		
	}
	
}
