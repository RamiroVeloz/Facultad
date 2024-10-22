/*
5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio 
(double), el color de relleno (String) y el color de línea (String). 
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para: 

- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)

B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e 
informe en consola el perímetro y el área. 
 */
package tema3;

import PaqueteLectura.Lector;


public class Ej05 {

    public static void main(String[] args) {
        Circulo c1 = new Circulo ();
        
        System.out.println("Ingrese un radio: ");c1.setRadio(Lector.leerDouble());
        System.out.println("Ingrese un color de relleno: ");c1.setColorRelleno(Lector.leerString());
        System.out.println("Ingrese un color de linea:  ");c1.setColorLinea(Lector.leerString());
        
        System.out.println("Perimetro del circulo: " + c1.calcularPerimetro());
        System.out.println("Area del circulo: " + c1.calcularArea());
    }
    
}
