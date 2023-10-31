package Rep2;
public class Estanteria {
    private int cantEstantes;
    private int cantLibros;
    private Libro [][] estanteria;
    
    public Estanteria ( int cantE, int cantL){
        this.cantEstantes = cantE;
        this.cantLibros = cantL;
        this.estanteria = new Libro [this.cantEstantes][this.cantLibros];
        for (int i = 0; i < this.cantEstantes ; i++){
            for (int j = 0; j < this.cantLibros ; j++){
                this.estanteria[i][j] = null;
            }
        }
    } 
    
    private boolean lugarDisponible (int x,int y){
        return (this.estanteria[x][y] == null);
    }
    
    public void agregarLibro (int x, int y, Libro l){
        if (this.lugarDisponible(x-1,y-1)){
            this.estanteria[x-1][y-1] = l;
        }
    }
    
    private Libro obtenerLibro (int x, int y){
        return this.estanteria[x][y];
    }
        
    private void sacarLibro (int x, int y){
        this.estanteria [x][y] = null; 
    }
    
    public Libro buscarYsacar (String t){
        int x = 0, y = 0;
        boolean esta = false;
        Libro l = null;
            while ((x < this.cantEstantes)&&(esta == false)){
                while ((y < this.cantLibros) && (esta == false)){
                    if ((!this.lugarDisponible(x, y))&&(this.obtenerLibro(x, y).getTitulo().equals(t))){
                        l = new Libro (this.obtenerLibro(x, y).getTitulo(),this.obtenerLibro(x, y).getNombrePrimerAutor(),this.obtenerLibro(x, y).getPeso());
                        this.sacarLibro(x, y);
                        esta = true;
                    }else{
                        y++;
                    }
                }
                y = 0;
                x++;
            }       
        return l;
    }
    
    public Libro retornarMasPesado (){
        double max = -1;
        Libro maxl = null;
        for (int i = 0; i < this.cantEstantes ; i++){
            for (int j = 0; j < this.cantLibros ; j++){
                if (!this.lugarDisponible(i, j)){
                    if (this.obtenerLibro(i, j).getPeso() > max){
                        max = this.obtenerLibro(i, j).getPeso();
                        maxl = this.obtenerLibro(i,j);
                    }
                }
            }
        }
        return maxl;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.cantEstantes ; i++){
            aux += "Estante: " + (i+1) + " \n";
            for (int j = 0; j < this.cantLibros ; j++){
                if (!this.lugarDisponible(i, j)){
                    aux += this.obtenerLibro(i, j).toString() + "\n";
                }
            }
        }
        return aux;
    }
    
    
    
}
