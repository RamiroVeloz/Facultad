/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros. 
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para: 

(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno 
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
 */
package tema3;

public class Estante {

    private int dimf = 20;
    private int diml = 0;
    private Libro[] estante;

    public Estante() {
        this.estante = new Libro[dimf];
    }

    public int getEspacios() {
        return this.dimf;
    }

    public int getOcupados() {
        return this.diml;
    }

    public void setLibro(Libro l) {
        if (diml < dimf) {
            this.estante[diml] = l;
            diml++;
        }
    }
    
    public void mostrarEstante (){
        for(int i = 0; i< diml; i++){
            System.out.println(this.estante[i]);
        }
    }

    public boolean estanteLleno() {
        return (this.diml == this.dimf);
    }

    public Libro encontrarPorTitulo(String t) {
        int aux = 0;
        boolean esta = false;
        while ((esta == false)&&(aux < diml)){
            if (this.estante[aux].getTitulo().equals(t)){
                esta = true;
            }
            else{
                aux++;
            }
        }
        if (!esta){
            return null;
        }
        else{
            return this.estante[aux];
            
        }
}
}