package com.huanying.framework.parameter;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Parameter implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1433196216342546584L;
	
	public static final String BUILD_TYPE = "01";			//建筑类型    
	public static final String FITMENT_TYPE = "02";			//装修标准
	public static final String SALES_STATUS = "03";			//销售状态
	public static final String PROPERTY_TYPE = "04";		//物业类别
	public static final String BUSINESS_DISTRICT = "05";	//所属商圈
	public static final String VISIT_TYPE = "06";			//访客类型
	public static final String PAY_TYPE = "07";				//支付方式
	public static final String USE_TYPE = "08";				//购房用途
	public static final String KNOW_TYPE = "09";			//认知途径
	public static final String JOB_TYPE = "10";				//职业
	public static final String FAMILY = "11";				//家庭构成
	public static final String CLIENT_AREA = "12";			//客户区域
	public static final String FOUCS_TYPE = "13";			//客户关注点
	public static final String HOPE_SHAPE = "14";			//需求户型
	public static final String HOUSE_TYPE = "15";			//住宅类别
	
	private static List para_object;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String para_name;
	private String para_value;
	private String para_type_code;
	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPara_name() {
		return para_name;
	}
	public void setPara_name(String para_name) {
		this.para_name = para_name;
	}
	public String getPara_value() {
		return para_value;
	}
	public void setPara_value(String para_value) {
		this.para_value = para_value;
	}
	public String getPara_type_code() {
		return para_type_code;
	}
	public void setPara_type_code(String para_type_code) {
		this.para_type_code = para_type_code;
	}
	public static List getPara_object() {
		return para_object;
	}
	public static void setPara_object(List para_object) {
		Parameter.para_object = para_object;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
