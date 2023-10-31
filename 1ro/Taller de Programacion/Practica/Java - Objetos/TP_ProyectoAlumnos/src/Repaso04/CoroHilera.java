package Repaso04;
public class CoroHilera extends Coro {
    private int dimx = 0;
    private int dimy = 0;
    private int cantF;
    private int cantC;
    private int espacioTotal;
    private Corista [][] coristas;
    
    public CoroHilera(String unNombre, Director unDir, int unaCantF, int unaCantC){
        super(unNombre,unDir);
        this.cantF = unaCantF;
        this.cantC = unaCantC;
        this.espacioTotal = this.cantF * this.cantC;
        this.coristas = new Corista [this.cantF][this.cantC];
        for (int i = 0; i < this.cantF; i++){
            for (int j = 0; j < this.cantC; j++){
            this.coristas[i][j] = null;
            }
        }
    }
    
     private Corista getCorista(int x, int y){
        return this.coristas[x][y];
    }
    
    public boolean hayEspacio (){
        return ((this.dimx * this.dimy) < this.espacioTotal);
    }
    
    public void agregarCorista (Corista c){
        if (this.hayEspacio()){
            if (this.dimx < this.cantF){
                if (this.dimy < this.cantC){
                    this.coristas[dimx][dimy] = c;
                }
                else{
                    this.dimx ++;
                    this.dimy = 0;
                }
            }
        }
    }
    
    
    public boolean bienFormado(){
        boolean estado = true;
        int x = 0,y = 1;
        while((x < this.cantF) && (estado)){
            while ((y < (this.cantC)) && (estado)){
                if ((this.coristas[x][y-1].getTono() < this.coristas[x][y].getTono())
                    &&(this.coristas[x][y-1].getTono() != this.coristas[x][y].getTono())){
                    estado = false;
                }
                else{
                    y++;
                }
            }
            y = 1;
            x++;
        }
        return estado;
    }
    
    public String toString (){
        String aux = super.toString() + " \n Datos de los coristas: ";
            
            for (int i = 0; i < this.cantF; i++){
                for (int j = 0; j < this.cantC; j++){
                    aux += this.getCorista(i,j).toString() + "\n" ;
            }
            }
        return aux;
    }
    
}
