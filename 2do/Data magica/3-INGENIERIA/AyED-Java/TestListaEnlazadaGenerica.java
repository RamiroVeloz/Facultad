package Tp2_Ej2;
import tp02.ejercicio2.*;

public class TestListaEnlazadaGenerica{
	public static void main (String [] args) {
	ListaEnlazadaGenerica<Estudiante> l = new ListaEnlazadaGenerica<Estudiante>();
	boolean agregado;
	agregado=l.agregarFinal(new Estudiante("Juan","Perez",3,"juanperez@gmail.com","Cabildo 400"));
	if (agregado == true) {
		System.out.println("Fue agregado correctamente.");
	}
	agregado=l.agregarFinal(new Estudiante("Joaquin","Beracochea",2,"jberacochea1@gmail.com","209 317"));
	if (agregado == true) {
		System.out.println("Fue agregado correctamente.");
	}
	agregado=l.agregarFinal(new Estudiante("Carla","Renfifes",1,"carlaR@gmail.com","58 8946"));
	if (agregado == true) {
		System.out.println("Fue agregado correctamente.");
	}
	agregado=l.agregarFinal(new Estudiante("Joaquin","Pai",4,"JoacoP7@gmail.com","Diagonal 70 1458"));
	if (agregado == true) {
		System.out.println("Fue agregado correctamente.");
	}
	l.comenzar();
	for(int i=1; i<= l.tamanio();i++) {
		System.out.println(l.elemento(i).tusDatos());
	}
	}
}