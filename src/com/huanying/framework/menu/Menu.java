package com.huanying.framework.menu;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
public class Menu implements Serializable {
	/**1312311221233
	 * 
	 */
	private static final long serialVersionUID = -7004118474551438571L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	private String name;	//菜单名称
	private String code;	//菜单编码
	private int level;	//菜单级别
	private int menu_order;	//菜单顺序
	private String url;		//菜单地址
	@Transient
	private int previous_id;//
	
	@ManyToOne(cascade=CascadeType.REFRESH,optional=false,fetch=FetchType.EAGER)
	@NotFound(action=NotFoundAction.IGNORE)
	@JoinColumn(name="previous_id")
	private Menu previous_menu;
	
	@Transient
	private List<Menu> childMenu = new ArrayList<Menu>();
	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private int status;		//状态  0停用  1正常
	

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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getMenu_order() {
		return menu_order;
	}
	public void setMenu_order(int menu_order) {
		this.menu_order = menu_order;
	}
	public int getPrevious_id() {
		return previous_id;
	}
	public void setPrevious_id(int previous_id) {
		this.previous_id = previous_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Menu getPrevious_menu() {
		return previous_menu;
	}
	public void setPrevious_menu(Menu previous_menu) {
		this.previous_menu = previous_menu;
	}
	public List<Menu> getChildMenu() {
		return childMenu;
	}
	public void setChildMenu(List<Menu> childMenu) {
		this.childMenu = childMenu;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}