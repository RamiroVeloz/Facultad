package Repaso04;
public class Corista extends Persona {
    private int tonoFund;
    
    public Corista (String unNombre,int unDni, int unaEdad, int unTono){
        super(unNombre, unDni, unaEdad);
        this.tonoFund = unTono;
    }
    
    
    
    public int getTono(){
        return this.tonoFund;
    }
    
    
    public String toString (){
        String aux = super.toString() + " Tono: " + this.getTono();
        return aux;
    }
    
}
