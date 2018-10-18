package com.huanying.framework.user;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class User_Project implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2819662423597766060L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	private String user_id;
	private String project_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	private int status;

}
