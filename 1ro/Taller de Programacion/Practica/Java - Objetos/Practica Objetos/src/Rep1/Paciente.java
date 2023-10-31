package Rep1;
public class Paciente {
    private String nombre;
    private boolean tieneOS;
    private double costoSesion;
    
    public Paciente(String unNombre, boolean unEstado, double unCS){
        this.nombre = unNombre;
        this.tieneOS = unEstado;
        this.costoSesion = unCS;
    }

    public String getNombre() {
        return nombre;
    }

    public boolean isTieneOS() {
        return tieneOS;
    }

    public double getCostoSesion() {
        return costoSesion;
    }

    @Override
    public String toString() {
        return "Paciente{" + "nombre=" + nombre + ", tieneOS=" + tieneOS + ", costoSesion=" + costoSesion + '}';
    }
    
   
    
}
