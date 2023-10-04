/*
3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice 
la matriz con números aleatorios entre 0 y 30. 
Luego realice las siguientes operaciones:

- Mostrar el contenido de la matriz en consola.  x
- Calcular e informar la suma de los elementos de la fila 1. x
- Generar un vector de 5 posiciones donde cada posición j contiene la suma 
de los elementos de la columna j de la matriz. Luego, imprima el vector.

- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de 
encontrarse indique su ubicación (fila y columna) en caso contrario 
imprima “No se encontró el elemento”.

 */
package Practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej3 {

    public static void main(String[] args) {
        int dimf = 5, dimc = 5;
        int [][] enteros = new int [dimf][dimc];
        
        int total = 0,aux;
        int [] sumaColumnas = new int [dimf];
        
        boolean esta;
        int posx, posy;
        
        GeneradorAleatorio.iniciar();
        
        for (int i=0; i<dimf ; i++){
            for (int j = 0; j < dimc ; j++){
                enteros[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        
        for (int i=0; i<dimf ; i++){
            for (int j = 0; j < dimc ; j++){
                System.out.print(enteros[i][j] + " | ");
            }
            System.out.println("");
            System.out.println("---------------------------");
        }
        
        for (int i = 0; i < dimc ; i++){
            total += enteros [1][i];
        }
        System.out.println("La suma total de los valores de la fila 1 es: "+ total);
        
        for (int i = 0; i < dimf; i++){
            aux = 0;
            for (int j =0; j < dimc ; j++){
                aux += enteros [j][i];
            }
            sumaColumnas [i] = aux;
        }
        
        for (int i = 0; i < dimf; i++){
            System.out.println("Columna "+ i + " : "+ sumaColumnas[i]);
        }
        

        System.out.println("Ingrese un numero para buscar en la matriz: ");aux = Lector.leerInt();
        posx = 0; posy = 0; esta = false;
        while ((esta == false) && (posx < dimf)){
            posy = 0;
            while ((posy < dimc) && (!esta)){
                if ( enteros[posx][posy] == aux){
                    esta = true;
                } else {
                    posy ++;
                }
            }
            if (esta == false){
                posx ++;
            }
        }
        System.out.println(esta);
        if (!esta ){
            System.out.println("El elemento no se encuentra en el vector");
        }
        else{
            System.out.println("El elemento se encuentra en la posicion " +  posx + " , " + posy);
        }
    }
} 