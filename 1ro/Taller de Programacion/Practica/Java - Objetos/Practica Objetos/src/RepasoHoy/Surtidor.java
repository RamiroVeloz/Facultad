package RepasoHoy;
public class Surtidor {
    private String queDispensa;
    private double precioL;
    private int cantVentas;
    private int diml = 0;
    private Venta [] infoVentas;
    
    public Surtidor (String unQD,double unPrecio, int capVentas){
        this.queDispensa = unQD;
        this.precioL = unPrecio;
        this.cantVentas = capVentas;
        this.infoVentas = new Venta [this.cantVentas];
        for (int i = 0; i < this.cantVentas; i++){
            this.infoVentas[i] = null;
        }
    }
    
    public boolean hayEspacioVenta (){
        return (this.diml < this.cantVentas);
    }

    public String getQueDispensa() {
        return queDispensa;
    }

    public double getPrecioL() {
        return precioL;
    }
    
    
    
    private Venta getVenta (int i){
        return (this.infoVentas[i]);
    }
    
    public boolean agregarVenta (int dni, double cl, String fp){
        if (this.hayEspacioVenta()){
            double total = cl * this.precioL;
            this.infoVentas[this.diml] = new Venta (dni, cl, total, fp);
            this.diml ++;
            return true;
        }else{
            return false;
        }
    }
    
    public double totalVentas (){
        double aux = 0;
        for (int i = 0; i < this.diml; i++){
            aux += this.getVenta(i).getMontoAbonado();
        }
        return aux;
    }
    
    public String toString (){
        String aux = "";
        for (int i = 0; i < this.diml; i++){
            aux += "Combustible Dispensado: " + this.getQueDispensa() + " Precio por litro: " + this.getPrecioL() +"\n";
            for (int j  = 0; j < this.diml; j++){
                aux+= this.getVenta(j).toString() ;
            }
        }
        return aux;
    }
    
}
