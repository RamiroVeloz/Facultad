package tema3;
import PaqueteLectura.GeneradorAleatorio;


public class Hotel {
    private int dimf;
    private Habitacion [] hotel;
    
    public Hotel (int unaDimf){
        this.dimf = unaDimf;
        this.hotel = new Habitacion [this.dimf];
        for (int i = 0; i < this.dimf ; i++){
            this.hotel[i] = new Habitacion();
            this.hotel[i].setEstado(false);
            this.hotel[i].setCosto(GeneradorAleatorio.generarDouble(2000)+6000);
        }
    }

    public int getDimf() {
        return dimf;
    }

    public Habitacion[] getHotel() {
        return this.hotel;
    }
    
    public void habitacionesDisonibles(){
        for (int i = 0; i < this.dimf ; i++){
            if (this.hotel[i].getEstado()== false){
                System.out.println("Habitacion " + (i+1) + " desocupada. Precio: "+ this.hotel[i].getCosto());
            }
            else{
                System.out.println("Habitacion " + (i+1) + "  por : "+ this.hotel[i].getCliente());
            }
        }
    }
    
    public void agregarCliente(Cliente c, int hab){
        if (this.hotel[hab-1]. getEstado() == false){
            this.hotel[hab-1].setCliente(c);
            this.hotel[hab-1].setEstado(true);
        }
        else{
            System.out.println("La habitacion que desea reservar esta ocupada.");
        }
    }
    
    public void aumentarMonto (double monto){
        for (int i = 0; i < this.dimf ; i++){
            this.hotel[i].setCosto (this.hotel[i].getCosto() + monto);
        }
    }
    
}
