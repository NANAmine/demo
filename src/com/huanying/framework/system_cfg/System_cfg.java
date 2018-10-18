package com.huanying.framework.system_cfg;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;


@Entity
@Table(name = "system_cfg")
public class System_cfg implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2922158208075821464L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	private String en_name;
	private String cfg_value;
	private String cn_name;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEn_name() {
		return en_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public String getCfg_value() {
		return cfg_value;
	}
	public void setCfg_value(String cfg_value) {
		this.cfg_value = cfg_value;
	}
	public String getCn_name() {
		return cn_name;
	}
	public void setCn_name(String cn_name) {
		this.cn_name = cn_name;
	}	
}
