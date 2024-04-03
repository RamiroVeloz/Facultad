package TP1.ej7;
import java.util.*;

public class Parte2 {

	public static void main(String[] args) {
		LinkedList <Estudiante> estudiantes = new LinkedList <Estudiante> ();
		
		Estudiante e1 = new Estudiante ("x","y",1,2);
		Estudiante e2 = new Estudiante ("a","b",3,4);
		Estudiante e3 = new Estudiante ("i","j",5,6);
		Estudiante prueba = new Estudiante ("i","j",5,6);
		
		estudiantes.add(e1);
		estudiantes.add(e2);
		estudiantes.add(e3);
		
		boolean aux = false;
		for (Estudiante i:estudiantes) {
			if (i instanceof Estudiante) {
				if ((i.getDni() == prueba.getDni()) && (i.getNom() == prueba.getNom()) && (i.getAp() == prueba.getAp()) && (i.getLegajo() == prueba.getLegajo())) {
					aux = true;
				}
			}
		}
		if (aux) {
			System.out.print ("El estudiante ya existe");
		}else {
			estudiantes.add(prueba);
		}
		
		
		ArrayList <Estudiante> estudiantes2 = new ArrayList <Estudiante> (estudiantes);
		estudiantes2.get(0).setNom("Jorge");
		
		
		
		System.out.println("Lista original: ");
		for (Estudiante i:estudiantes) {
			System.out.println (i.toString());
		}
		
		System.out.println("Lista copia de la original: ");
		for (Estudiante i:estudiantes2) {
			System.out.println (i.toString());
		}
		
		//Conclusion: Si bien se genera una nueva estructura, se hace una copia de la referencia al elemento, no de los elementos en si
		//Esto implica que la estructura no guarda a los estudiantes si no la referencia en memoria a las instancias de estudiante.
		
	}

}
