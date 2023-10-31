package Rep11;
public class Torneo {
    private String nombreTorneo;
    private int cantFechas;
    private Fecha [] tablaFechas;
    private int [] goleadoresFecha;
    
    public Torneo (String unNom, int cantF, int m ){
        this.nombreTorneo = unNom;
        this.cantFechas = cantF;
        this.tablaFechas = new Fecha [this.cantFechas];
        
        for (int i = 0 ; i < this.cantFechas; i++){
            this.tablaFechas[i] = new Fecha (m);
        }
        
        this.goleadoresFecha = new int [this.cantFechas];
        for (int i = 0; i < this.cantFechas; i++){
            this.goleadoresFecha[i] = 0;
        }
    }

    public String getNombreTorneo() {
        return this.nombreTorneo;
    }
    
    
    public boolean agregarGoleadorEnFecha (int i, Goleador g){
        boolean aux = false;
        if (this.tablaFechas[i-1].hayEspacio()){
            if(this.tablaFechas[i-1].agregarGoleador(g)){
                this.goleadoresFecha[i-1]++;
                aux = true;
        }else {
            aux = false;
        }
        }
        return aux;
    }
    
    public int obtenerCantGoleadores(){
        int aux = 0;
        for (int i = 0; i < this.cantFechas; i++){
            aux += this.goleadoresFecha[i];
        }
        return aux;
    }
    
    public String toString(){
       String aux = "TORNEO 2022: " + this.getNombreTorneo() + "\n";
       int total;
       for (int i = 0; i < this.cantFechas; i++){
            total = 0;
            aux += "Cantidad de goleadores de la fecha: " + this.goleadoresFecha[i] + " / Goleadores: \n";
            for (int j = 0; j < this.goleadoresFecha[i]; j++){
                total += this.tablaFechas[i].obtenerGoleador(j).getCantGoles();
                aux  += this.tablaFechas[i].obtenerGoleador(j).toString() + "\n";
            }
            aux += "Total de goles de la fecha: " + total + " \n";
            aux += this.tablaFechas[i].menorGoles() + "\n";
            aux += "\n";
       }
       
       return aux;
    }
    
}
