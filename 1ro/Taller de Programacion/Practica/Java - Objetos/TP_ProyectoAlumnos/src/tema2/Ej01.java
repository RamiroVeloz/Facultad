/*
Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse 
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese 
orden). Un objeto persona responde a los siguientes mensajes: 

getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, 
mi DNI es 11203737 y tengo 70 años”
 */
package tema2;

import PaqueteLectura.Lector;

public class Ej01 {

    public static void main(String[] args) {
        
        String nom;
        int dni,edad;
        
        //Metodo pasandole los valores al constructor.
        System.out.println("Ingrese un nombre:"); nom = Lector.leerString();
        System.out.println("Ingrese un dni: "); dni = Lector.leerInt();
        System.out.println("Ingrese una edad: "); edad = Lector.leerInt();
        
        Persona p1 = new Persona (nom,dni,edad);
        System.out.println(p1.toString());
        
        //Metodo pasandole los valores al constructor vacio.
        System.out.println("Ingrese un nombre:"); nom = Lector.leerString();
        System.out.println("Ingrese un dni: "); dni = Lector.leerInt();
        System.out.println("Ingrese una edad: "); edad = Lector.leerInt();
        Persona p2 = new Persona();
        p2.setNombre(nom);
        p2.setDNI(dni);
        p2.setEdad(edad);
        System.out.println("Mi nombre es " + p2.getNombre() + " de DNI " + p2.getDNI() + " y edad " + p2.getEdad());
    }
    
}
