package TP3.Ej4;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;
import java.util.LinkedList;
import java.util.List;

public class Ej4 {

	public static void main(String[] args) {
		
		
		List <GeneralTree<AreaEmpresa>> ch1 = new LinkedList <GeneralTree<AreaEmpresa>>();
		ch1.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("A", 4)));
		ch1.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("B", 7)));
		ch1.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("C", 5)));
		GeneralTree <AreaEmpresa> a1 = new GeneralTree<AreaEmpresa>(new AreaEmpresa("J",13),ch1);
		
		List <GeneralTree<AreaEmpresa>> ch2 = new LinkedList <GeneralTree<AreaEmpresa>>();
		ch1.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("D", 6)));
		ch1.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("E", 10)));
		ch1.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("F", 18)));
		GeneralTree <AreaEmpresa> a2 = new GeneralTree<AreaEmpresa>(new AreaEmpresa("K",25),ch2);

		
		List <GeneralTree<AreaEmpresa>> ch3 = new LinkedList <GeneralTree<AreaEmpresa>>();
		ch3.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("G", 6)));
		ch3.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("H", 10)));
		ch3.add(new GeneralTree<AreaEmpresa>(new AreaEmpresa ("I", 18)));
		GeneralTree <AreaEmpresa> a3 = new GeneralTree<AreaEmpresa>(new AreaEmpresa("L",10),ch3);
		
		List <GeneralTree<AreaEmpresa>> children = new LinkedList <GeneralTree<AreaEmpresa>>();
		children.add(a1);
		children.add(a2);
		children.add(a3);
		GeneralTree<AreaEmpresa> arbol = new GeneralTree<AreaEmpresa> (new AreaEmpresa("M",14),children);

		arbol.porNiveles();
		AnalizadorArbol aa = new AnalizadorArbol();
		System.out.println("El tiempo promedio por niveles de delay es: " + aa.devolverMaximoPromedio(arbol));
		
	}

}
