package Repaso04;
public abstract class Persona {
    private String nombre;
    private int dni;
    private int edad;
    
    public Persona (String unNombre, int unDni, int unaEdad){
        this.nombre = unNombre;
        this.dni = unDni;
        this.edad = unaEdad;
    }

    public String getNombre() {
        return this.nombre;
    }

    public int getDni() {
        return this.dni;
    }

    public int getEdad() {
        return this.edad;
    }
    
    public String toString(){
        String aux = "Nombre :" + this.getNombre() + " DNI: "+ this.getDni() + " Edad: "+ this.getEdad();
        return aux;
    }
    
    
}
