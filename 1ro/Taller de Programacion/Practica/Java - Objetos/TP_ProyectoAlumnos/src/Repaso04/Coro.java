package Repaso04;
public abstract class Coro {
    private String nombre;
    private Director dir;
    
    public Coro (){
        
    }
    
    public Coro (String nombreCoro, Director unDir){
        this.nombre = nombreCoro;
        this.dir = unDir;
    }
    
    private Director getDirector (){
        return this.dir;
    }
    
    public abstract void agregarCorista (Corista c);
    public abstract boolean bienFormado ();
    public String toString(){
        String aux = "Nombre del coro: " + this.nombre + " \n Datos del director: " + this.getDirector();
        return aux;
    }
    
}
