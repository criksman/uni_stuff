package Certamen1Ejemplo;

public class MainPrograma{
    public static void main(String args[]){
        String nombre = "Nombre";
        String marca = "Marca";
        String sabor = "Sabor";
        short cap = 0;
        int precio = 0;
        byte grados = 0;
        byte anios = 0;

        BebidaA bebida = new BebidaA(sabor, marca, nombre, cap, precio, grados, anios);

        System.out.println(bebida.informacionB());
    }
}