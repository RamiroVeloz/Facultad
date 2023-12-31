/*
2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer 
autor es un objeto instancia de la clase Autor. 
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen 
y que deben permitir devolver/modificar el valor de sus atributos y devolver una 
representación String formada por nombre, biografía y origen. 
Luego realice las modificaciones necesarias en la clase Libro.
 */
package tema3;


public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(){
        
    }
    
    public Autor (String nombre, String biografia, String origen){
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }

    public String getNombre() {
        return this.nombre;
    }

    public String getBiografia() {
        return this.biografia;
    }

    public String getOrigen() {
        return this.origen;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }
    
    
    @Override
    public String toString (){
        return ("Nombre del autor: " + this.nombre + ". Biografia : " + this.biografia + " .Origen " + this.origen);
    }
    
}
