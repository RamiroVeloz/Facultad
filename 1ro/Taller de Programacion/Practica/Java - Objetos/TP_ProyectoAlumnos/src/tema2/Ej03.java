/*
3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en 
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así 
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 
40 cupos de casting.

Una vez finalizada la inscripción: 

b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.

NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar 
Strings use el método equals.
 */
package tema2;
import PaqueteLectura.Lector;

public class Ej03 {


    public static void main(String[] args) {
        int dimf = 3, dimc = 3;
        Persona [][] casting = new Persona [dimf][dimc];
        Persona aux;
        int dia,turno,dimt;
        boolean cargado = false;
        
        for (int i = 0; i< dimf; i++){
            for (int j = 0; j < dimc; j++){
                casting[i][j] = null;
            }
        }
        
        aux = new Persona();
        System.out.println("Ingrese el nombre de la persona: ");
        aux.setNombre(Lector.leerString());
        
        dia = 0;
        while ((dia < dimf)&&(!aux.getNombre().equals("ZZZ"))){
            turno = 0;
            while ((turno < dimc)&&((!aux.getNombre().equals("ZZZ")))){
                if (!aux.getNombre().equals("ZZZ")){
                    System.out.println("Ingrese el DNI: ");
                    aux.setDNI(Lector.leerInt());
                    System.out.println("Ingrese la edad: ");
                    aux.setEdad(Lector.leerInt());
                    casting[dia][turno] = aux;
                    turno++;
                }
                aux = new Persona();
                System.out.println("Ingrese el nombre de la persona: ");
                aux.setNombre(Lector.leerString());
            }
            dia ++;
        }
        
        for (int i = 0; i < dimf; i++){
            System.out.println("Dia :" + i);
            for (int j = 0; j < dimc; j++){
                if (casting[i][j] != null){
                    System.out.println(casting[i][j].getNombre() + "tiene turno " + j); 
                }
            }
        }
        
        
        
    }
    
}
