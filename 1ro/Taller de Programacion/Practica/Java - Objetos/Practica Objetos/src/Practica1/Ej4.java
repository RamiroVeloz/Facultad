/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4).
Realice un programa que permita informar la cantidad de personas que 
concurrieron a cada oficina de cada piso.
Para esto, simule la llegada de personas al 
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de 
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro. 
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package Practica1;

import PaqueteLectura.Lector;


public class Ej4 {

    public static void main(String[] args) {
        int dimf = 8, dimc = 4;
        int [][] oficinas = new int [dimf][dimc];
        
        int nro,ofi;
        
        for (int i = 0; i < dimf ; i++){
            for (int j = 0; j < dimc; j++){
                oficinas[i][j] = 0;
            }
        }
        
        System.out.println("Ingrese el numero de piso: ");
        nro = Lector.leerInt();
        while (nro != 9){
            System.out.println("Ingrese el numero de oficina: ");
            ofi = Lector.leerInt();
            oficinas [nro-1][ofi-1] ++;
            System.out.println("Ingrese el numero de piso: ");
            nro = Lector.leerInt();
        }
        
        
        for (int i = 0; i < dimf ; i++){
            for (int j = 0; j < dimc; j++){
                System.out.println("Piso " + i + " Oficina " + j + " : " + oficinas[i][j] + " | ");
            }
            System.out.println("");
            System.out.println("======================================");
        }
        
    }
    
}
