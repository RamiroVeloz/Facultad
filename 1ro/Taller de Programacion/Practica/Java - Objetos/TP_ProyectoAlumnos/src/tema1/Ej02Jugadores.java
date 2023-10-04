
package tema1;
import PaqueteLectura.Lector;
//Paso 1: Importar la funcionalidad para lectura de datos


public class Ej02Jugadores {

  
    public static void main(String[] args) {
        int dimf = 15;
        //Paso 2: Declarar la variable vector de double 
        double [] vector;
        //Paso 3: Crear el vector para 15 double 
        vector = new double [dimf];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i,cant = 0;
        double total = 0, prom = 0 ,alt ;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 1 ; i <= 15 ; i ++){
            System.out.print("Ingrese la altura del jugador "+ i + " : ");alt = Lector.leerDouble();
            vector[i] = alt;
            total += alt;
        }
        
        for (i = 1 ; i <= 15 ; i ++){
            System.out.println("Jugador "+ i + " | Altura:  "+ vector[i]);
        }
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = total / dimf;
        System.out.println("La altura promedio es: "+ prom);
        
         //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 1 ; i <= 15; i++){
            if (vector[i] > prom){
                cant ++;
            }
        }
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores que superan la altura promedio es: " + cant);
        
        
       
     
        
        
    }
    
}
