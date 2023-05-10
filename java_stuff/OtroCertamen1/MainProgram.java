import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class MainPrograma{
	public static void main(String args[]){
		BufferedReader input = new BufferedReader(new InputStreamReader(System.in));
		
		int nDormitorios = 0;
		int nBanos = 0;
		String direccion = "";
		float dividendo = 0;
		float mtsViv = 0;
		float mtsBod = 0;
		float mtsEst = 0;
		float cuotaAseo= 0;
		
		Boolean valid = true;
		byte opcion = 0;
		Departamento departamento = null;
		Casa casa = null;
		
		while (valid){
			System.out.println("1. Crear Departamento");
			System.out.println("2. Crear Casa");
			System.out.println("3. Mostrar datos del departamento");
			System.out.println("4. Mostrar datos de la casa");
			System.out.println("5. Salir");
			
			try{
				opcion = Byte.parseByte(input.readLine());
			}catch(IOException e){
				//Manejar exception
			}
			
			switch (opcion){
				case 1:
					if (departamento == null){
						try{
							nDormitorios = Integer.parseInt(input.readLine());
							nBanos = Integer.parseInt(input.readLine());
							direccion = input.readLine();
							dividendo = Float.parseFloat(input.readLine());
							mtsViv = Float.parseFloat(input.readLine());
							mtsBod = Float.parseFloat(input.readLine());
							mtsEst = Float.parseFloat(input.readLine());
						}catch(IOException e){
							//Manejar excepción
						}
					
						departamento = new Departamento();
						departamento.setNDormitorios(nDormitorios);
						departamento.setNBanos(nBanos);
						departamento.setDireccion(direccion);
						departamento.setDividendo(dividendo);
						departamento.setMtsViv(mtsViv);
						departamento.setMtsBod(mtsBod);
						departamento.setMtsEst(mtsEst);
					}else{
						System.out.println("Ya hay un departamento creado");
					}
					
					break;
				case 2:
					if (casa == null){
						try{
							nDormitorios = Integer.parseInt(input.readLine());
							nBanos = Integer.parseInt(input.readLine());
							direccion = input.readLine();
							dividendo = Float.parseFloat(input.readLine());
							mtsViv = Float.parseFloat(input.readLine());
							cuotaAseo = Float.parseFloat(input.readLine());
						}catch(IOException e){
							//Manejar excepción
						}
					
						casa = new Casa(nDormitorios, nBanos, direccion, dividendo, mtsViv, cuotaAseo);
					}else{
						System.out.println("Ya hay una casa creada");
					}
					
					break;
				case 3:
					if (departamento != null){
						System.out.println(departamento.informacionViv());	
					}else{
						System.out.println("No se ha creado un departamento");
					}
					break;
				case 4:
					if (casa != null){
						System.out.println(casa.informacionViv());
					}else{
						System.out.println("No se ha creado una casa");
					}
					break;
				case 5:
					valid = false;
					System.out.println("Adiós.");
					break;
				default:
					System.out.println("Hubo un problema.");
					break;
			}
			
		}
	}		
}