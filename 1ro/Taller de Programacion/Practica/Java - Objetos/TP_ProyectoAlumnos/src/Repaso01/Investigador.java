package Repaso01;

public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private int maxSub = 5;
    private Subsidio [] subsidios;
    private int diml = 0;
    
    public Investigador(){
        
    }
    
    public Investigador(String unNombreCompleto, int unaCategoria, String unaEspecialidad){
        this.nombreCompleto = unNombreCompleto;
        this.categoria = unaCategoria;
        this.especialidad = unaEspecialidad;
        this.subsidios = new Subsidio [maxSub];
        for (int i = 0; i < this.maxSub; i++){
            this.subsidios[i] = null;
        }
    }

    public String getNombreCompleto() {
        return this.nombreCompleto;
    }

    public int getCategoria() {
        return this.categoria;
    }

    public String getEspecialidad() {
        return this.especialidad;
    }

    public int getMaxSub() {
        return this.maxSub;
    }

    public int getDiml() {
        return this.diml;
    }
    
    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public boolean hayEspacio(){
        return this.diml < this.maxSub;
    }
    
    public void agregarSubsidio (Subsidio s){
        if (this.hayEspacio()){
            this.subsidios[diml] = s;
            this.diml ++;
        }
    }
    
    public Subsidio devolverSubsidio(int pos) {
        return this.subsidios[pos];
    }
    
    public void otorgarTodosSubsidios(){
        for (int i = 0; i < this.diml; i++){
            if (this.subsidios[i].getOtorgado() == false){
                this.subsidios[i].setOtorgado(true);
            }
        }
    }
    
    public double totalSubs (){
        double total = 0;
        for (int i = 0; i < this.diml; i++){
            if (this.subsidios[i].getOtorgado() == true){
                total += this.subsidios[i].getMontoPedido();
            }
        }
        return ((Math.round(total)*100)/100);
    }
    
    @Override
    public String toString (){
        return ("Nombre: " + this.nombreCompleto + " Categoria: "+ this.categoria + " Especialidad: " + this.especialidad + " Total de los subsidios otorgados: "+ this.totalSubs());
    }
    
    
    
}
