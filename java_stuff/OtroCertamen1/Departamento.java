public class Departamento extends Vivienda{
	private float mtsBod;
	private float mtsEst;
	
	public Departamento(){
	}
	
	//Métodos
	
	@Override
	public float pagoContribuciones(){
		return super.pagoContribuciones() + ((getMtsViv() + mtsBod + mtsEst)*(float)(400));
	}
	
	public String informacionViv(){
		return super.informacionViv() + "\nMetros de la bodega: " + mtsBod + "\nMetros de el estacionamiento: " + mtsEst + "\nGastos Comunes: " + gastosComunes() + "\nPago contribuciones: " + pagoContribuciones();
	}
	
	public float gastosComunes(){
		return ((getMtsViv() + mtsBod + mtsEst)*(float)(100));
	}
	
	//Sets
	public void setMtsBod(float mtsBod){
		this.mtsBod = mtsBod;
	}
	
	public void setMtsEst(float mtsEst){
		this.mtsEst = mtsEst;
	}
	
	//Gets
	public float getMtsBod(){
		return mtsBod;
	}
	
	public float getMtsEst(){
		return mtsEst;
	}
	
	
	
}