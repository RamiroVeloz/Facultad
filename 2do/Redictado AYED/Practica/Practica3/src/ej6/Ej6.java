package ej6;
import generalTree.GeneralTree;
import java.util.List;
import java.util.ArrayList;


public class Ej6 {

	public static void main (String [] Args) {
		
		GeneralTree<Character> n13 = new GeneralTree <Character>('M');
		GeneralTree<Character> n14 = new GeneralTree <Character>('N');
		List <GeneralTree<Character>> ch1 = new ArrayList<GeneralTree<Character>> ();
		ch1.add(n13);ch1.add(n14);
		GeneralTree<Character> a6 = new GeneralTree <Character>('J',ch1);
		
		GeneralTree<Character> n8 = new GeneralTree <Character>('H');
		GeneralTree<Character> n9 = new GeneralTree <Character>('I');
		GeneralTree<Character> n10 = new GeneralTree <Character>('K');
		GeneralTree<Character> n11 = new GeneralTree <Character>('P');
		List <GeneralTree<Character>> ch2 = new ArrayList<GeneralTree<Character>> ();
		ch2.add(n8);ch2.add(n9);ch2.add(a6);ch2.add(n10);ch2.add(n11);
		GeneralTree<Character> a3 = new GeneralTree <Character>('D',ch2);
		
		GeneralTree<Character> n12 = new GeneralTree <Character>('L');
		List <GeneralTree<Character>> ch3 = new ArrayList<GeneralTree<Character>> ();
		ch3.add(n12);
		GeneralTree<Character> a4 = new GeneralTree <Character>('G',ch3);
		
		GeneralTree<Character> n5 = new GeneralTree <Character>('F');
		List <GeneralTree<Character>> ch4 = new ArrayList<GeneralTree<Character>> ();
		ch4.add(n5); ch4.add(a4); 
		GeneralTree<Character> a2 = new GeneralTree <Character>('C',ch4);
		
		GeneralTree<Character> n1 = new GeneralTree <Character>('B');
		GeneralTree<Character> n4 = new GeneralTree <Character>('E');
		List <GeneralTree<Character>> children = new ArrayList<GeneralTree<Character>> ();
		children.add(n1);children.add(a2);children.add(a3);children.add(n4);
		GeneralTree<Character> arbol = new GeneralTree <Character>('A',children);
		
		arbol.porNiveles();
		RedAguaPotable red = new RedAguaPotable (arbol);
		double minimo = 1000;
		System.out.println("El caudal minimo que pasa por el agua es: " + red.minimoCaudal(minimo));
		
	}
	
}
