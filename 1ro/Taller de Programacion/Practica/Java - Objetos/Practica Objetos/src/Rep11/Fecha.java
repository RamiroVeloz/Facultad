package Rep11;
public class Fecha {
    private int cantGoleadores;
    private int diml = 0;
    private Goleador [] goleadores;
    
    public Fecha (int cant){
        this.cantGoleadores = cant;
        this.goleadores = new Goleador [this.cantGoleadores];
        for (int i = 0; i < this.cantGoleadores; i++){
            this.goleadores [i] = null;
        }
    }
    
    public boolean hayEspacio (){
        return (this.diml < this.cantGoleadores);
    }
    
    public boolean agregarGoleador (Goleador g){
        if (this.hayEspacio()) {
            this.goleadores[this.diml] = g;
            this.diml ++;
            return true;
        }else{
            return false;
        }
    }
    
    public Goleador obtenerGoleador (int x){
        return (this.goleadores[x]);
    }
    
    public int cantGoleadores (){
        return this.diml;
    }
    
    public Goleador menorGoles (){
        Goleador aux = null;
        int min = 9999;
            for (int i = 0; i < this.diml; i++){
                if (this.obtenerGoleador(i).getCantGoles() < min) {
                    min = this.obtenerGoleador(i).getCantGoles();
                    aux = this.obtenerGoleador(i);
                }
            }
        return aux;
    }
    
    public String toString (){
        String aux = "";
        for(int i = 0; i < this.diml; i++){
            aux = this.obtenerGoleador(i).toString() + "\n";
        }
        return aux;
    }
    
}
