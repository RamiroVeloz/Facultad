/*
5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen 
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad 
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes 
para cada uno de los aspectos y almacene la información en una estructura. Luego 
imprima la calificación promedio obtenida por cada aspecto.
 */
package tema1;
import PaqueteLectura.Lector;

public class Ej05 {


    public static void main(String[] args) {
        int dimf = 5, dimc = 4;
        double [] [] cali = new double [dimf][dimc];
        double puntaje,prom = 0,total;

        for (int i = 0; i < dimf; i++){
            for (int j = 0; j < dimc ; j++){
                cali[i][j] = 0;
            }
        }
        
        for (int i = 0; i < dimf; i++){
            for (int j = 0; j < dimc ; j++){
                System.out.print("Cliente " + i + " Calificacion del aspecto " + j + " : ");puntaje = Lector.leerDouble();
                cali [i][j] = puntaje;
            }
        }
        for (int i = 0; i < dimf; i++){
            for (int j = 0; j < dimc ; j++){
                System.out.println("Cliente " + i + " puntaje del aspecto " + j + " : " + cali [i][j]);
            }
            System.out.println();
        }
        
        System.out.println("");
        for (int i = 0; i < dimc; i++){
            total = 0;
            for (int j = 0; j < dimf ; j++){
                total += cali[j][i];
            }
            prom = total / dimf;
            System.out.println("El promedio del aspecto "+ i + " es: "+ prom);
        }
        
        
        
    }
    
}
