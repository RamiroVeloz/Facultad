package TP3.Ej4;
import TP1.ej8.Queue;
import TP3.ayed2024.src.tp3.ejercicio1.GeneralTree;
public class AnalizadorArbol {
	
	public double devolverMaximoPromedio (GeneralTree<AreaEmpresa> arbol) {
		
        Queue<GeneralTree<AreaEmpresa>> cola = new Queue<>();
        cola.enqueue(arbol);
        double max = 0;
        int act = 0;
        double prom;
        while(!cola.isEmpty()){
        	act = cola.size();
            int cant = 0;
        	double suma = 0;
            for (int i = 0; i < act; i++) {
            	GeneralTree<AreaEmpresa> aux = cola.dequeue();
            	cant++;
            	suma += aux.getData().getTiempo();
            	if (aux.hasChildren()) {
                	for (GeneralTree<AreaEmpresa> child : aux.getChildren()){
                		cola.enqueue(child);
                	}
                }
            }
            prom = suma / cant;
            if (prom > max) {
            	max = prom;
            }
        }
        return max;
	}
}

