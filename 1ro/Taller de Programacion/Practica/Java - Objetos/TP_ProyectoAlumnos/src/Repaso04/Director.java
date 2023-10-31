package Repaso04;
public class Director extends Persona {
    private int ant;
    
    public Director (String unNombre, int unDni, int unaEdad, int unaAnt){
        super (unNombre,unDni,unaEdad);
        this.ant = unaAnt;
    }
    
    public int getAnt (){
        return this.ant;
    }
    
    public String toString (){
        String aux = super.toString() + " Antiguedad: " + this.getAnt();
        return aux;
    }
    
}
