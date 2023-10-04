package tema4;
public class Persona {
    private String nombre;
    private int dni;
    private int edad;
    
    public Persona(){
    }
    
    public Persona (String unNombre, int unDNI, int unaEdad){
        this.nombre = unNombre;
        this.dni = unDNI;
        this.edad = unaEdad;
        
    }

    public String getNombre() {
        return nombre;
    }

    public int getDni() {
        return dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    

    
    public String toString (){
        return ("Nombre: "+ this.nombre + " DNI:" + this.dni + " Edad:"+ this.edad);
    }
    
}
