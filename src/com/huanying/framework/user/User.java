package com.huanying.framework.user;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import com.huanying.framework.company.Company;
import com.huanying.framework.role.Role;


@Entity
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2697936683291150264L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	private String login_name;
	private String password;
	private String phone;
	private Timestamp create_time;
	@Transient
	private List<Company> companies;
	@Transient
	private List<Role> roles;
	private int type;
	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private int status;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public List<Company> getCompanies() {
		return companies;
	}
	public void setCompanies(List<Company> companies) {
		this.companies = companies;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public int getStatus() {
		return status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
public static void main(String[] args) {
	String abc = "阳光佳和、金桥小区、阿尔卡迪亚、和平丽景、金元小区、城市旺点、新奥小区、紫金华府、蓝水湾、俪水家园、新源小区、格林郡府、圣泰花园、运通家园、锦绣家园、世纪花园、都市花园、康庄东区、康庄西区、宏泰花园、天域花园、钰海嘉苑、奥富斯、林苑小区、新星里小区、华苑小区、南苑小区、汇源名居、华夏经典、八大街、旭景花园、万嘉小区、永兴小区、兴盛新区、蓝波湾、馨语馨苑、江南水郡、君兰苑、新视界、华夏第九园、华夏奥韵、华夏幸福城、逸树家、馨境界、馨视界、六中、八小学区房、四中、一中、人民公园、新四中、锦绣花苑、东日瑞景、丰盛小区、万达附近、明珠附近、永华明珠、西小区、高铁附近、盛德花园钰海嘉苑、嘉多丽花园、长富吉第、奥富斯、永祥苑、安居花园、南苑小区广阳道锦绣花苑、逸树家、馨境界东西区、华夏名筑、八大街东西区、华夏经典、燕丰园、华夏水晶城、水云间、华夏奥韵、天域学府、冬日瑞景、圣玉百呈、旭景花园、百殿园、林苑小区、新星里、广阳公寓、秀景花园、盛园小区、华腾家园、新民小区、都市花园、检察院宿舍、新源小区、阿尔卡迪亚、锦绣家园、吉祥小区西小区学区：文苑小区、新儒苑、德仁新儒苑、馨视界、兰亭、金源丽舍、一中学区：汇源名居、翰林名晟、盛世豪庭、安泰家园、盛德花园、永华小区、通用新区、德源博通、德源小区、蓝波湾、万嘉小区、永兴苑、人民公园东西门：丰盛小区、曙光小区、旭景花园、华夏经典、七大街小区、群安实业、星盛园、聚星苑、锦盛园、华兴里小区、康庄东西区、富华小区、天域花园、宏泰花园、华苑小区、华夏奥韵、华夏幸福城、水云间、天域学府、逸树家、锦绣花苑、馨境界西区、八大街西区、阳光高第、冬日瑞景、万和北区、万和南区、圣玉百城、华夏名著、都市名园、万向城、馨境界东区、八大街东区、裕西里、康顺里、书香苑、文苑小区、新儒苑、高街国际、水岸香榭、御澜华府、臻丽家园、嘉惠意境、馨语星愿、德仁新苑、中科紫峰、四中宿舍、北昌北区、北昌南区、永兴小区、蓝波湾、德仁永兴苑、安泰家园、光明小区、光明楼、昶友新天地、永宏小区、兴盛小区、菜庄小区、常青小区、钨钼宿舍、兴华小区、平安小区、翰林名晟、德源博通、万嘉佳苑、盛世豪庭、盛德花园、永华小区、蓝波御景、南苑小区、新苑小区、银丰小区、龙河枫景、宏泰龙邸、红星国际、波尔多花园、万和嘉苑、钻石国际、亿合佳苑、锻压宿舍、创新里、豪邸坊、尚华城、3532、通用小区、通用新区、侍郎房、新月小区、德源小区、汇源名居、呈祥紫园、顺安小区、富强小区、银河小区、盛通银河、嘉通名苑、大官庄、农行宿舍、利民里、丰盛小区、物探所、曙光小区、红星里小区、星盛园、金玉园、新兴里、环卫楼、福兴里、建工里、锦盛园、春华里、裕华小区、振财小区、群安实业、华夏经典、聚星苑、银河逸景、新益小区、中太宿舍、旭景花园、向阳里、百殿园、建华里、华夏水晶城、燕丰园、广阳公寓、政法小区、锦绣观邸、盛世嘉华、御泉湾、碾子营特校宿舍、孔雀城、城市风景、凯旋大道、新领地、尚北金街、新星里、三五三一、三五三四、林苑小区、银河领域、政协宿舍、新华北区、华苑小区、秀景花园、统建楼文明里、文新里、迎春小区、如意里、永泰楼、金城里、金玉里、金华里、移动小区、空中花园、大拇指广场、龙河福源、富士康城、阳光逸墅、龙河盛都、前锋小区、德仁永祥苑、四季花语、奥富斯、长富吉第、嘉多丽花园、钰海嘉苑、晓廊坊、锦绣家园、锦绣名园、今日家园、华祥小区、乔治花园、郡望、金安里、金源小区、圣泰花园、城市旺点、蓝水湾、紫金华府、和平丽景、壹号公寓、盛德金地、金桥小区、阳光佳和、金泰小区纽约公园、凯创公寓、中央风景、金源丽舍新华南区、东方新天地、富苑小区、永跃里、万众里、长安小区、馨钻界、恒基家园、粮食局宿舍、金光小区、新华小区、汇源锦城、恒基嘉园、维多利亚、春和南区、春和北区、富华小区、金海公寓、康庄西区、康庄东区、梅园里、华夏花园、检察院宿舍、盛园小区、德善里、华腾家园、新民小区、怡景花园、金地西区、金地东区、润绿公寓、阿尔卡迪亚、荣盛华府、宝石花苑、新民B区、新源小区、新民A区、翔宇家园、尚都新苑、国际A区、鼎兴公寓、都市花园、吉祥小区、宏泰花园、天域花园、周各庄新区、汇督office、管道局一区、管道局二区、管道局三区、管道局四区、管道局五区、管道局六区、管道局七区、管道局八区、康乐小区、清河小区、五区大院、天泰仁和、恒大名都、金域蓝山、益民花园、红石云顶花苑、金碧伦、和平花园、肉联厂宿舍、光明东区、博泰公寓、群乐里、居阳里、紫云轩、运通家园、未来城东方家园、东方花园、苏荷塘、锦瑞尚城、中房馨园、惜缘小区、俪水家园、安装公司、天和小区、格林郡府、管道局新六区、建宏小区、颖丽花园、解放8号、金源丽都、梅花公寓、圣泰新苑南区、圣泰新苑北区、王寨小区东小区";
	String[] abc_array = abc.split("、");
	String[] abc_array2 = abc_array;
	int j = 0;
	int h = 0;
	for (int i = 0; i < abc_array.length; i++) {
		j=0;
		for (int k = 0; k < abc_array2.length; k++) {
			if(abc_array[i].equals(abc_array2[k])){
				j++;
			}
		}
		if(j>=2){
			System.out.println(abc_array[i]);
			h++;
		}
	}
	System.out.println(h);
}
 	
}
