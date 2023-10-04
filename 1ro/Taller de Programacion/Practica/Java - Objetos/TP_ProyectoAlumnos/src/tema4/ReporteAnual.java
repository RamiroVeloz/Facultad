package tema4;

public class ReporteAnual extends Sistema {
    
    public ReporteAnual (){
    }
    
    public ReporteAnual (Estacion estacion, int unaBase, int unaCant){
        super(estacion,unaBase,unaCant);
    }
    
    
    
    public String retornarPromedios(){
        double total,prom = 0;
        String aux = "";
        for (int i = 0; i < this.getCantAnios(); i++){
            total = 0;
            for (int j = 0; j< this.getCantMeses(); j++){
                 total += this.retornarTemperatura(j,i);
                }
            aux += "- Anio " + (this.getAnioBase() + i ) + " : " + (Math.round(total/this.getCantMeses())*100)/100.0 + "\n";
            }
       return (aux); 
    }
}
