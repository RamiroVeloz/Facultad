package Ivan;

import java.util.LinkedList;
import java.util.List;

//	Implemente en la clase GeneralTree los siguientes métodos
//	a) public int altura(): int devuelve la altura del árbol, es decir, la longitud del camino más largo
//	desde el nodo raíz hasta una hoja.
//	b) public int nivel(T dato) devuelve la profundidad o nivel del dato en el árbol. El nivel de un nodo
//	es la longitud del único camino de la raíz al nodo.
//	c) public int ancho(): int la amplitud (ancho) de un árbol se define como la cantidad de nodos que
//	se encuentran en el nivel que posee la mayor cantidad de nodos.

public class Main {
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
		
		RecorridosAG recorridos = new RecorridosAG();
		//int num = 3;
		
		//List<Integer> listaImparesPreOrder = recorridos.numerosImparesMayoresQuePreOrden(A, num);
		//List<Integer> listaImparesLevelOrden = recorridos.numerosImparesMayoresQuePorNiveles(A, num);

		
		//System.out.println();
		//System.out.println("La longitud del camino más largo desde el nodo raíz hasta una hoja es "+A3.altura());

		A.porNiveles();

		System.out.println();
		System.out.println("El nivel del dato en el arbol es "+A.nivel(30));
	}
	
}
