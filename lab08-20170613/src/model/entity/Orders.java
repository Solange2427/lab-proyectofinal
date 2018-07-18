package model.entity;

import java.util.ArrayList;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
@PersistenceCapable(identityType = IdentityType.APPLICATION) 
public class Orders{
// cantidad de pedidos
@PrimaryKey 
@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id; 
@Persistent private String name;  
@Persistent private String ruc;  
@Persistent private String email;
@Persistent private ArrayList<Long> products = new ArrayList<Long>();
@Persistent private ArrayList<Integer> numbers=new ArrayList<Integer>();;
@Persistent private ArrayList<String> details=new ArrayList<String>();

public Orders(String name, String ruc, String email) {
	super();
	this.name = name;
	this.ruc = ruc;
	this.email = email;
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
public ArrayList<Long> getProducts() {
	return products;
}
public void setProducts(ArrayList<Long> products) {
	this.products = products;
}
public ArrayList<Integer> getNumbers() {
	return numbers;
}
public void setNumbers(ArrayList<Integer> numbers) {
	this.numbers = numbers;
}
public ArrayList<String> getDetails() {
	return details;
}
public void setDetails(ArrayList<String> details) {
	this.details = details;
}
public Long getIdOrder() {
	return id;
}

}