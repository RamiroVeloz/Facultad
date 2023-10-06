package Repaso03;
import PaqueteLectura.GeneradorAleatorio;
public class Ejecutable {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Fecha f = new Fecha ("Buenos Aires", 4);
        EventoOcacional e = new EventoOcacional ("Metallica", 3, "privado","Carlos",f);
        
        
        
        Fecha f1 = new Fecha("La plata", 3);
        Fecha f2 = new Fecha("Berisso", 4);
        Fecha f3 = new Fecha("Ensenada", 5);
        Fecha f4 = new Fecha("City Bell", 6);
        Gira g = new Gira ("Slipknot", 4, "La vuelta loca", 5);
        g.agregarFecha(f1);
        g.agregarFecha(f2);
        g.agregarFecha(f3);
        g.agregarFecha(f4);
        
        e.agregarTema(GeneradorAleatorio.generarString(10));
        e.agregarTema(GeneradorAleatorio.generarString(10));
        e.agregarTema(GeneradorAleatorio.generarString(10));

        
        g.agregarTema(GeneradorAleatorio.generarString(10));
        g.agregarTema(GeneradorAleatorio.generarString(10));
        g.agregarTema(GeneradorAleatorio.generarString(10));
        g.agregarTema(GeneradorAleatorio.generarString(10));
        
        
        System.out.println(e.actuar());
        System.out.println("\n");
        System.out.println(g.actuar());
        System.out.println(g.actuar());
        System.out.println(g.actuar());
        System.out.println(g.actuar());
        
        System.out.println("Costo del evento: " + e.calcularCosto());
        System.out.println("Costo de la gira: "+ g.calcularCosto());
        
    }
    
}
