package com.huanying.risk.content;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.huanying.risk.point.Risk_Point;

@Entity
public class Content implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5894103678062160211L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String description;
	private String image_description;
	private String video_description;
	private int score;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "point_id")
	private Risk_Point point;
	private int province_id;
	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage_description() {
		return image_description;
	}
	public void setImage_description(String image_description) {
		this.image_description = image_description;
	}
	public String getVideo_description() {
		return video_description;
	}
	public void setVideo_description(String video_description) {
		this.video_description = video_description;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	public Risk_Point getPoint() {
		return point;
	}
	public void setPoint(Risk_Point point) {
		this.point = point;
	}
	public int getProvince_id() {
		return province_id;
	}
	public void setProvince_id(int province_id) {
		this.province_id = province_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
