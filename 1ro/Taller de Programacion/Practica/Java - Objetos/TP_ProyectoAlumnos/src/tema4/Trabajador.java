package tema4;
public class Trabajador extends Persona {
    private String rol;
    
    public Trabajador (){
    }
    
    public Trabajador (String unNombre, int unDNI, int unaEdad, String unRol){
        super(unNombre,unDNI,unaEdad);
        this.rol = unRol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    public String toString (){
        return (super.toString() + " Rol:" + this.rol);
    }
}
