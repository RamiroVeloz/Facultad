/*
4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que 
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al 
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de 
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro. 
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
 */
package tema1;
import PaqueteLectura.Lector;

public class Ej04 {

    public static void main(String[] args) {
        int dimf = 8;
        int dimc = 4;
        int [][] edificio = new int [dimf][dimc];
        
        int piso, oficina;
        
        for (int i= 0; i < 8; i++){
            for (int j= 0; j <4 ; j++){
                edificio[i][j] = 0;
            }
        }
        
        System.out.print("Ingrese el piso al que desea llegar o 9 para finalizar: ");piso = Lector.leerInt();
        while (piso != 9){
            System.out.print("Ingrese la oficina a la que desea llegar: ");oficina = Lector.leerInt();
            edificio[piso][oficina] ++;
            System.out.print("Ingrese el piso al que desea llegar o 9 para finalizar: ");piso = Lector.leerInt();
        }
        
        for (int i= 0; i < 8; i++){
            for (int j= 0; j <4 ; j++){
                System.out.print("Piso " + i + " Oficina " + j + " Cantidad de visitantes: " + edificio[i][j] + " | ");
            }
            System.out.println();
        }
    }
}
