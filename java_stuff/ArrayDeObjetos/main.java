package ArrayDeObjetos;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class main {
    public static void main(String[] args){
        BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
        byte choice = 0;
        
        String rut = "";
        String nom = "";
        byte edad = 0;

        PersonaClase[] personas = new PersonaClase[5];

        while (choice != 3){
            System.out.println("1. Comenzar");
            System.out.println("2. Mostrar");
            System.out.println("3. Salir");
            System.out.println("");

            try {
                choice = Byte.parseByte(input.readLine());
            } catch (IOException e) {
                // TODO: handle exception
            }
            
            System.out.println("");
            
            switch (choice){
                case 1:
                    for (int i = 0; i<personas.length; i++){
                        System.out.println("Ingrese los datos de la persona " + i+1);
                        try {
                            rut = input.readLine();
                            nom = input.readLine();
                            edad = Byte.parseByte(input.readLine());
                        } catch (Exception e) {
                            // TODO: handle exception
                        }
                        
                        personas[i] = new PersonaClase(rut, nom, edad);
                        System.out.println("");
                    }
                    break;
                case 2:
                    for (int i = 0; i<personas.length; i++){
                        System.out.println("Datos de la persona " + i+1);
                        System.out.println(personas[i].getRut());
                        System.out.println(personas[i].getName());
                        System.out.println(personas[i].getEdad());
                        System.out.println("");
                    }
                    break;
                case 3:
                    System.out.println("Chao.");
                    break;
                default:
                    System.out.println("Algo pasó.");
            }
        }

    }
}
