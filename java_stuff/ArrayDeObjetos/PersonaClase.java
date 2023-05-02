package ArrayDeObjetos;

public class PersonaClase {
    String rut;
    String nom;
    byte edad;

    public PersonaClase(String rut,  String nombre, byte edad){
        this.rut = rut;
        this.nom = nombre;
        this.edad = edad;
    }

    // Mostrar datos
    public String getName(){
        return nom;
    }

    public String getRut(){
        return rut;
    }

    public byte getEdad(){
        return edad;
    }
}
