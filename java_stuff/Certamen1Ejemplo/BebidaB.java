package Certamen1Ejemplo;

public class BebidaB extends Bebida {
    private short calPorV;
    private String fechaV;
    private String tipo; 

    public BebidaB(){
    }

    public String informacionB(){
        return super.informacionB() + "\ncalPorV: " + calPorV + "\nFechaV: " + fechaV + "\nTipo: " + tipo + "\nPrecio: " + "Falta añadir";
    }

    public float calcularCalorias(){
        return 0;
    }
}
