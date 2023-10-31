package Rep2;
public class Ejecutable {
public static void main(String[] args) {
        Estanteria e = new Estanteria (5,3);
        
       Libro l1 = new Libro ("Poesia","Pedro", 10);
       Libro l2 = new Libro ("Drama","Sandra", 20);
       Libro l3 = new Libro ("Accion","Carla", 14);
       Libro l4 = new Libro ("Aventura","Maximo", 13);
       Libro l5 = new Libro ("Politica","Lucas", 11);
       Libro l6 = new Libro ("Economia","Pablo", 4);
       Libro l7 = new Libro ("Juego","Soledad", 1);
       
       e.agregarLibro(1, 1, l1);
       e.agregarLibro(2, 2, l2);
       e.agregarLibro(1, 2, l3);
       e.agregarLibro(3, 1, l4);
       e.agregarLibro(4, 3, l5);
       e.agregarLibro(2, 1, l6);
       e.agregarLibro(5, 3, l7);
       
       System.out.println(e.toString());
       
       if (e.buscarYsacar("Politica") == null){
           System.out.println("El libro no existe.");
       }else{
           System.out.println(e.buscarYsacar("Politica"));
       }
       
       System.out.println(e.toString());
       
       System.out.println(e.retornarMasPesado());
    }
    
}
