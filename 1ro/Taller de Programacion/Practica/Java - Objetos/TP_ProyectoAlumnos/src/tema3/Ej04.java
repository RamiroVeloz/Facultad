/*
4-A- Un hotel posee N habitaciones. De cada habitación conoce costo por noche, si está 
ocupada y, en caso de estarlo, guarda el cliente que la reservó (nombre, DNI y edad).
(i) Genere las clases necesarias. Para cada una provea métodos getters/setters adecuados.
(ii) Implemente los constructores necesarios para iniciar: los clientes a partir de nombre, 
DNI, edad; el hotel para N habitaciones, cada una desocupada y con costo aleatorio e/ 
2000 y 8000.

(iii) Implemente en las clases que corresponda todos los métodos necesarios para:
- Ingresar un cliente C en la habitación número X. Asuma que X es válido (es decir, está 
en el rango 1..N) y que la habitación está libre. 

- Aumentar el precio de todas las habitaciones en un monto recibido.
- Obtener la representación String del hotel, siguiendo el formato: 
{Habitación 1: costo, libre u ocupada, información del cliente si está ocupada} 
…
{Habitación N: costo, libre u ocupada, información del cliente si está ocupada}
B- Realice un programa que instancie un hotel, ingrese clientes en distintas habitaciones, 
muestre el hotel, aumente el precio de las habitaciones y vuelva a mostrar el hotel.
NOTAS: Reúse la clase Persona. Para cada método solicitado piense a qué clase debe 
delegar la responsabilidad de la operación
 */
package tema3;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej04 {

    public static void main(String[] args) {
        int n;
        GeneradorAleatorio.iniciar();
        System.out.println("Ingrese el numero de habitaciones del hotel: "); n = Lector.leerInt();
        Hotel hotel = new Hotel (n);
        hotel.habitacionesDisonibles();
        
        int hab;
        double monto;
        
        Cliente c = new Cliente();
        
        
        System.out.println("Ingrese el nombre: ");c.setNombre(Lector.leerString());
        
        while (!c.getNombre().equals("zzz")){
            System.out.println("Ingrese el DNI: ");c.setDni(Lector.leerInt());
            System.out.println("Ingrese la edad: ");c.setEdad(Lector.leerInt());
            System.out.println("Ingrese el numero de habitacion que desea reservar");hab = Lector.leerInt();
            if ((hab > 1) && (hab < n)){
                hotel.agregarCliente(c, hab);
            }
            hotel.habitacionesDisonibles();
            c = new Cliente();
            System.out.println("Ingrese el nombre: ");c.setNombre(Lector.leerString());
            }
        
        System.out.println("Ingrese un monto para aumentar las habitaciones: "); monto = Lector.leerDouble();
        hotel.aumentarMonto(monto);
        hotel.habitacionesDisonibles();
    }
        
        
    }
   
