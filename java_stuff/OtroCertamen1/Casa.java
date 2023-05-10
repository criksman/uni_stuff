public class Casa extends Vivienda{
	private float cuotaAseo;
	
	public Casa(int nDormitorios, int nBanos, String direccion, float dividendo, float mtsViv, float cuotaAseo){
		super(nDormitorios,nBanos,direccion, dividendo, mtsViv);
		this.cuotaAseo = cuotaAseo;
	}
	
	//Métodos
	public float valorAseo(){
		return (getMtsViv() * (float)(100));
	}
	
	public String informacionViv(){
		return "N° Dormitorios: " + getNDormitorios() + "\nN° Baños: " + getNBanos() + "\nDirección: " + getDireccion() + "\nDividendo: " + getDividendo() + "\nMetros de la Vivienda: " + getMtsViv() + "\nCuota del aseo: " + cuotaAseo + "\nValor aseo: " + valorAseo() + "\nPago contribuciones: " + pagoContribuciones();
	}
	
	//Sets
	public void setCuotaAseo(float cuotaAseo){
		this.cuotaAseo = cuotaAseo;
	}
	
	//Gets
	public float getCuotaAseo(){
		return cuotaAseo;
	}
}