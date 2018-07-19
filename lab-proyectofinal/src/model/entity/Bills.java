package model.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)

public class Bills {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private final String nombreEmpresa="Rey de Reyes";
	@Persistent private final String direccionEmpresa="San Camilo 308 tda.4-21 Galerias 'San Geronimo";
	@Persistent private final String rucEmpresa="20498396187";
	@Persistent private double total;
	@Persistent private Date date;
	@Persistent private String nameProduct;
	@Persistent private double priceProduct;
	@Persistent private int quantityProduct;
	@Persistent private String nameClient;
	@Persistent private String rucClient;
	@Persistent private String idPedido;
	public Bills(String nameProduct, double priceProduct, int quantityProduct,String nameClient,String rucClient,double total,String idPedido){
		this.nameProduct=nameProduct;
		this.priceProduct=priceProduct;
		this.quantityProduct=quantityProduct;
		this.nameClient=nameClient;
		this.rucClient=rucClient;
		
		this.total=total;
		this.idPedido=idPedido;

		TimeZone tz = TimeZone.getTimeZone ("Asia / Tokio");
		Calendar calendar=new GregorianCalendar(tz);	
		this.date=(Date) calendar.getTime();

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

	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public double getPriceProduct() {
		return priceProduct;
	}
	public void setPriceProduct(double priceProduct) {
		this.priceProduct = priceProduct;
	}
	public int getQuantityProduct() {
		return quantityProduct;
	}
	public void setQuantityProduct(int quantityProduct) {
		this.quantityProduct = quantityProduct;
	}
	public String getNameClient() {
		return nameClient;
	}
	public void setNameClient(String nameClient) {
		this.nameClient = nameClient;
	}
	public String getRucClient() {
		return rucClient;
	}
	public void setRucClient(String rucClient) {
		this.rucClient = rucClient;
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

	
	
	public String getIdPedido() {
		return idPedido;
	}
	public void setIdPedido(String idPedido) {
		this.idPedido = idPedido;
	}
	public String getDate() {
		DateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  

		String da=dateformat.format(date).toString();
		return da;
	}
	public void setDate() {
		TimeZone tz = TimeZone.getTimeZone ("America / Lima");
		Calendar calendar=new GregorianCalendar(tz);	
		this.date=(Date) calendar.getTime();
	}  

}