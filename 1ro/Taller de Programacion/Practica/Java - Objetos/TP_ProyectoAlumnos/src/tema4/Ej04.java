package tema4;
//La clase VisorFiguras tiene el metodo Mostrar, el cual envia un mensaje a los metodos
//toString de las clases cuadrado y rectangulo para imprimir sus atributos.
//getMostradas() es un metodo que devuelve la cantidad de veces que se uso el visor
public class Ej04 {

    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
 
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
 
        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);
 
        System.out.println(visor.getMostradas());

    }
    
}
