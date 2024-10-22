/*
5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un 
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin 
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el 
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto 
partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna 
un String vacío). 
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en 
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con 
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:

- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local.
 */
package tema2;

import PaqueteLectura.Lector;

public class Ej05 {

    public static void main(String[] args) {
        int dimf = 20,diml = 0;
        Partido [] partidos = new Partido[dimf];
        Partido aux = new Partido();
        
        int cr = 0,gb = 0;
        
        System.out.println("Ingrese el nombre del equipo local: "); aux.setLocal(Lector.leerString());
        System.out.println("Ingrese los goles del equipo local: "); aux.setGolesLocal(Lector.leerInt());
        System.out.println("Ingrese el nombre del equipo visitante: ");aux.setVisitante(Lector.leerString());
        System.out.println("Ingrese los goles del equipo visitante: ");aux.setGolesVisitante(Lector.leerInt());
        
        while ((!aux.getVisitante().equals("ZZZ"))&& (diml < dimf)){
            if(!aux.getVisitante().equals("ZZZ")){
                partidos[diml] = aux;
                diml++;
            }
            aux = new Partido();
            System.out.println("Ingrese el nombre del equipo local: "); aux.setLocal(Lector.leerString());
            System.out.println("Ingrese los goles del equipo local: "); aux.setGolesLocal(Lector.leerInt());
            System.out.println("Ingrese el nombre del equipo visitante: ");aux.setVisitante(Lector.leerString());
            System.out.println("Ingrese los goles del equipo visitante: ");aux.setGolesVisitante(Lector.leerInt());
        }
        
        for (int i = 0; i<diml; i++){
            System.out.println(partidos[i].getLocal() + " - " + partidos[i].getGolesLocal() + " VS " + partidos[i].getVisitante() + " : " + partidos[i].getGolesVisitante());
            if (partidos[i].getGanador().equals("river")){
                cr++;
            }
            if (partidos[i].getLocal().equals("boca")){
                gb += partidos[i].getGolesLocal();
            }
        }
        System.out.println("Partidos que gano river: " + cr);
        System.out.println("Goles que realizo boca de local: "+ gb);
        
    }
    
}
