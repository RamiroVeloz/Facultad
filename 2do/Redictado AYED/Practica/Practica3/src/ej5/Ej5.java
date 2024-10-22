package ej5;
import generalTree.GeneralTree;
import java.util.ArrayList;
import java.util.List;


public class Ej5 {

	public static void main (String [] Args) {
		
		GeneralTree<Integer> A1 = new GeneralTree<Integer>(1);
        List <GeneralTree<Integer>> children1 = new ArrayList<GeneralTree<Integer>>();
        children1.add(new GeneralTree<Integer>(5));
        children1.add(new GeneralTree<Integer>(9));
        children1.add(new GeneralTree<Integer>(30));

        GeneralTree<Integer> A2 = new GeneralTree<Integer>(2,children1);
        List <GeneralTree<Integer>> children2 = new ArrayList<GeneralTree<Integer>>();
        children2.add(new GeneralTree<Integer>(6));
        children2.add(new GeneralTree<Integer>(7));

        GeneralTree<Integer> A3 = new GeneralTree<Integer>(3,children2);
        List <GeneralTree<Integer>> children = new ArrayList<GeneralTree<Integer>>();
        children.add(A1);
        children.add(A2);
        children.add(A3);
        GeneralTree<Integer> A = new GeneralTree<Integer>(4,children);

        System.out.println();
        System.out.println(A.esAncestro(2, 30));
		
	}
	
}
