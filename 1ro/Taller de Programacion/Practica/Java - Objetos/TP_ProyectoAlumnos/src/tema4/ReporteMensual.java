package tema4;

public class ReporteMensual extends Sistema {
    
    
    public ReporteMensual(){}
    
    public ReporteMensual(Estacion estacion, int unaBase, int unaCant){
        super(estacion,unaBase,unaCant);
        
    }
    
    
    
    public String retornarPromedios(){
        double total,prom = 0;
        String aux = "";
        for (int i = 0; i < this.getCantMeses(); i++){
            total = 0;
            for (int j = 0; j< this.getCantAnios(); j++){
                 total += this.retornarTemperatura(i,j);
                }
            aux += "- " + this.getMes(i) + " : " + (Math.round(total/this.getCantAnios())*100)/100.0  + "\n";
            }
       return (aux); 
    }
    
}
