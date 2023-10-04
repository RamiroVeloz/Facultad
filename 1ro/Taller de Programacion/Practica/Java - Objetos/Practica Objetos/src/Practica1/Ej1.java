/*
1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la 
tabla del 2. Luego escriba las instrucciones necesarias para:

- generar enteros aleatorios hasta obtener el número 11. Para cada número 
muestre el resultado de multiplicarlo por 2 (accediendo al vector).
 */
package Practica1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej1 {

    public static void main(String[] args) {
        int dimf = 11;    
        int [] tablaDos = new int [dimf];
        int aux;
        
        for (int i = 0; i < 11 ; i++){
            tablaDos [i] = 2 * i;
        }
        
        for (int i = 0; i < 11 ; i++){
            System.out.println("2 por " + i + " = " + tablaDos[i]);
        }
        
        aux = GeneradorAleatorio.generarInt(11) + 1;
        while (aux != 11){
            System.out.println(aux + " multiplicado por 2 = "+ tablaDos[aux]);
            aux = GeneradorAleatorio.generarInt(dimf) + 1;
        }
    }
}
    
