/*
4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:

a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el 
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación. 
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos 
de casting.

Una vez finalizada la inscripción:

b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la 
persona a entrevistar en cada turno asignado.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej04 {

    public static void main(String[] args) {
       int dimf = 5, dimc  = 8;
       
       Persona [] [] casting = new Persona [dimf][dimc];
       
       int dia=0,turno = 0,cant,cupos = 40;
       Persona aux;
       
       boolean cargado=false;
       
       
       for (int i = 0; i < dimf ; i++){
           for (int j = 0; j < dimc; j++){
               casting[i][j] = null;
           }
       }
       GeneradorAleatorio.iniciar();
       
       aux = new Persona();
       System.out.println("Ingrese un nombre: "); aux.setNombre(Lector.leerString());
       while ((cupos > 0)&&(!aux.getNombre().equals("ZZZ"))){
           if (!aux.getNombre().equals("ZZZ")){
               aux.setDNI(GeneradorAleatorio.generarInt(9999));
               System.out.println("DNI: "+ aux.getDNI());
               aux.setEdad(GeneradorAleatorio.generarInt(99));
               System.out.println("Edad: "+ aux.getEdad());
               System.out.println("Ingrese un dia para la entrevista: ");dia = Lector.leerInt();
               turno = 0;
               cargado = false;
               while ((!cargado) && (turno < dimc)){
                    if (casting[dia-1][turno] == null){
                        casting[dia-1][turno] = aux;
                        cargado = true;
                        cupos--;
                    }
                    turno++;
                }
            }
            if (cargado){
                System.out.println("Se le asigno el dia "+ dia + " turno " + turno);
            }
            aux = new Persona();
            System.out.println("Ingrese un nombre: "); aux.setNombre(Lector.leerString());
        }
       
       for (int i = 0; i < dimf ; i++){
           System.out.println("Dia: " + i);
           cant = 0;
           for (int j = 0; j < dimc; j++){
               if (casting [i][j] != null){
                   cant ++;
                   System.out.println(casting[i][j].getNombre() + " tiene el turno " + j);
               }
           }
           System.out.println("La cantidad de inscriptos del dia "+ i + " es: "+ cant);
       }
    }
}


       
