package RepasoHoy;
public class Venta {
    private int dniCliente;
    private double cantLitrosCargados;
    private double montoAbonado;
    private String medioPago;
    
    public Venta (int dni, double clc, double ma, String mp){
        this.dniCliente = dni;
        this.cantLitrosCargados = clc;
        this.montoAbonado = ma;
        this.medioPago = mp;
    }

    public int getDniCliente() {
        return this.dniCliente;
    }

    public double getCantLitrosCargados() {
        return this.cantLitrosCargados;
    }

    public double getMontoAbonado() {
        return this.montoAbonado;
    }

    public String getMedioPago() {
        return this.medioPago;
    }

    @Override
    public String toString() {
        return "Dni : " + this.getDniCliente() + " Litros Cargados: " + this.getCantLitrosCargados() + " Monto abonado: " + this.getMontoAbonado() + " Medip de pago: " + this.getMedioPago() + "\n";
    }
    
    
}
