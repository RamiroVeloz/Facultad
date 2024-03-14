package tema4;
import PaqueteLectura.GeneradorAleatorio;
public abstract class Sistema {
    private Estacion estacion;
    private int anioBase;
    private int cantAnios;
    private int cantMeses = 12;
    private double [][] temperaturas;
    private String [] Meses = {"Enero","Febrero","Marzo","Abril","Mayo","Junio", "Julio", "Agosto" , "Septiembre","Octubre", "Noviembre", "Diciembre"};
    
    public Sistema(){
    }
    
    public Sistema(Estacion unaEstacion, int unAnioBase, int unaCant){
        this.estacion = unaEstacion;
        this.anioBase = unAnioBase;
        this.cantAnios = unaCant;
        this.temperaturas = new double [this.cantAnios][this.cantMeses];
        GeneradorAleatorio.iniciar();
        for (int i = 0; i < this.cantAnios; i++){
            for (int j = 0; j< this.cantMeses; j++){
                this.temperaturas[i][j]= GeneradorAleatorio.generarDouble(40);
            }
        }
    }

    public Estacion getEstacion() {
        return this.estacion;
    }

    public int getAnioBase() {
        return this.anioBase;
    }

    public int getCantAnios() {
        return this.cantAnios;
    }

    public int getCantMeses() {
        return cantMeses;
    }
    
    
    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }

    public void setAnioBase(int anioBase) {
        this.anioBase = anioBase;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }
    
    public void registrarTemperatura(int mes, int anio,double temp){
        this.temperaturas[anio][mes] = temp;
    }
    
    public double retornarTemperatura(int mes, int anio){
        return this.temperaturas[anio][mes];
    }
    
    public String getMes (int pos){
        return this.Meses[pos];
    }
    
    public String temperaturaMaxima(){
        String aux;
        double maxT = -1; int maxM = 0, maxA = 0;
        for (int i = 0; i < this.cantAnios; i++){
            for (int j = 0; j< this.cantMeses; j++){
                if (this.retornarTemperatura(j,i) > maxT){
                    maxT = this.retornarTemperatura(j,i);
                    maxM = j;
                    maxA = i;
                }
            }
        }
        return ("La temperatura mas alta se registro el mes " + this.getMes(maxM) + " en el anio " + (this.getAnioBase()+maxA) + " con una lectura de " + maxT);
    }
    
    public void mostrarTemps(){
        for (int i = 0; i < this.cantAnios; i++){
            for (int j = 0; j< this.cantMeses; j++){
                System.out.println(this.temperaturas[i][j]);
            }
            System.out.println("\n");
        }
    }
    
    public abstract String retornarPromedios();
    
    @Override
    public String toString(){
        return (this.getEstacion().toString() + "\n" + this.retornarPromedios());
    }
    
}
