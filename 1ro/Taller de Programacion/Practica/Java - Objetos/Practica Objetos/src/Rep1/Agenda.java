package Rep1;
public class Agenda {
    private int dias = 5;
    private int turnos = 6;
    private int cuposDisp;
    private Paciente [][] agenda;
    
    public Agenda (){
        this.agenda = new Paciente [ this.dias ][ this.turnos ];
        for (int i = 0; i < this.dias; i++){
            for (int j = 0; j < this.turnos; j++){
                this.agenda[i][j] = null;
            }
        }
        this.cuposDisp = this.dias * this.turnos;
    }
    
    private boolean lugarDisponible (int x, int y){
        return (this.agenda[x][y] == null);
    }
    
    private Paciente devolverPaciente(int i,int j){
        return this.agenda[i][j];
    }
    
    public boolean hayLugar(){
        return this.cuposDisp > 0;
    }
    
    private void desocuparTurno (int i, int j){
        this.agenda[i][j] = null;
        this.cuposDisp++;
    }
    
    public boolean agendarPaciente (Paciente p, int d, int t){
        if (this.lugarDisponible(d-1,t-1)){
            this.agenda[d-1][t-1] = p;
            this.cuposDisp--;
            return true;
        }
        else{
            return false;
        }
    }
    
    public void liberarTurnosPaciente (String n){
        for (int i = 0; i < this.dias; i++){
            for (int j = 0; j < this.turnos; j++){
                if (!this.lugarDisponible(i,j)){
                    if (this.devolverPaciente(i, j).getNombre().equals(n)){
                        this.desocuparTurno(i,j);
                    }
                }
            }
        }
    }
    
    public boolean consultarTurno (int d, String n){
        int aux = 0;
        boolean tieneTurno = false;
        while ((aux < this.turnos) && (!tieneTurno)){
            if ((this.lugarDisponible(d-1, aux) == false)&&(this.agenda[d-1][aux].getNombre().equals(n))){
                    tieneTurno = true;
            }else{
                aux++;
            }
        }
        return tieneTurno;
    }

    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.dias; i++){
            aux += "Dia " +  (i+1) + " : \n";
            for (int j = 0; j < this.turnos; j++){
                if (this.agenda[i][j] != null){
                aux += this.agenda[i][j].toString() + " \n";
               }
            }
            aux += " \n";
        }
        
        return aux;
    }
    
    
    
}
