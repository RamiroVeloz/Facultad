/*
2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de 
básquet y las almacene en un vector. Luego informe: 
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
 */
package Practica1;

import PaqueteLectura.Lector;

public class Ej2 {

    public static void main(String[] args) {
        int dimf = 15;
        double [] jugadores = new double [dimf];
        
        double altura,total = 0,prom = 0;
        int cant = 0;
        
        for (int i = 0; i < dimf; i++){
            System.out.print("Ingrese la altura del jugador: ");altura = Lector.leerDouble();
            jugadores[i] = altura;
        }
        
        for (int i = 0; i < dimf; i++){
            total += jugadores[i];
        }
        prom = total / dimf;
        System.out.println("La altura promedio es: " + prom);
        
        for (int i = 0; i < dimf; i++){
            if (jugadores [i] > prom){
                cant ++;
            }
        }
        
        System.out.println("La cantidad de jugadores con una altura mayor al promedio es: "+ cant);
        
    }
    
}
