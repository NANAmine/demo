package com.huanying.risk.point;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.huanying.risk.source.Risk_Source;

@Entity
public class Risk_Point implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2375204555939893337L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "source_id")
	private Risk_Source source;
	private double weight;
	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Risk_Source getSource() {
		return source;
	}
	public void setSource(Risk_Source source) {
		this.source = source;
	}
	public double getWeight() {
		return weight;
	}
	public void setWeight(double weight) {
		this.weight = weight;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
