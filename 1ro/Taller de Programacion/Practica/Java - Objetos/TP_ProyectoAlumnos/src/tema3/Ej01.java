/*
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área. 
 */
package tema3;

import PaqueteLectura.Lector;

public class Ej01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        double l1,l2,l3;
        String cr,cl;
        
        System.out.println("Ingrese el lado A: ");l1 = Lector.leerDouble();
        System.out.println("Ingrese el lado B: "); l2 = Lector.leerDouble();
        System.out.println("Ingrese el lado C: ");l3 = Lector.leerDouble();
        System.out.println("Ingrese un color de relleno: "); cr = Lector.leerString();
        System.out.println("Ingrese un color de linea: "); cl = Lector.leerString();
        
        Triangulo t1 = new Triangulo (l1,l2,l3,cr,cl);
        
        System.out.println("Area : " + t1.calcularArea());
        System.out.println("Perimetro: "+ t1.devolverPerimetro());
        
        
    }
    
}
