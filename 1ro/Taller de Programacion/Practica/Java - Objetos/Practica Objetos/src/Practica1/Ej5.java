/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen 
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad 
de la comida (2) Precio (3) Ambiente.

Escriba un programa que lea desde teclado las calificaciones de los cinco clientes 
para cada uno de los aspectos y almacene la información en una estructura. Luego 
imprima la calificación promedio obtenida por cada aspecto.
 */
package Practica1;

import PaqueteLectura.Lector;


public class Ej5 {

    public static void main(String[] args) {
        int dimf = 5, dimc = 4;
        int [] [] clientes = new int [dimf][dimc];
        
        String [] servicios = new String [dimc];
        servicios[0] = "Atencion al Cliente";
        servicios[1] = "Calidad de la Comida";
        servicios[2] = "Precio";
        servicios[3] = "Ambiente";
        
        int total;
        double prom;
        
        int nota;
        for (int i = 0; i < dimf; i++){
            for (int j = 0; j < dimc; j++){
                System.out.println((i+1) + " - Ingrese la nota del aspecto " + servicios[j] + " : ");nota = Lector.leerInt();
                clientes [i][j] = nota;
            }
            System.out.println("");
        }
        
        for (int i = 0; i < dimc; i++){
            for (int j = 0; j < dimf; j++){
                System.out.println((j+1) + " - Notas del aspecto " + servicios[i] + " : " + clientes[j][i]);
            }
            System.out.println("");
            System.out.println("---------------------------------------");
        }
        
        for (int i = 0; i < dimc; i++){
            total = 0;
            for (int j = 0; j < dimf; j++){
                total += clientes[j][i];
            }
            prom = (double)total / dimf;
            System.out.println("El promedio del servicio "+ servicios[i] +  " es : " + prom);
        }
        
        
    }
    
}
