package model.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
@PersistenceCapable(identityType = IdentityType.APPLICATION) 
public class Order{
// cantidad de pedidos
@PrimaryKey 
@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long idOrder; 
@Persistent private String name;  
@Persistent private String ruc;  
@Persistent private String email;
@Persistent private Long product; 
@Persistent private int number; 
@Persistent private String details;
@Persistent private Date create;
@Persistent private boolean status;

public Order(String name, String ruc, String email, Long product, int number, String details) {
	this.name = name;
	this.ruc = ruc;
	this.email = email;
	this.product = product;
	this.number = number;
	this.details = details;
	create = new Date();
	status = false;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRuc() {
	return ruc;
}
public void setRuc(String ruc) {
	this.ruc = ruc;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
} 

public Long getProduct() {
	return product;
}
public void setProduct(Long product) {
	this.product = product;
}
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}
public String getDetails() {
	return details;
}
public void setDetails(String details) {
	this.details = details;
}

public Date getCreate () {
	return create;
}
public String getCreateDescripcion(){
	SimpleDateFormat format=new SimpleDateFormat("dd MMMM 'del' YYYY  HH:mm:s ");
    format.setTimeZone(TimeZone.getTimeZone("America/Lima"));
    return format.format(create);
}
public Boolean getStatus () {
	return status;
}
public String getStatusDescripcion(){
	if(status)
		return "ACTIVO";
	return "INACTIVO";
}
public void setStatus(boolean status) {
	this.status = status;
}
public Long getIdOrder() {
	return idOrder;
}




}