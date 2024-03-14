package Repaso03;
public class EventoOcacional extends Recital {
    private String motivo;
    private String nombreContratante;
    private Fecha fechaEvento;
    
    public EventoOcacional(){
        
    }
    
    public EventoOcacional (String unNombreBanda, int unaCant, String unMotivo, String unNombreContratante, Fecha unaFecha){
        super(unNombreBanda, unaCant);
        this.motivo = unMotivo;
        this.nombreContratante = unNombreContratante;
        this.fechaEvento = unaFecha;
    }
    
    @Override
    public String actuar(){
        String aux="";
        if (this.motivo.equals("beneficiencia")){
            aux = "Recuerden colaborar con " + this.nombreContratante + " \n";
        }else if (this.motivo.equals("showTV")){
            aux = "Saludos amigos televidentes :D \n";
        }else if (this.motivo.equals("privado")){
            aux = "Un feliz cumpleanios para "+ this.nombreContratante + " \n";
        }
        
        aux += "Y ahora tocaremos:  \n";
            for (int i = 0; i < this.getDiml(); i++){
                aux += this.getTema(i) + "\n";
            }
        return aux;
    }
    
    public double calcularCosto (){
        double total = 0;
        if (this.motivo.equals("beneficiencia")){
            total = 0;
        }else if (this.motivo.equals("showTV")){
            total = 50000;
        }else if (this.motivo.equals("privado")){
            total = 150000;
        }
        return total;
    }
    
    
}
