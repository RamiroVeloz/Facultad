package Repaso01;
public class Subsidio {
    private double montoPedido;
    private String motivo;
    private boolean otorgado = false;
    
    public Subsidio(){
        
    }
    
    public Subsidio (double unMontoPedido, String unMotivo){
        this.montoPedido = unMontoPedido;
        this.motivo = unMotivo;
    }

    public double getMontoPedido() {
        return this.montoPedido;
    }

    public String getMotivo() {
        return this.motivo;
    }
    
    public boolean getOtorgado(){
        return this.otorgado;
    }
    

    public void setMontoPedido(double montoPedido) {
        this.montoPedido = montoPedido;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
}
