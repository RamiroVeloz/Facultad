package Repaso02;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ejecutable {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacionamiento e = new Estacionamiento ("Parque Automotor", "7 y 50", 6,21,3,3);
        
        
        Auto a1 = new Auto ("Jorge",GeneradorAleatorio.generarString(8));
        Auto a2 = new Auto ("Pedro",GeneradorAleatorio.generarString(8));
        Auto a3 = new Auto ("Liliana",GeneradorAleatorio.generarString(8));
        Auto a4 = new Auto ("Veronica","ZZZ000");
        Auto a5 = new Auto ("Julio",GeneradorAleatorio.generarString(8));
        Auto a6 = new Auto ("Lola",GeneradorAleatorio.generarString(8));
        
        e.registrarAuto(a1, 1, 1);
        e.registrarAuto(a2, 2, 2);
        e.registrarAuto(a3, 3, 3);
        e.registrarAuto(a4, 1, 3);
        e.registrarAuto(a5, 3, 1);
        e.registrarAuto(a6, 2, 3);
        
        System.out.println(e.toString());
        System.out.println(e.contarPlazas(1));
        
        System.out.println("Ingrese una patente para buscar: ");String pat = Lector.leerString();
        System.out.println(e.encontrarAutoPorPatente(pat));
        
        
    }
    
}
