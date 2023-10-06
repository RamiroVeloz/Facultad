package Repaso03;
public abstract class Recital {
    private String nombreBanda;
    private String [] listaTemas;
    private int cantTemas;
    private int diml = 0;
    
    public Recital(){
        
    }
    
    public Recital (String unNombreBanda, int unaCantTemas){
        this.nombreBanda = unNombreBanda;
        this.cantTemas = unaCantTemas;
        this.listaTemas = new String [unaCantTemas];
        for (int i = 0; i < unaCantTemas; i++){
            this.listaTemas[i] = null;
        }
    }

    public int getDiml() {
        return diml;
    }

    public String getTema(int pos) {
        return listaTemas[pos];
    }
    
    
    
    public boolean hayEspacio (){
        return this.diml < this.cantTemas;
    }
    
    public void agregarTema (String unTema){
        if (this.hayEspacio()){
            this.listaTemas[this.diml]= unTema;
            this.diml++;
        }
    }
    
    public abstract String actuar();
    public abstract double calcularCosto();
}
