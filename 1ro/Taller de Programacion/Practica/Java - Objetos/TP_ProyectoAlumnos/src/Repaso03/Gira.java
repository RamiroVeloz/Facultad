package Repaso03;
public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] fechas;
    public int cantFechas;
    private int numeroFechas = 0;
    private int fechaActual = 0;
    
    public Gira(){
        
    }
    
    public Gira(String unNombreBanda, int unaCant, String unNombreGira, int unaCantFechas){
        super(unNombreBanda,unaCant);
        this.nombreGira = unNombreGira;
        this.cantFechas = unaCantFechas;
        this.fechas = new Fecha [unaCantFechas];
        for (int i=0; i< cantFechas; i++){
            this.fechas[i] = null;
        }
    }
    
    public boolean hayEspacio(){
        return this.numeroFechas < this.cantFechas;
    }
    
    public void agregarFecha (Fecha f){
        if (hayEspacio()){
            this.fechas[this.numeroFechas] = f;
            this.numeroFechas++;
        }
    }
    
    public String actuar(){
        String aux = "Buenas noches " + this.fechas[this.fechaActual].getCiudad() + ". Ahora tocaremos: \n";
            for (int i = 0; i< this.getDiml(); i++){
                aux += this.getTema(i) +"\n";
            }
        if(this.fechaActual < cantFechas){    
            this.fechaActual++;
        }
        return aux;
    }
    
    public double calcularCosto(){
        return (30000 * this.numeroFechas);
    }
    
}
