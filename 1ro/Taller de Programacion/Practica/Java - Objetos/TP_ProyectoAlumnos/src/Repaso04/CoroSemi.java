package Repaso04;
public class CoroSemi extends Coro {
    private int cantCoristas;
    private int diml = 0;
    private Corista [] coristas;
    
    public CoroSemi(String unNombre, Director unDir, int unaCant){
        super(unNombre,unDir);
        this.cantCoristas = unaCant;
        this.coristas = new Corista [this.cantCoristas];
        for (int i = 0; i < this.cantCoristas; i++){
            this.coristas[i] = null;
        }
    }
    
    private Corista getCorista(int x){
        return this.coristas[x];
    }
    
    private int getCantC() {
        return this.cantCoristas;
    }

    
    private boolean hayEspacio (){
        return (this.diml < this.cantCoristas);
    }
    
    public void agregarCorista (Corista c){
        if (this.hayEspacio()){
            this.coristas[this.diml] = c;
            this.diml++;
        }
    }
    
    public boolean bienFormado(){
        boolean estado = true;
        int aux = 1;
        while ((aux < (this.cantCoristas))&&(estado)){
            if (this.coristas[aux-1].getTono() < this.coristas[aux].getTono()){
                estado = false;
            }else{
                aux++;
            }
        }
        return estado;
    }
    
    public String toString (){
        String aux = super.toString() + " \n Datos de los coristas: ";
            
            for (int i = 0; i < this.getCantC(); i++){
                aux += this.getCorista(i).toString() + "\n" ;
            }
        
        return aux;
    }
    
    
}
