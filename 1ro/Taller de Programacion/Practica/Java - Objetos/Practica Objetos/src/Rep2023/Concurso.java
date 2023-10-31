package Rep2023;
public class Concurso {
    private int cantCategorias;
    private int cantCanciones;
    private Cancion [][] cyc;
    
    public Concurso (int cantCat, int cantCan){
        this.cantCategorias = cantCat;
        this.cantCanciones = cantCan;
        this.cyc = new Cancion[this.cantCategorias][this.cantCanciones];
        for (int i = 0; i < this.cantCategorias; i++){
            for (int j = 0; j < this.cantCanciones; j++){
                this.cyc[i][j]= null;
            }
        }
        
    }
    
    private Cancion obtenerCancion(int x, int y){
        return (this.cyc[x][y]);
    }
    
    private boolean lugarDisponible(int x, int y){
        return (this.cyc[x][y] == null);
    }
    
    public void agregarCancion (int cat,int pos, Cancion c){
        this.cyc[cat][pos] = c;
    }
    
    
    public void interpretarCancion (int id, Estudiante e, double puntaje){
        int x = 0,y = 0;
        boolean esta = false;
        while (x < this.cantCategorias && !esta){
            while (y < this.cantCanciones && !esta){
                if (!this.lugarDisponible(x, y) && this.obtenerCancion(x, y).getId() == id){
                        this.obtenerCancion(x, y).actualizarGanador(e, puntaje);
                        esta = true;  
                }else{
                    y++;
                }
        }
            y = 0;
            x ++;
        }
            
    }
        
  
    public Estudiante conocerGanador (int id){
        int x = 0,y = 0;
        boolean esta = false;
        Estudiante e = null;
        while (x < this.cantCategorias && !esta){
            while (y < this.cantCanciones && !esta){
                if (!this.lugarDisponible(x, y) && this.obtenerCancion(x, y).getId() == id){
                    e = this.obtenerCancion(x,y).devolverGanador();
                    esta = true;
                }else{
                    y++;
                }
            }
            y = 0;
            x ++;
        }
        return (e);
    }
    
    public Cancion cancionMaxEnCat (int cat){
        double max = 0;
        Cancion c = null;
        for (int i = 0; i< this.cantCanciones; i++){
            if (!this.lugarDisponible(cat, i) && (this.obtenerCancion(cat,i).getPuntaje()> max)){
                max = this.obtenerCancion(cat,i).getPuntaje();
                c = this.obtenerCancion(cat,i);
            }
        }
        
        return c;
        
    }
    
    public String ganadoresCat (){
        String aux = "";
        for (int i = 0; i < this.cantCategorias; i++){
            aux += "Categoria " + (i+1) + " : \n";
            for (int j = 0; j < this.cantCanciones; j++){
                if (!this.lugarDisponible(i, j)){
                    aux = "Ganador de la cancion de id " + this.obtenerCancion(i,j).getId() + ": " + this.obtenerCancion(i,j).devolverGanador() + " \n";
                }
            }
        }
        return aux;
    }
    
}
