package Repaso02;
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaAp;
    private int horaCr;
    private Auto [] [] estacionamientos;
    private int pisosBase = 5;
    private int plazasBase = 10;
    private int espaciosDisponibles;
    
    public Estacionamiento (){
        
    }
    
    public Estacionamiento (String unNombre, String unaDir){
        this.nombre = unNombre;
        this.direccion = unaDir;
        this.horaAp = 8;
        this.horaCr = 21;
        this.estacionamientos = new Auto [this.pisosBase][this.plazasBase];
        for (int i = 0 ; i < this.pisosBase; i++){
            for (int j = 0; j < this.plazasBase; j++){
                this.estacionamientos = null;
            }
        }
        this.espaciosDisponibles = this.plazasBase * this.pisosBase;
    }
    
    public Estacionamiento (String unNombre, String unaDir, int unaAp, int unaCr, int pisos, int plazas){
        this.nombre = unNombre;
        this.direccion = unaDir;
        this.horaAp = unaAp;
        this.horaCr = unaCr;
        this.pisosBase = pisos;
        this.plazasBase = plazas;
        this.estacionamientos = new Auto [pisos][plazas];
        for (int i = 0 ; i < pisos; i++){
            for (int j = 0; j < plazas; j++){
                this.estacionamientos[i][j] = null;
            }
        }
        this.espaciosDisponibles = pisos * plazas;
    }

    public String getNombre() {
        return this.nombre;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public int getHoraAp() {
        return this.horaAp;
    }

    public int getHoraCr() {
        return this.horaCr;
    }

    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setHoraAp(int horaAp) {
        this.horaAp = horaAp;
    }

    public void setHoraCr(int horaCr) {
        this.horaCr = horaCr;
    }
    
    public void registrarAuto(Auto a, int x, int y){
        if (this.espaciosDisponibles > 0){
            if (this.estacionamientos[x-1][y-1] == null){
                this.estacionamientos[x-1][y-1] = a;
                this.espaciosDisponibles--;
            }
        }
    }
    
    public String encontrarAutoPorPatente (String p){
        int x = 0;
        int y = 0;
        boolean esta = false;
        while ((x < this.pisosBase)&&(esta == false)){
            y = 0;
            while ((y < this.plazasBase)&&(esta == false)){
                if ((this.estacionamientos[x][y] != null)&&(this.estacionamientos[x][y].getPatente().equals(p))){
                        esta = true;
                    } 
                else{
                    y++;
                }
            }
            x++;
            
        }
        if (esta){
            return ("El auto se encuentra en el piso " + (x) + " plaza " + (y+1));
        }else{
            return ("Auto inexistente.");
        }
    }
    
    
    @Override
    public String toString(){
        String aux = "";
        for (int i = 0 ; i < this.pisosBase; i++){
            aux += "Piso " + (i+1) + " \n";
            for (int j = 0; j < this.plazasBase; j++){
                if (this.estacionamientos[i][j] == null){
                    aux += "Plaza "+ (j+1) +" libre. \n";
                }
                else{
                    aux += "Plaza " + (j+1) + " ocupada por: " + this.estacionamientos[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }
    
    public int contarPlazas (int y){
        int aux = 0;
        for (int i = 0 ; i < this.pisosBase; i++){
            if (this.estacionamientos[i][y] != null){
                aux ++;
            }
        }
        return aux;
    }
}
