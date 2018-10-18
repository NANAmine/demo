package com.huanying.risk.keyword;

import java.io.Serializable;

import com.sun.javafx.scene.paint.GradientUtils.Point;

public class KeyWord implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String name;
	private int point_id;
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
	public int getPoint_id() {
		return point_id;
	}
	public void setPoint_id(int point_id) {
		this.point_id = point_id;
	}
	@Override
	public String toString() {
		return "KeyWord [id=" + id + ", name=" + name + ", point_id=" + point_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + point_id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		KeyWord other = (KeyWord) obj;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (point_id != other.point_id)
			return false;
		return true;
	}
	
	

}
