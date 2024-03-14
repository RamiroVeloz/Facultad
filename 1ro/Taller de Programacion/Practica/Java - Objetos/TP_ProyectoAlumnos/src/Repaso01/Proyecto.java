package Repaso01;
public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreCompletoDirector;
    private int maxInv = 50;
    private Investigador [] investigadores;
    private int diml = 0;
    
    public Proyecto(){
        
    }
    
    public Proyecto (String unNombreProyecto, int unCodigo, String unNombreDir){
        this.nombreProyecto = unNombreProyecto;
        this.codigo = unCodigo;
        this.nombreCompletoDirector = unNombreDir;
        this.investigadores = new Investigador [maxInv];
        for (int i = 0; i < this.maxInv; i++){
            this.investigadores[i] = null;
        }
    }

    public String getNombreProyecto() {
        return this.nombreProyecto;
    }

    public int getCodigo() {
        return this.codigo;
    }

    public String getNombreCompletoDirector() {
        return this.nombreCompletoDirector;
    }
    
   public boolean hayEspacio(){
       return this.diml < this.maxInv;
   }
    
    public void agregarInvestigador(Investigador i){
        if (this.hayEspacio()){  
            this.investigadores[diml] = i;
            this.diml ++;
        }
    }
    
    public void setNombreProyecto(String nombreProyecto) {
        this.nombreProyecto = nombreProyecto;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNombreCompletoDirector(String nombreCompletoDirector) {
        this.nombreCompletoDirector = nombreCompletoDirector;
    }
    
    
    public void otorgarSubsidiosAInvestigador (String bus){
        int aux = 0; 
        while ((!this.investigadores[aux].getNombreCompleto().equals(bus))&&(aux < this.diml)){
            aux++;
        }
        if (this.investigadores[aux].getNombreCompleto().equals(bus)){
                this.investigadores[aux].otorgarTodosSubsidios();
        }
    }
    
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i = 0; i < this.diml; i++){
            total += this.investigadores[i].totalSubs();
        }
        return ((Math.round(total)*100)/100);
    }
    
    @Override
    public String toString (){
        String aux = "Nombre del proyecto: " + this.nombreProyecto + " Nombre del director: " + this.nombreCompletoDirector + " Total de dinero otorgado al proyecto: "+ this.dineroTotalOtorgado();
        aux += " Informacion de los alumnos: \n";
        for (int i = 0; i < this.diml; i++){
            aux += this.investigadores[i].toString() + "\n";
        }
        return aux;
    }
    
    
}
