package RepasoHoy;
public class Estacion {
    private String direccion;
    private int cantSurtidores = 6;
    private int diml = 0;
    private Surtidor [] surtidores;
    
    public Estacion (String unaDir){
        this.direccion = unaDir;
        this.surtidores = new Surtidor [this.cantSurtidores];
        for (int i = 0; i< this.cantSurtidores; i++ ){
            this.surtidores [i] = null;
        }
    }

    public String getDireccion() {
        return this.direccion;
    }
    
    
    
    private boolean hayEspacio (){
        return (this.diml < this.cantSurtidores);
    }
    
    public boolean agregarSurtidor (Surtidor s){
        if (this.hayEspacio()){
            this.surtidores [this.diml] = s;
            this.diml ++;
            return true;
        }else{
            return false;
        }
    }
    
    private Surtidor getSurtidor (int i){
        return (this.surtidores[i]);
    }
    
    public boolean agregarVentaEnSurtidor (int ns, int dni, double cl, String fp){
        if (this.surtidores[ns-1].hayEspacioVenta()){
            this.surtidores[ns-1].agregarVenta(dni,cl,fp);
            return true;
        }else{
            return false;
        }
    }
    
    public Surtidor devolverMax (){
        Surtidor s = null;
        double max = -1;
        for (int i = 0; i < this.diml; i++){
            if (this.getSurtidor(i).totalVentas()> max){
                max = this.getSurtidor(i).totalVentas();
                s = this.getSurtidor(i);
            }
        }
        
        return s;
    }
    
    
    public String toString (){
        String aux = "Estacion de Servicio: " + this.getDireccion() + "\n";
            for (int i = 0; i< this.diml; i++){
                aux += "Surtidor "+ (i+1)+ this.getSurtidor(i).toString() + " \n";
            }
        return aux;
    }
    
}
