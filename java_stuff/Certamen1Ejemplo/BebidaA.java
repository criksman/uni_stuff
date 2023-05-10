package Certamen1Ejemplo;

public class BebidaA extends Bebida {
    private byte grados;
    private byte anio;


    public BebidaA(String sabor, String marca, String nombre, short cap, int precio, byte grados, byte anio){
        super(sabor, marca, nombre, cap, precio);
        this.grados = grados;
        this.anio = anio;
    }

    public float calcularP(){
        int precio = getPrecio();
        float precioFinal = 0;
        
        if (anio >= 2 && anio <= 4){
            precioFinal = (precio) - (precio*(float)(0.10)); 
        }else{
            if(anio >= 5 && anio <= 9){
                precioFinal = (precio) - (precio*(float)(0.20)); 
            }else{
                if(anio >= 10){
                    precioFinal = (precio) - (precio*(float)(0.30)); 
                }else{
                    precioFinal = precio;
                }
            }
        }

        return precioFinal;
    }

    public String informacionB(){
        return super.informacionB() + "\nGrados: " + grados + "\nPrecio: " + calcularP();
    }

}
