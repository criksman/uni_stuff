package Certamen1Ejemplo;

public class Bebida {
    private String sabor;
    private String marca;
    private String nombre;
    private short cap;
    private int precio;

    public Bebida(){
    }

    public Bebida(String sabor, String marca, String nombre, short cap, int precio){
        this.sabor = sabor;
        this.marca = marca;
        this.nombre = nombre;
        this.cap = cap;
        this.precio = precio;
    }

    public String informacionB(){
        return "Sabor: " + sabor + "\nMarca: " + marca + "\nNombre: " + nombre + "\nCap: " + cap;
    }

    //Gets
    public String getSabor(){
        return sabor;
    }

    public String getMarca(){
        return marca;
    }

    public String getNombre(){
        return nombre;
    }

    public short getCap(){
        return cap;
    }

    public int getPrecio(){
        return precio;
    }
}
