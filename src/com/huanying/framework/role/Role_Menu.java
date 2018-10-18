package com.huanying.framework.role;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import com.huanying.framework.menu.Menu;


@Entity
public class Role_Menu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4278112321409730265L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;	
	private int role_id;
	private int menu_id;

	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private int status;		//状态  0停用  1正常

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

	public int getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(int menu_id) {
		this.menu_id = menu_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
