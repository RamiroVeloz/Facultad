/*
1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la 
tabla del 2. Luego escriba las instrucciones necesarias para:

- generar enteros aleatorios hasta obtener el número 11. Para cada número 
muestre el resultado de multiplicarlo por 2 (accediendo al vector).
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF = 11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        GeneradorAleatorio.iniciar();
        int num = GeneradorAleatorio.generarInt(11)+ 1;
        do{
            System.out.println("El numero " +  num + " multiplciado por 2 da como resultado: " + tabla2[num]);
            num = GeneradorAleatorio.generarInt(11)+1;
        }while (num != 11);
        
        
    }
    
}
