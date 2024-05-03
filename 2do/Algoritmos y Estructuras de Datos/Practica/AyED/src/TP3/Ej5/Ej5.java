package TP3.Ej5;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;
import java.util.List;
import java.util.LinkedList;

public class Ej5 {

	public static void main(String[] args) {
		GeneralTree<Integer> A1 = new GeneralTree<Integer>(1);
        List <GeneralTree<Integer>> children1 = new LinkedList<GeneralTree<Integer>>();
        children1.add(new GeneralTree<Integer>(5));
        children1.add(new GeneralTree<Integer>(9));
        children1.add(new GeneralTree<Integer>(30));

        GeneralTree<Integer> A2 = new GeneralTree<Integer>(2,children1);
        List <GeneralTree<Integer>> children2 = new LinkedList<GeneralTree<Integer>>();
        children2.add(new GeneralTree<Integer>(6));
        children2.add(new GeneralTree<Integer>(7));

        GeneralTree<Integer> A3 = new GeneralTree<Integer>(3,children2);
        List <GeneralTree<Integer>> children = new LinkedList<GeneralTree<Integer>>();
        children.add(A1);
        children.add(A2);
        children.add(A3);
        GeneralTree<Integer> A = new GeneralTree<Integer>(4,children);

        System.out.println();
        System.out.println(A.esAncestro(2, 30));
        
	}

}
