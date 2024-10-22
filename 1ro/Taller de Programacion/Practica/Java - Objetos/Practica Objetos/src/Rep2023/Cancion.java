package Rep2023;
public class Cancion {
    private int id;
    private String nombreCancion;
    private String compositor;
    private Estudiante ganador = null;
    private double puntaje = 0;
    
    public Cancion (int unId, String unNC, String unComp){
        this.id = unId;
        this.nombreCancion = unNC;
        this.compositor = unComp;
    }

    public int getId() {
        return this.id;
    }

    public String getNombreCancion() {
        return this.nombreCancion;
    }

    public String getCompositor() {
        return this.compositor;
    }

    public double getPuntaje() {
        return puntaje;
    }
    
    
    
    public void actualizarGanador (Estudiante e, double punt){
        if (punt > this.puntaje){
            this.ganador = e;
            this.puntaje = punt;
        }
    }
    
    public Estudiante devolverGanador (){
        return this.ganador;
    }

    @Override
    public String toString() {
        return "Cancion{" + "id=" + this.getId() + ", nombreCancion=" + this.getNombreCancion() + ", compositor=" + this.getCompositor() + '}';
    }
    
   
    
}
