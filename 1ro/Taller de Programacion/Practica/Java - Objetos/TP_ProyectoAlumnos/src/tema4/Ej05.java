package tema4;
public class Ej05 {

    public static void main(String[] args) {
        VisorFigurasModificado visor = new VisorFigurasModificado();
 
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r1= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        Rectangulo r2= new Rectangulo(30,20,"Rojo","Celeste");
        Rectangulo r3= new Rectangulo(2,1,"Azul","Celeste");
        visor.guardar(c1);
        visor.guardar(r1);
        visor.guardar(c2);
        visor.guardar(r2);
        visor.guardar(r3);
        
        visor.mostrar();
        
        System.out.println("Hay espacio? -> " + visor.quedaEspacio());
    }
    
}
