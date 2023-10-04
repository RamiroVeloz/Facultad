package tema4;
public class Estacion {
   private String nombre;
   private double latitud;
   private double longitud;
   
   public Estacion(){
   }
   
   public Estacion(String unNombre, double unaLatitud, double unaLongitud){
       this.nombre = unNombre;
       this.latitud = unaLatitud;
       this.longitud = unaLongitud;
   }

    public String getNombre() {
        return this.nombre;
    }

    public double getLatitud() {
        return this.latitud;
    }

    public double getLongitud() {
        return this.longitud;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }
    
    @Override
    public String toString(){
        return (this.getNombre() + " ( " + this.getLatitud() + " S , " + this.getLongitud()) + " O )";
    }
   
   
   
   
}
