/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para: 

(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno 
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.

B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante, 
busque e informe el autor del libro “Mujercitas”.

C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que 
almacenen como máximo N libros? ¿Cómo instanciaría el estante?
Para almacenar N datos, le daria como parametro al constructor un tipo entero
que va a otorgarle la cantidad de espacios a disponer.
Con el paquete lectura leo la cantidad n, y en la clase Estante modifico su
constructor poniendole el parametro (int n), dentro del constructor iria la linea 
this.dimf = n; -> donde dimf es la dimension fisica que utilizara el vector.

 */
package tema3;



public class Ej03 {

    public static void main(String[] args) {
        
        Estante estante = new Estante();
        
        Libro l1 = new Libro("Locura", "Magica", new Autor(), "12121212");
        Libro l2 = new Libro("Efervecencia", "Cosmica", new Autor(), "232323");
        Libro l3 = new Libro("Mujercitas", "Locas", new Autor("Pedro","Picapiedra","cara de boa"), "343434343");
        Libro l4 = new Libro("Meados", "Ricos", new Autor(), "454545454");
        Libro l5 = new Libro("Mandingo", "Blanco", new Autor(), "5656565656");
        
        estante.setLibro(l1);
        estante.setLibro(l2);
        estante.setLibro(l3);
        estante.setLibro(l4);
        estante.setLibro(l5);
        
        System.out.println("");
        System.out.println("La cantidad de libros que hay en el estante es: "+ (estante.getOcupados()));
        
        estante.mostrarEstante();
        System.out.println("");
        Libro aux = estante.encontrarPorTitulo("Mujercitas");
        if (aux != null){
            System.out.println(aux.getPrimerAutor().toString());
        }
        else{
            System.out.println("No se encuentra tal libro");
        }
    }
    
}
