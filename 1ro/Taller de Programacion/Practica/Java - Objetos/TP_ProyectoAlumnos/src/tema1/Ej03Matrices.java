/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
//Paso 1. importar la funcionalidad para generar datos aleatorios

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int dimf = 5, dimc = 5;
        int suma = 0, aux, posa = 0, posb = 0;
        boolean buscar = false;
        
        int [] [] m = new int [dimf][dimc];
        int [] v = new int [dimf];
        for (int i = 0 ; i < 5; i++ ){
            for(int j = 0; j < 5 ; j++){
                aux = GeneradorAleatorio.generarInt(30);
                m[i][j] = aux;
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for (int i = 0 ; i < 5; i++ ){
            for(int j = 0; j < 5 ; j++){
                System.out.print(m[i][j] + " | ");
            }
            System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for (int i = 0 ; i < 5; i++ ){
            suma += m[1][i];
        }
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        for (int i = 0 ; i < 5; i++ ){
            aux = 0;
            for(int j = 0; j < 5 ; j++){
                aux += m [j] [i] ;
            }
            v[i] = aux;
        }
        
        for (int i = 0 ; i < 5; i++ ){
            System.out.println(i+ " : " +v[i]);
        }
        
        
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        System.out.print("Ingrese un valor para buscarlo en la matriz: "); aux = Lector.leerInt();
        for (int i = 0; i < dimf ; i++){
            for (int j = 0; j< dimc ; j++){
                if (m[i][j] == aux){
                   posa = i;
                   posb = j;
                   buscar = true;
                }
            }
        }
        if (buscar == true){
            System.out.println("El numero se encuentra en la matriz en la posicion " + posa + " , " + posb);
        }
        else {
            System.out.println("El numero no se encuentra en la matriz.");
        }
    }
  }

