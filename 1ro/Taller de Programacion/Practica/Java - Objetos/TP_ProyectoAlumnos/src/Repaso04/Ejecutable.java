package Repaso04;
public class Ejecutable {
public static void main(String[] args) {
        Director dh = new Director ("Jorge",123123,4,10);
        Director ds = new Director ("Carlos", 43213, 10,15);
    
    
        CoroHilera ch = new CoroHilera("Sopranos", dh,1,1);
        CoroSemi cs = new CoroSemi("La RE manija", ds,4);
        
        
        
    }
    
}
