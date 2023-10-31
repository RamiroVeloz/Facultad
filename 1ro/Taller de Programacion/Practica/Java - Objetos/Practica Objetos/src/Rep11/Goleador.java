package Rep11;
public class Goleador {
    private String nombreGoleador;
    private String nombreEquipo;
    private int cantGoles;
    
    public Goleador (String unNom, String unEq, int cant){
        this.nombreGoleador = unNom;
        this.nombreEquipo = unEq;
        this.cantGoles = cant;
    }

    public String getNombreGoleador() {
        return this.nombreGoleador;
    }

    public String getNombreEquipo() {
        return this.nombreEquipo;
    }

    public int getCantGoles() {
        return this.cantGoles;
    }

    @Override
    public String toString() {
        return "Goleador{" + "nombreGoleador=" + this.getNombreGoleador() + ", nombreEquipo=" + this.getNombreEquipo() + ", cantGoles=" + this.getCantGoles() + '}';
    }
    
    
    
    
}
