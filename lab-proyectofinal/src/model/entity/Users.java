package model.entity;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Users {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
    @Persistent private String nombre;
    @Persistent private String apellido;
    @Persistent private String email;
    @Persistent private Long idRol;
    @Persistent private boolean estado;
    
    @Persistent private double MontoAdquirido=0;
    @Persistent private int cantidadPedidos=0;
    @Persistent private String fechaUltimoPedido;
    
    public String getFechaUltimoPedido() {
		return fechaUltimoPedido;
	}
	public void setFechaUltimoPedido(String fechaUltimoPedido) {
		this.fechaUltimoPedido = fechaUltimoPedido;
	}
	
	public Users(String nombre, String apellidos, String email,Long idRol,boolean estado) {
    	
        this.nombre = nombre;
        this.apellido = apellidos;
        this.email = email;
        this.estado = estado;
        this.idRol = idRol;
    
    }
    public void setIdRol(Long idRol){
    	this.idRol = idRol;
    }
    public Long getIdRol(){
    	return idRol;
    }
    public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public Long getCodigo() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellidos) {
        this.apellido = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public double getMontoAdquirido() {
		return MontoAdquirido;
	}
	public void setMontoAdquirido(double montoAdquirido) {
		MontoAdquirido = montoAdquirido;
	}
	public int getCantidadPedidos() {
		return cantidadPedidos;
	}
	public void setCantidadPedidos(int cantidadPedidos) {
		this.cantidadPedidos = cantidadPedidos;
	}
	public String getEstadoDescripcion(){
    	if(estado)
    		return "ACTIVO";
    	return "INACTIVO";
    }
    
}
