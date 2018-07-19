package model.entity;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class modelFactura {
	
	
	 @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	 @Persistent private final String nombreEmpresa="Rey de Reyes";
	 @Persistent private final String direccionEmpresa="San Camilo 308 tda.4-21 Galerias 'San Geronimo";
	 @Persistent private final String rucEmpresa="20498396187";
	 @Persistent private double total;
	 @Persistent private Date fecha;
	

	 @Persistent private ArrayList<String> nombreProducto = new ArrayList<String>();
	 @Persistent private ArrayList<String> precioProducto=new ArrayList<String>();;
	 @Persistent private ArrayList<String> cantidadProducto=new ArrayList<String>();
	 @Persistent private String nombreCliente;
	 @Persistent private String rucCliente;
	
	public modelFactura(String nombreC,String rucC){
		
		this.nombreCliente=nombreC;
		this.rucCliente=rucC;
		
	}
	 public void addNombreProducto(String nombreProducto) {
		 this.nombreProducto.add(nombreProducto);
	 }
	 public void addPrecioProducto(String precioPorducto){
		 this.precioProducto.add(precioPorducto);
	 }
	 public void addCantidadProducto(String cantidadProducto){
		 this.cantidadProducto.add(cantidadProducto);
	 }
	public ArrayList<String> getCantidadProductos() {
		return cantidadProducto;
	}
	public void setCantidadProductos(ArrayList<String> cantidadProductos) {
		this.cantidadProducto = cantidadProductos;
	}
	public String getRucCliente() {
		return rucCliente;
	}
	public void setRucCliente(String rucCliente) {
		this.rucCliente = rucCliente;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}

	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public ArrayList<String> getCantidadProducto() {
		return cantidadProducto;
	}
	public void setCantidadProducto(ArrayList<String> cantidadProducto) {
		this.cantidadProducto = cantidadProducto;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public ArrayList<String> getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(ArrayList<String> nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public ArrayList<String> getPrecioProducto() {
		return precioProducto;
	}
	public void setPrecioProducto(ArrayList<String> precioProducto) {
		this.precioProducto = precioProducto;
	}
	public String getNombreCliente() {
		return nombreCliente;
	}
	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}
	public String getNombreEmpresa() {
		return nombreEmpresa;
	}
	public String getDireccionEmpresa() {
		return direccionEmpresa;
	}
	public String getRucEmpresa() {
		return rucEmpresa;
	}
	public String DateDescription(){

		SimpleDateFormat format=new SimpleDateFormat("dd MMMM 'del' YYYY  HH:mm:s ");
		format.setTimeZone(TimeZone.getTimeZone("America/Lima"));
		return format.format(fecha);
	}
}
