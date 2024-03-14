package Rep2023;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ejecutable {
public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Concurso c = new Concurso (3,5);
        
        Cancion c1 = new Cancion (1,GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));
        Cancion c2 = new Cancion (1,GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));
        Cancion c3 = new Cancion (1,GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));
        Cancion c4 = new Cancion (1,GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));
        Cancion c5 = new Cancion (1,GeneradorAleatorio.generarString(10),GeneradorAleatorio.generarString(10));

        c.agregarCancion(0,0, c1);
        c.agregarCancion(1,1, c2);
        c.agregarCancion(1,2, c3);
        c.agregarCancion(2,2, c4);
        c.agregarCancion(2,0, c5);
        
        Estudiante aux; String nombre,apellido; int dni;
        int id; double puntaje;
        
        System.out.println("Ingrese el nombre: "); nombre = Lector.leerString();
       // System.out.println("Ingrese el apellido"); apellido =  Lector.leerString();
        //System.out.println("Ingrese el dni"); dni = Lector.leerInt();
        System.out.println("Ingrese un id: ");id = Lector.leerInt();
        while (id != 0){
            System.out.println("Ingrese un puntaje: "); puntaje = Lector.leerDouble();
            aux = new Estudiante (nombre,"",0);
            c.interpretarCancion(id, aux, puntaje);
            System.out.println("Ingrese el nombre: "); nombre = Lector.leerString();
            //System.out.println("Ingrese el apellido"); apellido =  Lector.leerString();
            //System.out.println("Ingrese el dni"); dni = Lector.leerInt();
            System.out.println("Ingrese un id: ");id = Lector.leerInt();
        }
        System.out.println("Ingrese un id para obtener el ganador: ");id = Lector.leerInt();
        if (c.conocerGanador(id) == null){
            System.out.println("Nadie");
        }else{
            System.out.println(c.conocerGanador(id));
        }
        
        System.out.println(c.cancionMaxEnCat(1));
        System.out.println(c.ganadoresCat());

    }
    
}
