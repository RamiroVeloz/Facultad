package tema4;
public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura [] vector;
 
    public VisorFigurasModificado(){
        this.vector = new Figura[this.capacidadMaxima];
        this.guardadas = 0;
        for (int i = 0; i< this.capacidadMaxima; i++){
            this.vector[i] = null;
        }
    }
 
    public void guardar(Figura f){
        if (this.guardadas < this.capacidadMaxima){
            this.vector[guardadas] = f;
            this.guardadas++;
        }
        else{
            System.out.println("No hay mas espacio.");
        }
    }
    
    public boolean quedaEspacio(){
        return (this.guardadas <= this.capacidadMaxima-1);
    }
 
    public void mostrar(){
        for (int i = 0; i < this.guardadas; i++){
            System.out.println(this.vector[i].toString());
        }
    }
    
    public int getGuardadas() {
        return this.guardadas;
    }

}
