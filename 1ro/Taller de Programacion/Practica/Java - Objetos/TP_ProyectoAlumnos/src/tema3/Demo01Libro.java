/*
 Programa que instancia un objeto libro e inicializa sus v.i.s enviando mensajes set#
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01Libro {

    public static void main(String[] args) {
        Libro libro = new Libro();
        libro.setTitulo("Java: A Beginner's Guide");
        libro.setEditorial("Mcgraw-Hill");
        libro.setAñoEdicion(2014);
        libro.setPrimerAutor(new Autor("Herbert Schildt", "No se quien es", "Tiene nombre nazi"));
        libro.setISBN("978-0071809252");
        libro.setPrecio(21.72);
        System.out.println(libro.toString());
       // System.out.println(libro); /* invoca automaticamente al metodo toString */

    }
    
}
