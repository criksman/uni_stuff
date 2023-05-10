public class Vivienda{
	private int nDormitorios;
	private int nBanos;
	private String direccion;
	private float dividendo;
	private float mtsViv;
	
	public Vivienda(){	
	}
	
	public Vivienda(int nDormitorios, int nBanos, String direccion, float dividendo, float mtsViv){
		this.nDormitorios = nDormitorios;
		this.nBanos = nBanos;
		this.direccion = direccion;
		this.dividendo = dividendo;
		this.mtsViv = mtsViv;
	}
	
	//Métodos
	public float pagoContribuciones(){
		return (dividendo*(float)(0.10));
	}
	
	public String informacionViv(){
		return "N° Dormitorios: " + nDormitorios + "\nN° Baños: " + nBanos + "\nDirección: " + direccion + "\nDividendo: " + dividendo + "\nMetros de la Vivienda: " + mtsViv;
	}
	
	//Sets
	public void setNDormitorios(int nDormitorios){
		this.nDormitorios = nDormitorios;
	}
	
	public void setNBanos(int nBanos){
		this.nBanos = nBanos;
	}
	
	public void setDireccion(String direccion){
		this.direccion = direccion;
	}
	
	public void setDividendo(float dividendo){
		this.dividendo = dividendo;
	}
	
	public void setMtsViv(float mtsViv){
		this.mtsViv = mtsViv;
	}
	
	//Gets
	public int getNDormitorios(){
		return nDormitorios;
	}
	
	public int getNBanos(){
		return nBanos;
	}
	
	public String getDireccion(){
		return direccion;	
	}
	
	public float getDividendo(){
		return dividendo;
	}
	
	public float getMtsViv(){
		return mtsViv;
	}

}