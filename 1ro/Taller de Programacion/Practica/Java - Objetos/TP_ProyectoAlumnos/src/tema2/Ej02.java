/*
Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta 
obtener edad 0. Luego de almacenar la información:

 - Informe la cantidad de personas mayores de 65 años.

 - Muestre la representación de la persona con menor DNI.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02 {

    public static void main(String[] args) {
        String nom;
        int dni,edad;
        
        int dimf = 15, diml = 0;
        int cant = 0, pos = 0, menor = 9999;
            
        Persona [] grupo = new Persona [dimf];
        Persona aux;
        
        GeneradorAleatorio.iniciar();
        nom = GeneradorAleatorio.generarString(10);
        dni = GeneradorAleatorio.generarInt(9999);
        edad = GeneradorAleatorio.generarInt(100);
        while ((edad != 0) && (diml < dimf)){
            aux = new Persona (nom, dni, edad);
            grupo[diml] = aux;
            diml ++;
            nom = GeneradorAleatorio.generarString(10);
            dni = GeneradorAleatorio.generarInt(9999);
            edad = GeneradorAleatorio.generarInt(100);
        }
        
        for (int i = 0; i <  diml ; i++){
            System.out.println(i + " - " +grupo[i].toString());
        }
        
        for (int i = 0; i <  diml ; i++){
            if (grupo[i].getEdad() > 65){
                cant++;
            }
        }
        System.out.println("La cantidad de personas con edad mayor a 65 es: " + cant);
        
        for (int i = 0; i< diml ; i++){
            if (grupo[i].getEdad() < menor){
                menor = grupo[i].getEdad();
                pos = i;
            }
        }
        
        System.out.println(grupo[pos].toString());
        
    }
    
}
